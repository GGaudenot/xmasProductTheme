<?php

class ProduitsNoelChaussuresModuleFrontController extends ModuleFrontController {
	
	 public function init()
    {
        //Nom de la page.
        $this->page_name = 'chaussures';
        //Choix d'affichage des column de gauche et de droite.
        $this->display_column_left = false;
        $this->display_column_right = false;
        parent::init();
    }
	
	
	public function initContent()
	{
		parent::initContent();

        //Utilisation de la méthode getProducts, fichier -> /Classes/Product.php
        // 12 = id_category.
		$products_partial = Product::getProducts($this->context->language->id, 0, 999999, 'name', 'asc','3');
		$products = Product::getProductsProperties($this->context->language->id, $products_partial);
	 
		foreach ($products as $key => $product) {
            foreach ($products as $key => $product) {
            $products[$key]['id_image'] = Product::getCover($product['id_product'])['id_image'];
    }
} 
	 

        //On désigne le fichier Smarty qui va être lier.
		$this->context->smarty->assign(array(
			'products' => $products,
			'homeSize' => Image::getSize('home_default')
		));
		$this->setTemplate('chaussures.tpl');
	}
	
}
?>
