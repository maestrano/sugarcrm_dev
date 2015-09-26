<?php

/**
* Map Connec Customer Person representation to/from SugarCRM Contact
*/
class ContactMapper extends BaseMapper {
  protected $organization_mapper = null;

  public function __construct() {
    parent::__construct();

    $this->connec_entity_name = 'Person';
    $this->local_entity_name = 'Contact';
    $this->connec_resource_name = 'people';
    $this->connec_resource_endpoint = 'people';

    $this->organization_mapper = new OrganizationMapper();
  }

  // Return the Person local id
  protected function getId($person) {
    return $person->id;
  }

  // Return a local Person by id
  protected function loadModelById($local_id) {
    $person = new Contact();
    $person->retrieve($local_id);
    return $person;
  }

  // Return any existing Contact with same first name, last name and email
  public function matchLocalModel($person_hash) {
    if(array_key_exists('address', $person_hash['email'])) {
      $person = new Contact();
      $person_id = $person->get_contact_id_by_email($person_hash['email']['address']);
      if($person_id) { return $this->loadModelById($person_id); }
    }
  }

  protected function validate($resource_hash) {
    // Process only Customers
    return $resource_hash['is_customer'];
  }

  // Map the Connec resource attributes onto the SugarCRM Person
  protected function mapConnecResourceToModel($person_hash, $person) {
    // Map hash attributes to Person
    if(array_key_exists('title', $person_hash)) { $person->salutation = $person_hash['title']; }
    if(array_key_exists('first_name', $person_hash)) { $person->first_name = $person_hash['first_name']; }
    if(array_key_exists('last_name', $person_hash)) { $person->last_name = $person_hash['last_name']; }
    if(array_key_exists('job_title', $person_hash)) { $person->title = $person_hash['job_title']; }
    if(array_key_exists('description', $person_hash)) { $person->description = $person_hash['description']; }
    if(array_key_exists('birth_date', $person_hash)) { $person->birthdate = $person_hash['birth_date']; }

    if(array_key_exists('address', $person_hash)) {
      if(array_key_exists('billing', $person_hash['address'])) {
        $billing_address = $person_hash['address']['billing'];
        if(array_key_exists('line1', $billing_address)) { $person->primary_address_street = $billing_address['line1']; }
        if(array_key_exists('line2', $billing_address)) { $person->primary_address_street_2 = $billing_address['line2']; }
        if(array_key_exists('city', $billing_address)) { $person->primary_address_city = $billing_address['city']; }
        if(array_key_exists('region', $billing_address)) { $person->primary_address_state = $billing_address['region']; }
        if(array_key_exists('postal_code', $billing_address)) { $person->primary_address_postalcode = $billing_address['postal_code']; }
        if(array_key_exists('country', $billing_address)) { $person->primary_address_country = $billing_address['country']; }
      }
      if(array_key_exists('shipping', $person_hash['address'])) {
        $shipping_address = $person_hash['address']['shipping'];
        if(array_key_exists('line1', $shipping_address)) { $person->alt_address_street = $shipping_address['line1']; }
        if(array_key_exists('line2', $shipping_address)) { $person->alt_address_street_2 = $shipping_address['line2']; }
        if(array_key_exists('city', $shipping_address)) { $person->alt_address_city = $shipping_address['city']; }
        if(array_key_exists('region', $shipping_address)) { $person->alt_address_state = $shipping_address['region']; }
        if(array_key_exists('postal_code', $shipping_address)) { $person->alt_address_postalcode = $shipping_address['postal_code']; }
        if(array_key_exists('country', $shipping_address)) { $person->alt_address_country = $shipping_address['country']; }
      }
    }

    // Map phones with precedence givent to work phones
    if(array_key_exists('phone_home', $person_hash) && array_key_exists('landline', $person_hash['phone_home'])) {
      $person->phone_home = $person_hash['phone_home']['landline'];
    }
    if(array_key_exists('phone_work', $person_hash) && array_key_exists('landline', $person_hash['phone_work'])) {
      $person->phone_work = $person_hash['phone_work']['landline'];
    }
    if(array_key_exists('phone_home', $person_hash) && array_key_exists('mobile', $person_hash['phone_home'])) {
      $person->phone_mobile = $person_hash['phone_home']['mobile'];
    } else if(array_key_exists('phone_work', $person_hash) && array_key_exists('mobile', $person_hash['phone_work'])) {
      $person->phone_mobile = $person_hash['phone_work']['mobile'];
    }
    if(array_key_exists('phone_home', $person_hash) && array_key_exists('landline2', $person_hash['phone_home'])) {
      $person->phone_other = $person_hash['phone_home']['landline2'];
    } else if(array_key_exists('phone_work', $person_hash) && array_key_exists('landline2', $person_hash['phone_work'])) {
      $person->phone_other = $person_hash['phone_work']['landline2'];
    }
    if(array_key_exists('phone_home', $person_hash) && array_key_exists('fax', $person_hash['phone_home'])) {
      $person->phone_fax = $person_hash['phone_home']['fax'];
    } else if(array_key_exists('phone_work', $person_hash) && array_key_exists('fax', $person_hash['phone_work'])) {
      $person->phone_fax = $person_hash['phone_work']['fax'];
    }

    if(array_key_exists('email', $person_hash) && array_key_exists('address', $person_hash['email'])) {
      $person->email1 = $person_hash['email']['address'];
    }
    if(array_key_exists('email', $person_hash) && array_key_exists('address2', $person_hash['email'])) {
      $person->email2 = $person_hash['email']['address2'];
    }

    // Map Organization
    if(array_key_exists('organization_id', $person_hash)) {
      $mno_id_map = MnoIdMap::findMnoIdMapByMnoIdAndEntityName($person_hash['organization_id'], 'ORGANIZATION', 'ACCOUNT');
      if($mno_id_map) { $person->account_id = $mno_id_map['app_entity_id']; }
    }
  }

  // Map the SugarCRM Person to a Connec resource hash
  protected function mapModelToConnecResource($person) {
    $person_hash = array();

    if(!$this->is_set($person->id)) {
      // Save as Customer
      $person_hash['is_customer'] = true;
    }

    // Map attributes
    $person_hash['title'] = $person->salutation;
    $person_hash['first_name'] = $person->first_name;
    $person_hash['last_name'] = $person->last_name;
    $person_hash['description'] = $person->description;
    $person_hash['job_title'] = $person->title;
    if($this->is_set($person->birthdate)) { $person_hash['birth_date'] = $this->format_date_to_connec($person->birthdate); }

    $address = array();
    $billing_address = array();
    $billing_address['line1'] = $person->primary_address_street;
    $billing_address['line2'] = $person->primary_address_street_2;
    $billing_address['city'] = $person->primary_address_city;
    $billing_address['region'] = $person->primary_address_state;
    $billing_address['postal_code'] = $person->primary_address_postalcode;
    $billing_address['country'] = $person->primary_address_country;
    if(!empty($billing_address)) { $address['billing'] = $billing_address; }

    $shipping_address = array();
    $shipping_address['line1'] = $person->alt_address_street;
    $shipping_address['line2'] = $person->alt_address_street_2;
    $shipping_address['city'] = $person->alt_address_city;
    $shipping_address['region'] = $person->alt_address_state;
    $shipping_address['postal_code'] = $person->alt_address_postalcode;
    $shipping_address['country'] = $person->alt_address_country;
    if(!empty($shipping_address)) { $address['shipping'] = $shipping_address; }
    if(!empty($address)) { $person_hash['address_work'] = $address; }

    $phone_work_hash = array();
    $phone_work_hash['landline'] = $person->phone_work;
    $phone_work_hash['landline2'] = $person->phone_other;
    $phone_work_hash['fax'] = $person->phone_fax;
    if(!empty($phone_work_hash)) { $person_hash['phone_work'] = $phone_work_hash; }

    $phone_home_hash = array();
    $phone_home_hash['landline'] = $person->phone_home;
    $phone_home_hash['mobile'] = $person->phone_mobile;
    if(!empty($phone_home_hash)) { $person_hash['phone_home'] = $phone_home_hash; }

    $email_hash = array();
    $email_hash['address'] = $person->email1;
    $email_hash['address2'] = $person->email2;
    if(!empty($email_hash)) { $person_hash['email'] = $email_hash; }

    // Map Organization
    if($this->is_set($person->account_id) && $person->account_id != 0) {
      $organization_id = $this->organization_mapper->findConnecIdByLocalId($person->account_id);
      if($organization_id) { $person_hash['organization_id'] = $organization_id; }
    } else {
      $person_hash['organization_id'] = '';
    }

    return $person_hash;
  }

  // Persist the SugarCRM Person
  protected function persistLocalModel($person, $resource_hash) {
    $person->save(false, false);
  }
}