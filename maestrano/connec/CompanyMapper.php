<?php

/**
* Map Connec Company representation to/from vTiger Company
*/
class CompanyMapper extends BaseMapper {
  public function __construct() {
    parent::__construct();

    $this->connec_entity_name = 'Company';
    $this->local_entity_name = 'Company';
    $this->connec_resource_name = 'company';
    $this->connec_resource_endpoint = 'company';
  }

  public function getId($company) {
    return null;
  }

  // Find by local id
  public function loadModelById($local_id) {
    return null;
  }

  // Create a standard object as Company is not mapped to a database entity
  public function matchLocalModel($company_hash) {
    return (object) array();
  }

  // Map the Connec resource attributes onto the vTiger Company
  protected function mapConnecResourceToModel($company_hash, $company) {
    global $adb;

    $company->name = $company_hash['name'];
    $company->logo = $company_hash['logo'];
  }

  // Map the vTiger Company to a Connec resource hash
  protected function mapModelToConnecResource($company) {
    $company_hash = array();

    // TODO: Map Company to Connec hash

    return $company_hash;
  }

  protected function persistLocalModel($company, $resource_hash) {
    // Set company name
    $admin = new Administration();
    $admin->retrieveSettings('system');
    $admin->saveSetting('system', 'name', $company->name);

    // Save logo
    $this->saveLogo($company);
  }

  protected function saveLogo($company) {
    $path = "upload/";
    if($this->is_set($company->logo)) {
      // Save logo file locally
      $filename = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 10) . '.jpg';
      $tmpLogoFilePath = $path . $filename;
      file_put_contents($tmpLogoFilePath, file_get_contents($company->logo));
      $configurator = new Configurator();
      $configurator->saveCompanyLogo($tmpLogoFilePath);
    }
  }
}