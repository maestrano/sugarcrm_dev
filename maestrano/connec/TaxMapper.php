<?php

/**
* Map Connec Tax Tax representation to/from SugarCRM Tax
*/
class TaxMapper extends BaseMapper {
  public function __construct() {
    parent::__construct();

    $this->connec_entity_name = 'TaxCode';
    $this->local_entity_name = 'TaxRecord';
    $this->connec_resource_name = 'tax_codes';
    $this->connec_resource_endpoint = 'tax_codes';
  }

  // Return the Tax local id
  protected function getId($tax) {
    return $tax->id;
  }

  // Return a local Tax by id
  protected function loadModelById($local_id) {
    return $this->findTaxById($local_id);
  }

  // Find Tax by name or create a new model
  protected function matchLocalModel($tax_hash) {
    $tax = $this->findTaxByLabel($tax_hash['name']);
    if(!$this->is_set($tax)) {
      $tax = (object) array();
    }
    return $tax;
  }

  // Name and Rate must be specified
  protected function validate($tax_hash) {
    return array_key_exists('name', $tax_hash) && array_key_exists('sale_tax_rate', $tax_hash);
  }

  // Map the Connec resource attributes onto the SugarCRM Tax
  protected function mapConnecResourceToModel($tax_hash, $tax) {
    if(array_key_exists('name', $tax_hash)) { $tax->name = $tax_hash['name']; }
    if(array_key_exists('sale_tax_rate', $tax_hash)) { $tax->rate = $tax_hash['sale_tax_rate']; }
  }

  // Map the SugarCRM Tax to a Connec resource hash
  protected function mapModelToConnecResource($tax) {
    $tax_hash = array();
    if($this->is_set($tax->name)) { $tax_hash['name'] = $tax->name; }
    if($this->is_set($tax->rate)) { $tax_hash['sale_tax_rate'] = $tax->rate; }
    return $tax_hash;
  }

  // Persist the SugarCRM Tax
  protected function persistLocalModel($tax, $tax_hash) {
    if(array_key_exists('id', $tax)) {
      $this->updateTaxType($tax->id, $tax->name, $tax->rate);
    } else {
      $tax_id = $this->insertTaxType($tax->name, $tax->rate);
      $tax->id = $tax_id;
    }
  }

  public function findTaxById($tax_id) {
    global $adb;
    $query = "SELECT * from mno_taxes WHERE id = '$tax_id'";
    $result = $adb->query($query);
    return (object) $adb->fetchByAssoc($result);
  }

  public function findTaxByLabel($tax_name) {
    global $adb;
    $query = "SELECT * from mno_taxes WHERE name = '$tax_name'";
    $result = $adb->query($query);
    return (object) $adb->fetchByAssoc($result);
  }

  private function insertTaxType($tax_name, $tax_rate) {
    global $adb;
    $guid = create_guid();
    $query = "INSERT INTO mno_taxes (id, name, date_entered, date_modified, modified_user_id, created_by, description, deleted, assigned_user_id, rate) VALUES (" . 
      $adb->quoted($guid) . ", " .
      $adb->quoted($tax_name) . ", UTC_TIMESTAMP, UTC_TIMESTAMP, NULL, NULL, NULL, false, NULL, " . $tax_rate . ")";
    $result = $adb->query($query);
    $adb->pquery($query);
    return $guid;
  }

  private function updateTaxType($tax_id, $tax_name, $tax_rate) {
    global $adb;
    $update_query = "UPDATE mno_taxes SET rate=? AND name=? WHERE id=?";
    $adb->pquery($update_query, array($tax_rate, $tax_name, $tax_id));
  }
}