<?php

/**
 * Mno Invoice Class
 */
class MnoSoaInvoice extends MnoSoaBaseInvoice {
  protected $_local_entity_name = "INVOICE";

  protected function pushInvoice() {
    $this->_log->debug("start pushInvoice " . json_encode($this->_local_entity));

    $id = $this->getLocalEntityIdentifier();
    if (empty($id)) { return; }

    // Get previous versions IDs of the invoice
    $previous_invoices = $this->_local_entity->getAllPreviousRevisions();
    foreach ($previous_invoices as $previous_invoice) {
      $mno_id = $this->getMnoIdByLocalId($previous_invoice->id);
      // Relink previous ID to the new one
      if ($this->isValidIdentifier($mno_id)) {
        $this->_log->debug("relink invoice_id $previous_invoice->id from mno_id " . json_encode($mno_id));
        $this->_mno_soa_db_interface->relinkIdMapEntry($id, $previous_invoice->id, $this->_local_entity_name);
      }
    }

    $mno_id = $this->getMnoIdByLocalId($id);
    if ($this->isValidIdentifier($mno_id)) {
      $this->_log->debug(__FUNCTION__ . " this->getMnoIdByLocalId(id) = " . json_encode($mno_id));
      $this->_id = $mno_id->_id;
    }

    // Map invoice fields
    $this->_type = 'CUSTOMER';
    $this->_title = $this->push_set_or_delete_value($this->_local_entity->name);
    $this->_transaction_number = $this->push_set_or_delete_value($this->_local_entity->svnumber);
    $this->_public_note = $this->push_set_or_delete_value($this->_local_entity->description);

    $this->_transaction_date = strtotime($this->push_set_or_delete_value($this->_local_entity->startdate));
    $this->_due_date = strtotime($this->push_set_or_delete_value($this->_local_entity->enddate));
    $this->_amount = array("price" => $this->_local_entity->grand_total, "taxAmount" => $this->_local_entity->grand_total_vat, "netAmount" => $this->_local_entity->total_cost);

    // Map status
    $status = $this->_local_entity->status;
    $this->_status = 'DRAFT';
    if(isset($status)) {
      if($status == 'Sent') {
        $this->_status = 'SUBMITTED';
      } else if($status == 'Signed') {
        $this->_status = 'AUTHORISED';
      } else if($status == 'Completed') {
        $this->_status = 'PAID';
      } 
    }
    // Map Organization
    if(isset($this->_local_entity->company_id)) {
      $mno_oragnization_id = $this->getMnoIdByLocalIdName($this->_local_entity->company_id, "ACCOUNT");
      $this->_organization_id = $mno_oragnization_id->_id;
    }
    // Map Contact
    if(isset($this->_local_entity->clientcontact_id)) {
      $mno_person_id = $this->getMnoIdByLocalIdName($this->_local_entity->clientcontact_id, "CONTACT");
      $this->_person_id = $mno_person_id->_id;
    }
    
    // Map invoice lines
    $services = $this->_local_entity->get_linked_beans('oqc_service', 'oqc_Service');  
    $this->_log->debug("INVOICE SERVICES: " . json_encode($services));

    $this->_invoice_lines = array();
    if(!empty($services)) {
      foreach($services as $service) {
        $invoice_line = array();
        
        // Find mno id if already exists
        $active = true;
        $mno_invoice_line_id = $this->getMnoIdByLocalIdName($service->id, "INVOICE_LINE");
        if($this->isDeletedIdentifier($mno_invoice_line_id)) {
          $invoice_line_mno_id = $mno_invoice_line_id->_id;
          $active = false;
        } else if (!$this->isValidIdentifier($mno_invoice_line_id)) {
          // Generate and save ID
          $invoice_line_mno_id = $this->_id . "#" . uniqid();
          $this->_mno_soa_db_interface->addIdMapEntry($service->id, "INVOICE_LINE", $invoice_line_mno_id, "INVOICE_LINE");
        } else {
          $invoice_line_mno_id = $mno_invoice_line_id->_id;
        }

        $invoice_line_id_parts = explode("#", $invoice_line_mno_id);
        $invoice_line_mno_id = $invoice_line_id_parts[1];

        // Map Product
        $mno_item_id = $this->getMnoIdByLocalIdName($service->product_id, "PRODUCTS");
        $invoice_line['item']->id = $mno_item_id->_id;

        // Push line price
        $tax_rate = $service->oqc_vat * 100.0;
        $invoice_line['id'] = $invoice_line_mno_id;
        $invoice_line['lineNumber'] = intval($service->position);
        $invoice_line['description'] = $service->description;
        $invoice_line['quantity'] = intval($service->quantity);
        $invoice_line['reductionPercent'] = floatval($service->discount_value);

        $invoice_line['unitPrice'] = array();
        $invoice_line['unitPrice']['netAmount'] = floatval($service->price);
        $invoice_line['unitPrice']['taxRate'] = floatval($tax_rate);

        $invoice_line['totalPrice'] = array();
        $invoice_line['totalPrice']['netAmount'] = floatval($service->price * $service->quantity * (1.0 - $service->discount_value / 100.0));
        $invoice_line['totalPrice']['taxRate'] = floatval($tax_rate);

        // Map invoice line tax rate
        $invoice_line['taxCode']['id'] = $this->mapInvoiceLineTax($service->oqc_vat);

        $this->_invoice_lines[$invoice_line_mno_id] = $invoice_line;
      }
    }

    $this->_log->debug("after pushInvoice");
  }

  protected function pullInvoice() {
    $this->_log->debug("start " . __FUNCTION__ . " for " . json_encode($this->_id));
    
    if (!empty($this->_id)) {
      $local_id = $this->getLocalIdByMnoId($this->_id);
      $this->_log->debug(__FUNCTION__ . " this->getLocalIdByMnoId(this->_id) = " . json_encode($local_id));

      $this->_log->debug("processing supplier sale order");
      if ($this->isValidIdentifier($local_id)) {
        $this->_log->debug(__FUNCTION__ . " is STATUS_EXISTING_ID");
        $this->_local_entity = new oqc_Contract();
        $this->_local_entity->retrieve($local_id->_id);
        $status = constant('MnoSoaBaseEntity::STATUS_EXISTING_ID');
      } else if ($this->isDeletedIdentifier($local_id)) {
        $this->_log->debug(__FUNCTION__ . " is STATUS_DELETED_ID");
        $status = constant('MnoSoaBaseEntity::STATUS_DELETED_ID');
      } else {
        $this->_local_entity = new oqc_Contract();
        $this->_local_entity->version = 1;
        $this->_local_entity->shipment_terms = 'Default';
        
        $result = $this->_db->fetchByAssoc($this->_db->query("SELECT MAX(unique_identifier) FROM oqc_contract;"));
        $max_unique_identifier = $result["MAX(unique_identifier)"];
        $this->_local_entity->unique_identifier = $max_unique_identifier + 1;
        
        $status = constant('MnoSoaBaseEntity::STATUS_NEW_ID');
      }
    } else {
      // Unknown invoice type
      return constant('MnoSoaBaseEntity::STATUS_ERROR');
    }

    // Map invoice attributes
    $this->_local_entity->name = $this->pull_set_or_delete_value($this->_title);
    $this->_local_entity->svnumber = $this->pull_set_or_delete_value($this->_transaction_number);
    $this->_local_entity->description = $this->pull_set_or_delete_value($this->_public_note);
    if($this->_transaction_date) { $this->_local_entity->startdate = date('Y-m-d', $this->_transaction_date); }
    if($this->_due_date) { $this->_local_entity->enddate = date('Y-m-d', $this->_due_date); }
    
    // Map status
    if($this->_status == 'SUBMITTED') {
      $this->_local_entity->status = 'Sent';
    } else if($this->_status == 'AUTHORISED') {
      $this->_local_entity->status = 'Signed';
    } else if($this->_status == 'PAID') {
      $this->_local_entity->status = 'Completed';
    } else {
      $this->_local_entity->status = 'Draft';
    }

    // Map local organization
    if($this->_organization_id) {
      $local_id = $this->getLocalIdByMnoIdName($this->_organization_id, "organizations");
      if ($this->isValidIdentifier($local_id)) {
        $this->_log->debug(__FUNCTION__ . " organization local_id = " . json_encode($local_id));
        $this->_local_entity->company_id = $local_id->_id;
      } else {
        // Fetch remote Organization if missing
        $notification->entity = "organizations";
        $notification->id = $this->_organization_id;
        $organization = new MnoSoaOrganization($this->_db);   
        $status = $organization->receiveNotification($notification);
        if ($status) {
          $this->_local_entity->company_id = $organization->_local_entity->id;
        }
      }
    }

    // Map local contact
    if($this->_person_id) {
      $local_id = $this->getLocalIdByMnoIdName($this->_person_id, "persons");
      if ($this->isValidIdentifier($local_id)) {
        $this->_log->debug(__FUNCTION__ . " person local_id = " . json_encode($local_id));
        $this->_local_entity->clientcontact_id = $local_id->_id;
        $this->_local_entity->clienttechnicalcontact_id = $local_id->_id;
      } else {
        // Fetch remote person if missing
        $notification->entity = "persons";
        $notification->id = $this->_person_id;
        $person = new MnoSoaPerson($this->_db);   
        $status = $person->receiveNotification($notification);
        if ($status) {
          $this->_local_entity->clientcontact_id = $person->_local_entity->id;
          $this->_local_entity->clienttechnicalcontact_id = $person->_local_entity->id;
        }
      }
    }

    // Total amount
    $this->_local_entity->total_cost = $this->_amount->netAmount;
    $this->_local_entity->grand_total_vat = $this->_amount->taxAmount;
    $this->_local_entity->grand_total = $this->_amount->price;

    return $status;
  }

  protected function saveLocalEntity($push_to_maestrano, $status) {
    $this->_log->debug("start saveLocalEntity status=$status " . json_encode($this->_local_entity));
    $this->_local_entity->save(false, $push_to_maestrano);

    // Map invoice ID
    if ($status == constant('MnoSoaBaseEntity::STATUS_NEW_ID')) {
      $local_entity_id = $this->getLocalEntityIdentifier();
      $mno_entity_id = $this->_id;
      $this->addIdMapEntry($local_entity_id, $mno_entity_id);
    }

    $this->mapInvoiceLines();
  }

  protected function mapInvoiceLines() {
    $local_invoice_id = $this->getLocalEntityIdentifier();
    $mno_entity_id = $this->_id;

    $servicesTableName = 'oqc_service';
    $productsTableName = 'oqc_product';

    $local_invoice_lines = $this->_local_entity->$servicesTableName->get();
    $this->_log->debug("existing invoice lines ids: " . json_encode($local_invoice_lines));

    // Map invoice lines
    if(!empty($this->_invoice_lines)) {
      $processed_lines_local_ids = array();

      foreach($this->_invoice_lines as $line_id => $line) {
        $description = $line->description;

        // Map item
        if(!empty($line->item)) {
          $local_item_id = $this->getLocalIdByMnoIdName($line->item->id, "ITEMS");
          $product_id = $local_item_id->_id;

          $product = new oqc_Product();
          $product->retrieve($product_id);
          $name = $product->name;
        } else {
          $product_id = null;
          $name = null;
        }

        $unit_price = floatval($line->unitPrice->netAmount);
        $quantity = floatval($line->quantity);
        $discount = floatval($line->reductionPercent);
        $line_number = intval($line->lineNumber);

        $taxable = (isset($line->unitPrice->taxRate) && $line->unitPrice->taxRate > 0);
        $tax_rate_100 = $line->unitPrice->taxRate / 100.0;
        $unit = 'pieces';
        $recurrence = 'once';
        $discount_type = 'rel';
        $currency = -99;

        // Fetch existing invoice line
        $mno_invoice_line_id = $this->_id . "#" . $line_id;
        $invoice_line_id_map = $this->getLocalIdByMnoIdName($mno_invoice_line_id, "INVOICE_LINE");
        if ($this->isValidIdentifier($invoice_line_id_map)) {
          // Fetch existing service
          $invoice_line_local_id = $invoice_line_id_map->_id;
          $service = new oqc_Service();
          $service->retrieve($invoice_line_local_id);

          // Udpate service
          $service->product_id = (null == $product_id) ? '' : $product_id;
          $service->quantity = (null == $quantity) ? 1 : $quantity;
          $service->price = (null == $unit_price) ? 0.0 : $unit_price;
          $service->name = (null == $name) ? '' : $name;
          $service->description = (null == $description) ? '' : $description;
          $service->vat = (true == $taxable) ? true : false;
          $service->oqc_vat = $tax_rate_100;
          $service->zeitbezug = (null == $recurrence) ? 'once' : $recurrence;
          $service->unit = (null == $unit) ? 'pieces' : $unit;
          $service->discount_value = $discount;
          $service->discount_select = $discount_type;
          $service->position = $line_number;
          $service->service_currency_id = $currency;
          $service->save();
        } else {
          // Create new service
          $service = new oqc_Service($product_id, $unit_price, $quantity, $name, $description, $taxable, $recurrence, $unit, $discount, $discount_type, $line_number, $currency);
          $service->oqc_vat = $tax_rate_100;
          $service->save();
          $this->_local_entity->$servicesTableName->add($service->id);
          $this->_local_entity->$productsTableName->add($product_id);
          // Map invoice line ID
          $this->_mno_soa_db_interface->addIdMapEntry($service->id, "INVOICE_LINE", $mno_invoice_line_id, "INVOICE_LINE");
        }

        // Keep track of received line IDs to remove missing ones
        array_push($processed_lines_local_ids, $service->id);
      }

      // Delete local invoice lines that have been removed
      $this->_log->debug("Processed invoice lines " . json_encode($processed_lines_local_ids));
      foreach ($local_invoice_lines as $local_invoice_line_id) {
        if(!in_array($local_invoice_line_id, $processed_lines_local_ids)) {
          $this->_log->debug("Deleting invoice line " . json_encode($local_invoice_line_id));
          $this->_local_entity->$servicesTableName->delete($local_invoice_id, $local_invoice_line_id);
          $this->_mno_soa_db_interface->deleteIdMapEntry($local_invoice_line_id, 'INVOICE_LINE');
        }
      }
    }
  }

  public function getLocalEntityIdentifier() {
    return $this->_local_entity->id;
  }

  protected function mapInvoiceLineTax($oqc_vat) {
    // SugarCRM stores only the tax rate against product, find first tax matching rate
    $mno_tax = new MnoSoaTax($this->_db, $this->_log);
    $taxes = $mno_tax->getAllTaxes();
    foreach ($taxes as $tax) {
      // Find first tax matching rate
      $oqc_tax_rate = floatval($tax['rate']) / 100.0;
      if($oqc_tax_rate == $oqc_vat) {
        $mno_id = $this->getMnoIdByLocalIdName($tax['id'], 'TAX');
        if(isset($mno_id)) {
          return $mno_id->_id;
        }
      }
    }
    return null;
  }
}

?>