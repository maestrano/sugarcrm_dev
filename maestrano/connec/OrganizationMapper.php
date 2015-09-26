<?php

/**
* Map Connec Organization representation to/from SugarCRM Account
*/
class OrganizationMapper extends BaseMapper {
  public function __construct() {
    parent::__construct();

    $this->connec_entity_name = 'Organization';
    $this->local_entity_name = 'Account';
    $this->connec_resource_name = 'organizations';
    $this->connec_resource_endpoint = 'organizations';
  }

  // Return the Organization local id
  protected function getId($organization) {
    return $organization->id;
  }

  // Return a local Organization by id
  protected function loadModelById($local_id) {
    $organization = new Account();
    $organization->retrieve($local_id);
    return $organization;
  }

  protected function validate($resource_hash) {
    // Process only Customers
    return $resource_hash['is_customer'];
  }

  // Map the Connec resource attributes onto the SugarCRM Organization
  protected function mapConnecResourceToModel($organization_hash, $organization) {
    // Map hash attributes to Organization
    if(array_key_exists('name', $organization_hash)) { $organization->name = $organization_hash['name']; }
    if(array_key_exists('description', $organization_hash)) { $organization->description = $organization_hash['description']; }
    if(array_key_exists('industry', $organization_hash)) { $organization->industry = $organization_hash['industry']; }
    if(array_key_exists('annual_revenue', $organization_hash)) { $organization->annual_revenue = $organization_hash['annual_revenue']; }
    if(array_key_exists('reference', $organization_hash)) { $organization->sic_code = $organization_hash['reference']; }
    if(array_key_exists('number_of_employees', $organization_hash)) { $organization->employees = $organization_hash['number_of_employees']; }

    if(array_key_exists('address', $organization_hash)) {
      if(array_key_exists('billing', $organization_hash['address'])) {
        $billing_address = $organization_hash['address']['billing'];
        if(array_key_exists('line1', $billing_address)) { $organization->billing_address_street = $billing_address['line1']; }
        if(array_key_exists('line2', $billing_address)) { $organization->billing_address_street_2 = $billing_address['line2']; }
        if(array_key_exists('city', $billing_address)) { $organization->billing_address_city = $billing_address['city']; }
        if(array_key_exists('region', $billing_address)) { $organization->billing_address_state = $billing_address['region']; }
        if(array_key_exists('postal_code', $billing_address)) { $organization->billing_address_postalcode = $billing_address['postal_code']; }
        if(array_key_exists('country', $billing_address)) { $organization->billing_address_country = $billing_address['country']; }
      }
      if(array_key_exists('shipping', $organization_hash['address'])) {
        $shipping_address = $organization_hash['address']['shipping'];
        if(array_key_exists('line1', $shipping_address)) { $organization->shipping_address_street = $shipping_address['line1']; }
        if(array_key_exists('line2', $shipping_address)) { $organization->shipping_address_street_2 = $shipping_address['line2']; }
        if(array_key_exists('city', $shipping_address)) { $organization->shipping_address_city = $shipping_address['city']; }
        if(array_key_exists('region', $shipping_address)) { $organization->shipping_address_state = $shipping_address['region']; }
        if(array_key_exists('postal_code', $shipping_address)) { $organization->shipping_address_postalcode = $shipping_address['postal_code']; }
        if(array_key_exists('country', $shipping_address)) { $organization->shipping_address_country = $shipping_address['country']; }
      }
    }

    if(array_key_exists('phone', $organization_hash)) {
      if(array_key_exists('landline', $organization_hash['phone'])) { $organization->phone_office = $organization_hash['phone']['landline']; }
      if(array_key_exists('landline2', $organization_hash['phone'])) { $organization->phone_alternate = $organization_hash['phone']['landline2']; }
      if(array_key_exists('fax', $organization_hash['phone'])) { $organization->phone_fax = $organization_hash['phone']['fax']; }
    }

    if(array_key_exists('address', $organization_hash['email'])) { $organization->email1 = $organization_hash['email']['address']; }
    if(array_key_exists('address2', $organization_hash['email'])) { $organization->email2 = $organization_hash['email']['address2']; }
    if(array_key_exists('url', $organization_hash['website'])) { $organization->website = $organization_hash['website']['url']; }
  }

  // Map the SugarCRM Organization to a Connec resource hash
  protected function mapModelToConnecResource($organization) {
    $organization_hash = array();

    if(!$this->is_set($organization->id)) {
      // Save as Customer
      $organization_hash['is_customer'] = true;
    }
    
    // Map attributes
    $organization_hash['name'] = $organization->name;
    $organization_hash['description'] = $organization->description;
    $organization_hash['industry'] = $organization->industry;
    $organization_hash['annual_revenue'] = $organization->annual_revenue;
    $organization_hash['reference'] = $organization->sic_code;
    $organization_hash['number_of_employees'] = $organization->employees;
    
    $address = array();
    $billing_address = array();
    $billing_address['line1'] = $organization->billing_address_street;
    $billing_address['line2'] = $organization->billing_address_street_2;
    $billing_address['city'] = $organization->billing_address_city;
    $billing_address['region'] = $organization->billing_address_state;
    $billing_address['postal_code'] = $organization->billing_address_postalcode;
    $billing_address['country'] = $organization->billing_address_country;
    if(!empty($billing_address)) { $address['billing'] = $billing_address; }

    $shipping_address = array();
    $shipping_address['line1'] = $organization->shipping_address_street;
    $shipping_address['line2'] = $organization->shipping_address_street_2;
    $shipping_address['city'] = $organization->shipping_address_city;
    $shipping_address['region'] = $organization->shipping_address_state;
    $shipping_address['postal_code'] = $organization->shipping_address_postalcode;
    $shipping_address['country'] = $organization->shipping_address_country;
    if(!empty($shipping_address)) { $address['shipping'] = $shipping_address; }
    if(!empty($address)) { $organization_hash['address'] = $address; }

    
    $phone_hash = array();
    if($this->is_set($organization->phone_office)) { $phone_hash['landline'] = $organization->phone_office; }
    if($this->is_set($organization->phone_alternate)) { $phone_hash['landline2'] = $organization->phone_alternate; }
    if($this->is_set($organization->phone_fax)) { $phone_hash['fax'] = $organization->phone_fax; }
    if(!empty($phone_hash)) { $organization_hash['phone'] = $phone_hash; }

    $email_hash = array();
    if($this->is_set($organization->email1)) { $email_hash['address'] = $organization->email1; }
    if($this->is_set($organization->email2)) { $email_hash['address2'] = $organization->email2; }
    if(!empty($email_hash)) { $organization_hash['email'] = $email_hash; }

    if($this->is_set($organization->website)) { $organization_hash['website'] = array('url' => $organization->website); }

    return $organization_hash;
  }

  // Persist the SugarCRM Organization
  protected function persistLocalModel($organization, $resource_hash) {
    $organization->save(false, false);
  }
}