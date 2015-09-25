<?php

/**
* Map Connec Lead Person representation to/from SugarCRM Lead
*/
class LeadMapper extends BaseMapper {
  protected $organization_mapper = null;

  public function __construct() {
    parent::__construct();

    $this->connec_entity_name = 'Person';
    $this->local_entity_name = 'Lead';
    $this->connec_resource_name = 'people';
    $this->connec_resource_endpoint = 'people';

    $this->organization_mapper = new OrganizationMapper();
  }

  // Return the Person local id
  protected function getId($lead) {
    return $lead->id;
  }

  // Return a local Person by id
  protected function loadModelById($local_id) {
    $lead = new Lead();
    $lead->retrieve($local_id);
    return $lead;
  }

  // Return any existing Lead with same first name, last name and email
  public function matchLocalModel($lead_hash) {
    if(array_key_exists('address', $lead_hash['email'])) {
      $lead = new Lead();
      $lead_id = $lead->get_contact_id_by_email($lead_hash['email']['address']);
      if($lead_id) { return $this->loadModelById($lead_id); }
    }
  }

  protected function validate($lead_hash) {
    // Process only Leads
    return $lead_hash['is_lead'];
  }

  // Map the Connec resource attributes onto the SugarCRM Person
  protected function mapConnecResourceToModel($lead_hash, $lead) {
    // Map hash attributes to Person
    if(array_key_exists('title', $lead_hash)) { $lead->salutation = $lead_hash['title']; }
    if(array_key_exists('first_name', $lead_hash)) { $lead->first_name = $lead_hash['first_name']; }
    if(array_key_exists('last_name', $lead_hash)) { $lead->last_name = $lead_hash['last_name']; }
    if(array_key_exists('job_title', $lead_hash)) { $lead->title = $lead_hash['job_title']; }
    if(array_key_exists('description', $lead_hash)) { $lead->description = $lead_hash['description']; }
    if(array_key_exists('birth_date', $lead_hash)) { $lead->birthdate = $lead_hash['birth_date']; }

    if(array_key_exists('address', $lead_hash)) {
      if(array_key_exists('billing', $lead_hash['address'])) {
        $billing_address = $lead_hash['address']['billing'];
        if(array_key_exists('line1', $billing_address)) { $lead->primary_address_street = $billing_address['line1']; }
        if(array_key_exists('line2', $billing_address)) { $lead->primary_address_street_2 = $billing_address['line2']; }
        if(array_key_exists('city', $billing_address)) { $lead->primary_address_city = $billing_address['city']; }
        if(array_key_exists('region', $billing_address)) { $lead->primary_address_state = $billing_address['region']; }
        if(array_key_exists('postal_code', $billing_address)) { $lead->primary_address_postalcode = $billing_address['postal_code']; }
        if(array_key_exists('country', $billing_address)) { $lead->primary_address_country = $billing_address['country']; }
      }
      if(array_key_exists('shipping', $lead_hash['address'])) {
        $shipping_address = $lead_hash['address']['shipping'];
        if(array_key_exists('line1', $shipping_address)) { $lead->alt_address_street = $shipping_address['line1']; }
        if(array_key_exists('line2', $shipping_address)) { $lead->alt_address_street_2 = $shipping_address['line2']; }
        if(array_key_exists('city', $shipping_address)) { $lead->alt_address_city = $shipping_address['city']; }
        if(array_key_exists('region', $shipping_address)) { $lead->alt_address_state = $shipping_address['region']; }
        if(array_key_exists('postal_code', $shipping_address)) { $lead->alt_address_postalcode = $shipping_address['postal_code']; }
        if(array_key_exists('country', $shipping_address)) { $lead->alt_address_country = $shipping_address['country']; }
      }
    }

    // Map phones with precedence givent to work phones
    if(array_key_exists('phone_home', $lead_hash) && array_key_exists('landline', $lead_hash['phone_home'])) {
      $lead->phone_home = $lead_hash['phone_home']['landline'];
    }
    if(array_key_exists('phone_work', $lead_hash) && array_key_exists('landline', $lead_hash['phone_work'])) {
      $lead->phone_work = $lead_hash['phone_work']['landline'];
    }
    if(array_key_exists('phone_home', $lead_hash) && array_key_exists('mobile', $lead_hash['phone_home'])) {
      $lead->phone_mobile = $lead_hash['phone_home']['mobile'];
    } else if(array_key_exists('phone_work', $lead_hash) && array_key_exists('mobile', $lead_hash['phone_work'])) {
      $lead->phone_mobile = $lead_hash['phone_work']['mobile'];
    }
    if(array_key_exists('phone_home', $lead_hash) && array_key_exists('landline2', $lead_hash['phone_home'])) {
      $lead->phone_other = $lead_hash['phone_home']['landline2'];
    } else if(array_key_exists('phone_work', $lead_hash) && array_key_exists('landline2', $lead_hash['phone_work'])) {
      $lead->phone_other = $lead_hash['phone_work']['landline2'];
    }
    if(array_key_exists('phone_home', $lead_hash) && array_key_exists('fax', $lead_hash['phone_home'])) {
      $lead->phone_fax = $lead_hash['phone_home']['fax'];
    } else if(array_key_exists('phone_work', $lead_hash) && array_key_exists('fax', $lead_hash['phone_work'])) {
      $lead->phone_fax = $lead_hash['phone_work']['fax'];
    }

    if(array_key_exists('email', $lead_hash) && array_key_exists('address', $lead_hash['email'])) {
      $lead->email1 = $lead_hash['email']['address'];
    }
    if(array_key_exists('email', $lead_hash) && array_key_exists('address2', $lead_hash['email'])) {
      $lead->email2 = $lead_hash['email']['address2'];
    }

    // Map Organization
    if(array_key_exists('organization_id', $lead_hash)) {
      $mno_id_map = MnoIdMap::findMnoIdMapByMnoIdAndEntityName($lead_hash['organization_id'], 'ORGANIZATION', 'ACCOUNT');
      if($mno_id_map) { $lead->account_id = $mno_id_map['app_entity_id']; }
    }
  }

  // Map the SugarCRM Person to a Connec resource hash
  protected function mapModelToConnecResource($lead) {
    $lead_hash = array();

    if(!$this->is_set($lead->id)) {
      // Save as Lead
      $lead_hash['is_lead'] = true;
    }

    // Map attributes
    $lead_hash['title'] = $lead->salutation;
    $lead_hash['first_name'] = $lead->first_name;
    $lead_hash['last_name'] = $lead->last_name;
    $lead_hash['description'] = $lead->description;
    $lead_hash['job_title'] = $lead->title;
    if($this->is_set($lead->birthdate)) { $lead_hash['birth_date'] = $this->format_date_to_connec($lead->birthdate); }

    $address = array();
    $billing_address = array();
    $billing_address['line1'] = $lead->primary_address_street;
    $billing_address['line2'] = $lead->primary_address_street_2;
    $billing_address['city'] = $lead->primary_address_city;
    $billing_address['region'] = $lead->primary_address_state;
    $billing_address['postal_code'] = $lead->primary_address_postalcode;
    $billing_address['country'] = $lead->primary_address_country;
    if(!empty($billing_address)) { $address['billing'] = $billing_address; }

    $shipping_address = array();
    $shipping_address['line1'] = $lead->alt_address_street;
    $shipping_address['line2'] = $lead->alt_address_street_2;
    $shipping_address['city'] = $lead->alt_address_city;
    $shipping_address['region'] = $lead->alt_address_state;
    $shipping_address['postal_code'] = $lead->alt_address_postalcode;
    $shipping_address['country'] = $lead->alt_address_country;
    if(!empty($shipping_address)) { $address['shipping'] = $shipping_address; }
    if(!empty($address)) { $lead_hash['address_work'] = $address; }

    $phone_work_hash = array();
    $phone_work_hash['landline'] = $lead->phone_work;
    $phone_work_hash['landline2'] = $lead->phone_other;
    $phone_work_hash['fax'] = $lead->phone_fax;
    if(!empty($phone_work_hash)) { $lead_hash['phone_work'] = $phone_work_hash; }

    $phone_home_hash = array();
    $phone_home_hash['landline'] = $lead->phone_home;
    $phone_home_hash['mobile'] = $lead->phone_mobile;
    if(!empty($phone_home_hash)) { $lead_hash['phone_home'] = $phone_home_hash; }

    $email_hash = array();
    $email_hash['address'] = $lead->email1;
    $email_hash['address2'] = $lead->email2;
    if(!empty($email_hash)) { $lead_hash['email'] = $email_hash; }

    // Map Organization
    if($this->is_set($lead->account_id) && $lead->account_id != 0) {
      $organization_id = $this->organization_mapper->findConnecIdByLocalId($lead->account_id);
      if($organization_id) { $lead_hash['organization_id'] = $organization_id; }
    } else {
      $lead_hash['organization_id'] = '';
    }

    return $lead_hash;
  }

  // Persist the SugarCRM Person
  protected function persistLocalModel($lead, $lead_hash) {
    $lead->save(false, false);
  }
}