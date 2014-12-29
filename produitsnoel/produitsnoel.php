<?php
require_once _PS_MODULE_DIR_ . 'produitsnoel/models/Produit.php';

class ProduitsNoel extends Module {
	
	public function __construct() {
		
		// Indique le nom du module.
		$this->name = 'produitsnoel';
		// Indique la catégorie du module.
		$this->tab = 'others';
		// Indique la version du module.
		$this->version = 0.1;
		// Indique l'auteur du module.
		$this->author = 'WebCD';
		// Indique le nom d'affichage du module.
		$this->displayName = $this->l('Produits de Noel');
		// Indique la description du produit.
		$this->description = $this->l('Module affichant tous les produits spécial noël avec un design unique.');
		
		parent :: __construct();
		
		$this->confirmUninstall = $this->l('Etes vous sur de vouloir désinstaller le module Produits de Noel ?');
		
	}
	
	// Méthode d'installation du module.
	public function install() {
	
	// Installation du module.
		return parent :: install()
			// Execution de la méthode lier à la base de données.
			 && $this->createDB()
			// Création d'un Hook sur le DisplayLeftColumn
			&& $this->registerHook('leftColumn')
			// Création d'un Hook sur le Dispymn
			&& $this->registerHook('header')
			;
	}
    
	
	// Méthode de désinstallation du module.
	public function uninstall() {
		//Désinstallation du module.
		return parent :: uninstall();	
		
		//Prefix de la base de données.
		$prefix = _DB_PREFIX_;
		//Moteur de la base de données.
		$engine = _MYSQL_ENGINE_;
		
		$statements = array();
		
		//Suppression de la table dans le cas ou elle existe.
		$statements[] 	= "DROP TABLE IF EXISTS `${prefix}noel`";
		
		foreach ($statements as $statement) {
			if (!Db :: getInstance()->Execute($statement)) {
				return false;
			}
		}
		
		return true;	
		
	}
	
	// Méthode de la table du module.
	private function createDB() {
		
		//Prefix de la base de données.
		$prefix = _DB_PREFIX_;
		//Moteur de la base de données.
		$engine = _MYSQL_ENGINE_;
		
		$statements = array();
        
		//Suppression de la table dans le cas ou elle existe.
		$statements[] = "DROP TABLE IF EXISTS `${prefix}noel`";

        //Création de notre table
        $statements[1] = "CREATE TABLE `${prefix}noel` ("
						. '`id` int(10)  NOT NULL AUTO_INCREMENT,'
						. '`titre` VARCHAR(45),'						
						. 'PRIMARY KEY (`id`)'
						. ")ENGINE=$engine ";

		foreach ($statements as $statement) {
			if (!Db :: getInstance()->Execute($statement)) {
				return false;
			}
		}
		
		return true;				
	}
	
    //Associe notre module au Hook de la colonne de gauche.
	public function hookDisplayLeftColumn($params) {
		return $this->display(__FILE__, 'left-column.tpl');
	}

	
	public function hookDisplayRightColumn($params)	{
		return $this->hookDisplayLeftColumn($params);
	}
	
	//Permet d'inserer un fichier css et du coup de l'ajouter entre les balise <HEAD></HEAD> de notre site.
	public function hookDisplayHeader() {
		$this->context->controller->addCSS($this->_path.'css/produitsnoel.css','all');
	}
	
}
?>






