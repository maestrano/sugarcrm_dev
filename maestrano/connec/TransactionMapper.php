<?php

/**
* Base mapper for transactions (quote, invoice, sales order, purchase order)
*/
class TransactionMapper extends BaseMapper {
  protected $contact_mapper = null;
  protected $organization_mapper = null;

  public function __construct() {
    parent::__construct();

    $this->connec_entity_name = 'Transaction';
    $this->local_entity_name = 'Transaction';
    $this->connec_resource_name = 'transactions';
    $this->connec_resource_endpoint = 'transactions';

    $this->contact_mapper = new ContactMapper();
    $this->organization_mapper = new OrganizationMapper();
  }

  // Return the Transaction root version id
  protected function getId($transaction) {
    return $transaction->getRootRevision()->id;
  }

  // Return a local Transaction by id
  protected function loadModelById($local_id) {
    $invoice = new $this->local_entity_name();
    $invoice->retrieve($local_id);
    return $invoice->getHeadRevision();
  }

  // Create a new instance of transaction with default attributes
  public function instanciateModel() {
    $transaction = parent::instanciateModel();
    $transaction->version = 1;
    $transaction->shipment_terms = 'Default';

    return $transaction;
  }

  // Map the Connec resource attributes onto the SugarCRM Transaction
  protected function mapConnecResourceToModel($transaction_hash, $transaction) {
    // Map attributes
    if(array_key_exists('title', $transaction_hash)) { $transaction->name = $transaction_hash['title']; }
    if(array_key_exists('transaction_number', $transaction_hash)) { $transaction->svnumber = $transaction_hash['transaction_number']; }
    if(array_key_exists('description', $transaction_hash)) { $transaction->description = $transaction_hash['description']; }

    if(array_key_exists('transaction_date', $transaction_hash)) { $transaction->startdate = $this->format_date_to_php($transaction_hash['transaction_date']); }
    if(array_key_exists('due_date', $transaction_hash)) { $transaction->enddate = $this->format_date_to_php($transaction_hash['due_date']); }

    if(array_key_exists('amount', $transaction_hash)) {
      if(array_key_exists('net_amount', $transaction_hash['amount'])) { $transaction->total_cost = $transaction_hash['amount']['net_amount']; }
      if(array_key_exists('tax_amount', $transaction_hash['amount'])) { $transaction->grand_total_vat = $transaction_hash['amount']['tax_amount']; }
      if(array_key_exists('total_amount', $transaction_hash['amount'])) { $transaction->grand_total = $transaction_hash['amount']['total_amount']; }
    }

    // Map Organization
    if(array_key_exists('organization_id', $transaction_hash)) {
      $organization = $this->organization_mapper->loadModelByConnecId($transaction_hash['organization_id']);
      if($organization) { $transaction->company_id = $this->organization_mapper->getId($organization); }
    }

    // Map Contact
    if(array_key_exists('person_id', $transaction_hash)) {
      $person = $this->contact_mapper->loadModelByConnecId($transaction_hash['person_id']);
      if($person) {
        $transaction->clientcontact_id = $this->contact_mapper->getId($person);
        $transaction->clienttechnicalcontact_id = $this->contact_mapper->getId($person);
      }
    }
  }

  // Map the SugarCRM Transaction to a Connec resource hash
  protected function mapModelToConnecResource($transaction) {
    $transaction_hash = array();

    // Missing transaction lines are considered as deleted by Connec!
    $transaction_hash['opts'] = array('sparse' => false);

    // Map attributes
    $transaction_hash['title'] = $transaction->name;
    $transaction_hash['transaction_number'] = $transaction->svnumber;
    $transaction_hash['description'] = $transaction->description;

    $transaction_hash['transaction_date'] = $this->format_date_to_connec($transaction->startdate);
    $transaction_hash['due_date'] = $this->format_date_to_connec($transaction->enddate);

    // Map Organization
    if(isset($transaction->company_id)) {
      $organization_id = $this->organization_mapper->findConnecIdByLocalId($transaction->company_id);
      $transaction_hash['organization_id'] = $organization_id;
    }

    // Map Contact
    if(isset($transaction->clientcontact_id)) {
      $person_id = $this->contact_mapper->findConnecIdByLocalId($transaction->clientcontact_id);
      $transaction_hash['person_id'] = $person_id;
    }

    return $transaction_hash;
  }

  // Persist the SugarCRM Transaction
  protected function persistLocalModel($transaction, $transaction_hash) {
    $transaction->save(false, false);
  }
}