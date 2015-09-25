<?php

/**
* Map Connec Product representation to/from SugarCRM Product
*/
class ProductMapper extends BaseMapper {
  protected $companyMapper = null;

  public function __construct() {
    parent::__construct();

    $this->connec_entity_name = 'Product';
    $this->local_entity_name = 'oqc_Product';
    $this->connec_resource_name = 'items';
    $this->connec_resource_endpoint = 'items';

    $this->companyMapper = new CompanyMapper();
  }

  // Return the Product local id
  protected function getId($product) {
    return $product->getRootRevision()->id;
  }

  // Return a local Product by id
  protected function loadModelById($local_id) {
    $product = new oqc_Product();
    $product->retrieve($local_id);
    return $product->getHeadRevision();
  }

  protected function validate($product_hash) {
    // Process only Products
    return !array_key_exists('type', $product_hash) || $product_hash['type'] != 'SERVICE';
  }

  // Map the Connec resource attributes onto the SugarCRM Product
  protected function mapConnecResourceToModel($product_hash, $product) {
    // Map hash attributes to Product
    if(array_key_exists('name', $product_hash)) { $product->name = $product_hash['name']; }
    if(array_key_exists('description', $product_hash)) { $product->description = $product_hash['description']; }
    if(array_key_exists('serial_number', $product_hash)) { $product->svnumber = $product_hash['serial_number']; }
    if(array_key_exists('unit', $product_hash)) { $product->unit = $product_hash['unit']; }
    
    if(array_key_exists('sale_price', $product_hash)) {
      if(array_key_exists('net_amount', $product_hash['sale_price'])) { $product->price = $product_hash['sale_price']['net_amount']; }
    }

    if(array_key_exists('purchase_price', $product_hash)) {
      if(array_key_exists('net_amount', $product_hash['purchase_price'])) { $product->cost = $product_hash['purchase_price']['net_amount']; }
    }
  }

  // Map the SugarCRM Product to a Connec resource hash
  protected function mapModelToConnecResource($product) {
    $product_hash = array();

    if(!$this->is_set($product->id)) {
      // Save as Customer
      $product_hash['type'] = 'PURCHASED';
    }

    // Map attributes
    $product_hash['name'] = $product->name;
    $product_hash['description'] = $product->description;
    $product_hash['serial_number'] = $product->svnumber;
    $product_hash['unit'] = $product->unit;

    $product_hash['sale_price'] = array('net_amount' => $product->price);
    $product_hash['purchase_price'] = array('net_amount' => $product->cost);

    return $product_hash;
  }

  // Persist the SugarCRM Product
  protected function persistLocalModel($product, $product_hash) {
    $product->save(false, false, false);
  }
}