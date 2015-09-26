<?php

/**
* Map Connec Invoice representation to/from SugarCRM Contract
*/
class InvoiceMapper extends TransactionMapper {
  private $invoice_status_mapping = null;
  private $invoice_status_mapping_reverse = null;

  public function __construct() {
    parent::__construct();

    $this->connec_entity_name = 'Invoice';
    $this->local_entity_name = 'oqc_Contract';
    $this->connec_resource_name = 'invoices';
    $this->connec_resource_endpoint = 'invoices';

    $this->invoice_status_mapping = array('DRAFT' => 'Draft', 'SUBMITTED' => 'Sent', 'AUTHORISED' => 'Signed', 'PAID' => 'Completed');
    $this->invoice_status_mapping_reverse = array('Draft' => 'DRAFT', 'Sent' => 'SUBMITTED', 'Signed' => 'AUTHORISED', 'Completed' => 'PAID');
  }

  protected function validate($invoice_hash) {
    // Process only Customer Invoices
    return $invoice_hash['type'] == 'CUSTOMER';
  }

  // Map the Connec resource attributes onto the SugarCRM Contract
  protected function mapConnecResourceToModel($invoice_hash, $invoice) {
    parent::mapConnecResourceToModel($invoice_hash, $invoice);

    // Map status
    $invoice->status = $this->invoice_status_mapping[$invoice_hash['status']];
  }

  // Map the SugarCRM Contract to a Connec resource hash
  protected function mapModelToConnecResource($invoice) {
    $invoice_hash = parent::mapModelToConnecResource($invoice);

    // Default invoice type to CUSTOMER on creation
    $invoice_hash['type'] = 'CUSTOMER';

    // Map status
    $invoice_hash['status'] = $this->invoice_status_mapping_reverse[$invoice->status];

    // Map Invoice lines
    $local_invoice_lines = $invoice->get_linked_beans('oqc_service', 'oqc_Service');
    if(!empty($local_invoice_lines)) {
      $invoice_lines_hashes = array();
      $invoice_line_mapper = new InvoiceLineMapper($invoice, $invoice_hash);
      foreach($local_invoice_lines as $invoice_line) {
        array_push($invoice_lines_hashes, $invoice_line_mapper->mapModelToConnecResource($invoice_line));
      }
      $invoice_hash['lines'] = $invoice_lines_hashes;
    }

    return $invoice_hash;
  }

  // Persist the SugarCRM Invoice
  protected function persistLocalModel($invoice, $invoice_hash) {
    $invoice->save(false, false);

    // Persist invoice lines
    if(!empty($invoice_hash['lines'])) {
      $processed_lines_local_ids = array();

      foreach($invoice_hash['lines'] as $invoice_line_hash) {
        $invoice_line_mapper = new InvoiceLineMapper($invoice, $invoice_hash);
        $invoice_line = $invoice_line_mapper->saveConnecResource($invoice_line_hash);
        array_push($processed_lines_local_ids, $invoice_line_mapper->getId($invoice_line));
      }

      // Delete local invoice lines that have been removed
      $local_invoice_lines = $invoice->get_linked_beans('oqc_service', 'oqc_Service');
      foreach ($local_invoice_lines as $local_invoice_line) {
        if(!in_array($local_invoice_line->id, $processed_lines_local_ids)) {
          $invoice->oqc_service->delete($invoice->id, $local_invoice_line->id);
          MnoIdMap::hardDeleteMnoIdMap($local_invoice_line->id, 'INVOICE_LINE');
        }
      }
    }
  }

  // Map invoice lines IDs from Connec! to the local ones
  public function processConnecResponse($invoice_hash, $invoice) {
    $invoice_line_mapper = new InvoiceLineMapper($invoice, $invoice_hash);
    $invoice_lines = $invoice->get_linked_beans('oqc_service', 'oqc_Service');
    if(count($invoice_lines) != count($invoice_hash['lines'])) return $invoice;
    
    $index = 0;
    foreach ($invoice_hash['lines'] as $invoice_line_hash) {
      $invoice_line = $invoice_lines[$index];
      $invoice_line_mapper->findOrCreateIdMap($invoice_line_hash, $invoice_line);
      $index++;
    }

    return $invoice;
  }
}