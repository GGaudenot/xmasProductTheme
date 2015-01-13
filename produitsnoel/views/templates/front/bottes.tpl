<!-- Fichier TPL du module - Catégorie Bottes
     Création : Coonax 
     Github : https://github.com/Coonax 
     Site Internet : http://www.Coonax.fr -->

<div class="Module">
    <div class="headModule">
        <div class="menu">
        <a href="{$link->getModuleLink('produitsnoel','default')}"><h1 class="titre">- Les Produits de Noël -</h1></a>
        </div>
        <div class="sousMenu">
             <ul>
                <li><a class="lienMenu" href="{$link->getModuleLink('produitsnoel','bottes')}">Bottes</a>
                <a class="lienMenu" href="{$link->getModuleLink('produitsnoel','talons')}">Talons</a>
                <a class="lienMenu" href="{$link->getModuleLink('produitsnoel','chaussures')}">Chaussures</a>
                <a class="lienMenu" href="{$link->getModuleLink('produitsnoel','autres')}">Autres</a></li>
             </ul>
        </div>
    </div>
    <div class="bodyModule">
         <h1 class="sous-titre">Nos Bottes de Noël</h1>
         <p class="content">Durant les fêtes de Noël, EasyChaussures vous proposes de découvrir les produits que nous vous proposons à cette occasion. Sans plus attendre consulter l'ensemble de nos offres parmis les différentes catégories: bottes, talons, chaussures et tous les autres.</p>


    <!-- Listing de l'ensemble des produits. -->
  {if isset($products)}
    <!-- Products list -->
    <ul>
    {foreach from=$products item=product name=products}
        <li class="ajax_block_product {if $smarty.foreach.products.first}first_item{elseif $smarty.foreach.products.last}last_item{/if} {if $smarty.foreach.products.index % 2}alternate_item{else}item{/if} clearfix">
        <div class="produit" style="border: 1px solid #d44545;">
            <div class="imageProduit">
                <a class="nomProduit" href="{$product.link|escape:'htmlall':'UTF-8'}" class="product_img_link" title="{$product.name|escape:'htmlall':'UTF-8'}">
                    <img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')}" {if isset($homeSize)} width="100" height="100"{/if} />
                    {if isset($product.new) && $product.new == 1}<span class="new">{l s='Nouveau'}</span>{/if}
                </a>
                <h3><a class="nomProduit" href="{$product.link|escape:'htmlall':'UTF-8'}" title="{$product.name|escape:'htmlall':'UTF-8'}">{$product.name|escape:'htmlall':'UTF-8'|truncate:20:'...'}</a></h3>
                
 <p class="product_desc">{$product.description_short|strip_tags:'UTF-8'|truncate:30:'...'}</p>

               
            </div>
            <div class="infoProduit"><h4>
                {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}<span class="on_sale">{l s='On sale!'}</span>
                {elseif isset($product.reduction) && $product.reduction && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}<span class="infoProduit">{l s='Prix réduit'}</span>{/if}<br>
                {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
                <div>
                    <h4>
                    {if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}<span class="prixProduit">{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}</span><br />{/if}
                    {if isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}<span class="infoProduit">{if ($product.allow_oosp || $product.quantity > 0)}{l s='En stock'}{elseif (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}{l s='Product available with different options'}{else}{l s='Indisponible'}{/if}<br><br></span>{/if}
                        </h4>
                </div>
                {if isset($product.online_only) && $product.online_only}<span class="online_only">{l s='Offre internet!'}</span>{/if}
                {/if}
                {if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
                    {if ($product.allow_oosp || $product.quantity > 0)}
                        {if isset($static_token)}
                <a class="lienAchat" href="{$link->getPageLink('cart',false, NULL, "add&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)}"/>ACHETER</a></span>
                
                        {else}
                  <a class="lienAchat"  rel="ajax_id_product_{$product.id_product|intval}" href="{$link->getPageLink('cart',false, NULL, "add&amp;id_product={$product.id_product|intval}", false)}" title="{l s='Choisir'}"/>ACHETER</a></span>
                        {/if}                       
                    {else}
                  <a class="lienAchat"  rel="ajax_id_product_{$product.id_product|intval}"  title="{l s='Choisir'}"/>ACHETER</a></span>
                    {/if}
                {/if}
            </div>
        </li>
    {/foreach}
    </ul>
    <!-- /Products list -->
{/if}

    </div>
    <div class="footer">
        <ul>
            <li><a class="lienFooter" href="#">Informations</a>
            <a class="lienFooter" href="#">Support</a></li>
        </ul>
        <p class="content">xmasProductTheme par <a class="lienCoonax" href="http://coonax.fr">Coonax</a></p>
    </div>
</div>

