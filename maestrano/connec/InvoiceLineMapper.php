<?php

/**
* Map Connec Invoice Line representation to/from SugarCRM oqc_Service
*/
class InvoiceLineMapper extends BaseMapper {
  protected $product_mapper = null;
  protected $tax_mapper = null;
  protected $invoice_mapper = null;

  private $invoice = null;
  private $invoice_hash = null;

  public function __construct($invoice=null, $invoice_hash=null) {
    parent::__construct();

    $this->connec_entity_name = 'InvoiceLine';
    $this->local_entity_name = 'oqc_Service';
    $this->connec_resource_name = 'invoices/lines';
    $this->connec_resource_endpoint = 'invoices/lines';

    $this->product_mapper = new ProductMapper();
    $this->tax_mapper = new TaxMapper();
    $this->invoice_mapper = new InvoiceMapper();

    $this->invoice = $invoice;
    $this->invoice_hash = $invoice_hash;
  }

  // Invoice Line ID
  protected function getId($invoice_line) {
    // return $invoice_line->id;
    return $this->invoice_mapper->getId($this->invoice) . "#" . $invoice_line->position;
  }

  // Prefix the Invoice Line ID with the Invoice ID to ensure unicity
  protected function getConnecResourceId($invoice_line_hash) {
    return $this->invoice_hash['id'] . "#" . $invoice_line_hash['id'];
  }

  // Return a local Contract Line by id
  protected function loadModelById($local_id) {
    $invoice_line = parent::instanciateModel();
    $invoice_line->retrieve($local_id);
    return $invoice_line;
  }

  // Map the Connec resource attributes onto the SugarCRM Contract Line
  protected function mapConnecResourceToModel($line_hash, $invoice_line) {
    // Map item
    $product_id = $name = null;
    if(array_key_exists('item_id', $line_hash)) {
      $product = $this->product_mapper->loadModelByConnecId($line_hash['item_id']);
      if($product) {
        $product_id = $this->product_mapper->getId($product);
        $name = $product->name;;
      }
    }

    // Map invoice line attributes
    $description = $line_hash['description'];
    $unit_price = floatval($line_hash['unit_price']['net_amount']);
    $quantity = floatval($line_hash['quantity']);
    $discount = floatval($line_hash['reduction_percent']);
    $line_number = intval($line_hash['line_number']);

    $taxable = (array_key_exists('tax_rate', $line_hash['unit_price']) && $line_hash['unit_price']['tax_rate'] > 0);
    $tax_rate_100 = $line_hash['unit_price']['tax_rate'] / 100.0;
    $unit = 'pieces';
    $recurrence = 'once';
    $discount_type = 'rel';
    $currency = -99;

    $invoice_line->product_id = (null == $product_id) ? '' : $product_id;
    $invoice_line->quantity = (null == $quantity) ? 1 : $quantity;
    $invoice_line->price = (null == $unit_price) ? 0.0 : $unit_price;
    $invoice_line->name = (null == $name) ? '' : $name;
    $invoice_line->description = (null == $description) ? '' : $description;
    $invoice_line->vat = (true == $taxable) ? true : false;
    $invoice_line->oqc_vat = $tax_rate_100;
    $invoice_line->zeitbezug = (null == $recurrence) ? 'once' : $recurrence;
    $invoice_line->unit = (null == $unit) ? 'pieces' : $unit;
    $invoice_line->discount_value = $discount;
    $invoice_line->discount_select = $discount_type;
    $invoice_line->position = $line_number;
    $invoice_line->service_currency_id = $currency;
  }

  // Map the SugarCRM Invoice to a Connec resource hash
  protected function mapModelToConnecResource($invoice_line) {
    $invoice_line_hash = array();

    // Find Connec! ID
    $line_id = $this->getId($invoice_line);
    $mno_id = MnoIdMap::findMnoIdMapByLocalIdAndEntityName($line_id, $this->local_entity_name);
    if($mno_id) {
      $transaction_line_id_parts = explode("#", $mno_id['mno_entity_guid']);
      $invoice_line_hash['id'] = $transaction_line_id_parts[1];
    }

    $line_description = $invoice_line->description;

    // Map Product
    if(isset($invoice_line->product_id)) {
      $product = $this->product_mapper->loadModelById($invoice_line->product_id);
      $product_id = $this->product_mapper->getId($product);
      $item_id = $this->product_mapper->findConnecIdByLocalId($product_id);
      $invoice_line_hash['item_id'] = $item_id;

      if(!$this->is_set($line_description)) { $line_description =  $product->name; }
    }

    // Push line price
    $tax_rate = $invoice_line->oqc_vat * 100.0;
    $invoice_line_hash['line_number'] = intval($invoice_line->position);
    $invoice_line_hash['description'] = $line_description;
    $invoice_line_hash['quantity'] = intval($invoice_line->quantity);
    $invoice_line_hash['reduction_percent'] = floatval($invoice_line->discount_value);

    $invoice_line_hash['unit_price'] = array();
    $invoice_line_hash['unit_price']['net_amount'] = floatval($invoice_line->price);
    $invoice_line_hash['unit_price']['tax_rate'] = floatval($tax_rate);

    $invoice_line_hash['total_price'] = array();
    $invoice_line_hash['total_price']['net_amount'] = floatval($invoice_line->price * $invoice_line->quantity * (1.0 - $invoice_line->discount_value / 100.0));
    $invoice_line_hash['total_price']['tax_rate'] = floatval($tax_rate);

    // Map invoice line tax rate
    $tax = $this->tax_mapper->findTaxByRate($tax_rate);
    if($tax) { $invoice_line_hash['tax_code_id'] = $this->tax_mapper->getId($tax); }

    return $invoice_line_hash;
  }

  // Persist the SugarCRM InvoiceLine
  protected function persistLocalModel($invoice_line, $invoice_line_hash) {
    $is_new = is_null($invoice_line->id);
    
    $invoice_line->save();

    if($is_new) {
      $this->invoice->oqc_service->add($invoice_line->id);
      $this->invoice->oqc_product->add($invoice_line->product_id);
    }
  }
}