<?php

class Produit extends ObjectModel {
	
	public $id;
	public $titre;

	
		public static $definition = array(
  		'table' 	=> 'noel',
  		'primary' 	=> 'id',
  		'multilang' => false,
 		'fields' => array(
   			'id' => array(
   				'type' => ObjectModel :: TYPE_INT
			),
			'titre' => array(
   				'type' => ObjectModel :: TYPE_STRING, 
   				'required' => true
			)
  		),
	);
	
	
	
	public static function findAll() {
		$sql = 'SELECT * FROM ' . _DB_PREFIX_ . 'noel';
		if ($rows = Db :: getInstance(_PS_USE_SQL_SLAVE_)->ExecuteS($sql)) {
			return ObjectModel :: hydrateCollection(__CLASS__, $rows);
		}
		return array();
	}
}
?>