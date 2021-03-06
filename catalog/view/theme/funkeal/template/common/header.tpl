﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta name="msvalidate.01" content="FABE42F69B2D7B69305D614B86AAD449" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="page-topic" content=" Online Shopping Website in India" />
<meta name="Author" content="http://www.skbmart.com " />
<meta name="owner" content="SKBMart India" />
<meta name ="copyright" content=" SKBMart India"/>
<!--<meta name="googlebot" content=" index,follow" />-->
<META NAME="ROBOTS" CONTENT="INDEX">
<meta name="revisit-after" content="7 Days" />
<meta name="rating" content="safe for kids" />
<meta name="reply-to" content="business@skbmart.com" />
<meta name="dcterms.format" content="text/html" />
<meta name="dcterms.title" content="Devices" />
<meta name="dcterms.type" content="Text" />
<meta name="p:domain_verify" content="07683968be4fdcc470306c4f9225edb1"/>
<link rel="shortcut icon" href=" https://lh4.googleusercontent.com/-4ZYEXkZdAeA/Un9V4-BvSqI/AAAAAAAACQ8/V7UjJCTyK_8/s15-no/hi.png" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/custom_stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/menu.css"/>
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/cloud-zoom/cloud-zoom.1.0.3.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/cloud-zoom/cloud-zoom.1.0.3.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="catalog/view/javascript/product_slider.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/cufon-yui.js"></script>

<!--<script type="text/javascript" src="catalog/view/javascript/jquery/juizDropDownMenu-1.5.min.js"></script> 
-->
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<script type="text/javascript">
            $(function() {
				var $oe_menu		= $('#oe_menu');
				var $oe_menu_items	= $oe_menu.children('li');
				var $oe_overlay		= $('#oe_overlay');

                $oe_menu_items.bind('mouseenter',function(){
					var $this = $(this);
					$this.addClass('slided selected');
					$this.children('div').css('z-index','9999').stop(true,true).slideDown(200,function(){
						$oe_menu_items.not('.slided').children('div').hide();
						$this.removeClass('slided');
					});
				}).bind('mouseleave',function(){
					var $this = $(this);
					$this.removeClass('selected').children('div').css('z-index','1');
				});

				$oe_menu.bind('mouseenter',function(){
					var $this = $(this);
					$oe_overlay.stop(true,true).fadeTo(200, 0.6);
					$this.addClass('hovered');
				}).bind('mouseleave',function(){
					var $this = $(this);
					$this.removeClass('hovered');
					$oe_overlay.stop(true,true).fadeTo(200, 0);
					$oe_menu_items.children('div').hide();
				})
            });
        </script>
<?php echo $google_analytics; ?>
</head>
<body onload="blink()">
<div id="container">
<div id="header">
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="Online Shopping Website in India" alt="Online Shopping Website in India" /></a></div>
  <?php } ?>
  <?php echo $language; ?> <?php echo $currency; ?>
  <div id="search">
    <?php if ($filter_name) { ?>
    <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" />
    <?php } else { ?>
    <input type="text" name="filter_name" value="<?php echo $text_search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '#000000';" />
    <?php } ?>
    <?php
if(isset($_GET['filter_category_id'])){
$filter_category_id = $_GET['filter_category_id'];
} else {
$filter_category_id = 0;
}
?>
    <select name="filter_category_id" id="filter_category_id" class="headersearch">
      <option value="0"<?php if($filter_category_id == 0){ echo " selected"; } ?>>All Categories/Whole Store</option>
      <?php foreach ($categories as $category) { ?>
      <?php $reset = 0; ?>
      <option value="<?php echo $category['id']; ?>"<?php if($category['id'] == $filter_category_id){ echo " selected"; } ?>><?php echo $category['name']; ?></option>
      <?php if ($category['children']) { ?>
      <?php for ($i = 0; $i < count($category['children']);) { ?>
      <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($category['children'][$i])) { ?>
      <option value="<?php echo $category['children'][$i]['id']; ?>"<?php if($category['children'][$i]['id'] == $filter_category_id){ echo " selected"; } ?>><?php echo "&nbsp; &nbsp; - " . $category['children'][$i]['name']; ?></option>
      <?php } ?>
      <?php } ?>
      <?php } ?>
      <?php } ?>
      <?php } ?>
    </select>
    <div class="button-search"></div>
  </div>
  <?php echo $cart; ?>
  <div id="welcome">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
  </div>
  <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a> <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a> <!--<a href="http://www.skbmart.com/index.php?route=product/hotdeals"><b style="color:#F00 !important;">Hot Deals</b></a>-->  <a href="http://www.skbmart.com/index.php?route=product/supersale"><b style="color:#F00 !important;">Super Sale</b></a></div>
</div>
<!--<?php /*if ($categories) { ?>
<div id="menu">
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
        	  <?php if (isset($category['children'][$i])) { ?>
          		<li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
	          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>
<?php } */ ?>-->

<div class="oe_wrapper">
			<ul id="oe_menu" class="oe_menu">
				<li><a href="http://www.skbmart.com/electronics-1">Electronics</a>
					<div>
						<ul>
							<li class="oe_heading">Telephone</li>
<li><a href="http://www.skbmart.com/electronics-1/telephone-11/cordless-phone-22">Corded Phone</a></li>
<li><a href="http://www.skbmart.com/electronics-1/telephone-11/corded-phone-23">Cordless Phone</a></li>
						</ul>
						<ul>
							<li class="oe_heading"><a href="http://www.skbmart.com/electronics-1/camera-12">Camera</a></li>
							 <li><a href="http://www.skbmart.com/electronics-1/camera-12/camcorders-24">Camcorders</a></li>
<li><a href="http://www.skbmart.com/electronics-1/camera-12/digital-cameras-25">Digital Cameras</a></li>
<li><a href="http://www.skbmart.com/electronics-1/camera-12/tripods-camera-stand-27">Digital Cameras</a></li>
<li><a href="http://www.skbmart.com/electronics-1/camera-12/camera-lenses-28">Camera Lenses</a></li>
<li><a href="http://www.skbmart.com/electronics-1/camera-12/camera-batteries---charger-29">Camera Batteries & Charger</a></li>
<li><a href="http://www.skbmart.com/electronics-1/camera-12/camera-cases---bags-30">Camera Cases & Bags</a></li>
<li><a href="http://www.skbmart.com/electronics-1/camera-12/camera-memory-card-31">Camera Memory Card</a></li>
<li><a href="http://www.skbmart.com/electronics-1/camera-12/digital-photo-frame-32">Digital Photo Frame</a></li>
						</ul>
						<ul>
							<li class="oe_heading">TVs/Audio/Video</li>
<li> <a href="http://www.skbmart.com/electronics-1/lcd-led-tv-13">LCD/LED/TV</a> </li>
              <li> <a href="http://www.skbmart.com/electronics-1/dvd-players-14">DVD Players</a> </li>
              <li> <a href="http://www.skbmart.com/electronics-1/gaming-15">Gaming</a> </li>
              <li> <a href="http://www.skbmart.com/electronics-1/ipods-mp3-players-16">iPods/MP3 Players</a> </li>
              <li> <a href="http://www.skbmart.com/electronics-1/home-theatre-17">Home Theatre</a> </li>
              <li> <a href="http://www.skbmart.com/electronics-1/media-players-18">Media Players</a> </li>
              <li> <a href="http://www.skbmart.com/electronics-1/head-phones-20">Head Phones</a> </li>
              <li> <a href="http://www.skbmart.com/electronics-1/speakers-21">Speakers</a> </li>
						</ul>
					</div>
				</li>
				<li><a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories">Mobiles</a>
					<div style="left:-111px;"><!-- -112px -->
						<ul class="oe_full">
							<li class="oe_heading"><a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories">Mobile & Accessories</a></li>
							<li> <a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories/batteries-39">Batteries</a> </li>
              <li> <a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories/cases-and-pouches-40">Cases &amp; Pouches</a> </li>
              <li> <a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories/chargers-41">Chargers</a> </li>
              <li> <a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories/data-cards-42">Data Cards</a> </li>
              <li> <a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories/handsfree-and-headsets-44">Handsfree &amp; Headsets</a> </li>
              <li> <a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories/bluetooth-45">Bluetooth</a> </li>
						</ul>
					</div>
				</li>
				<li style="line-height:10px;"><a href="http://www.skbmart.com/home-and-kitchen-appliances-3">Home & Kitchen Appliances</a>
					<div style="left:-223px;">
						<ul>
							<li class="oe_heading"><a href="http://www.skbmart.com/home-and-kitchen-appliances-3/home-46">Home Appliances</a></li>
							<li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/home-46/cooktops-58">Cooktops</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/home-46/water-purifier-49">Water Purifier</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/home-46/air-purifier-50">Air Purifier</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/home-46/microwave-ovens-51">Microwave/Ovens</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/home-46/tower-fan-52">Tower Fan</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/home-46/iron-53">Iron</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/home-46/vaccum-cleaner-54">Vaccum Cleaner</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/home-46/air-conditioner-55">Air Conditioner</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/home-46/washing-machine-56">Washing Machine</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/home-46/refrigerator-57">Refrigerator</a> </li>
						</ul>
						<ul>
							<li class="oe_heading"><a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchen-47">Kitchen Appliances</a></li>
							 <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchen-47/juicer-mixer-grinder-59">Juicer Mixer Grinder</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchen-47/rice-cookers-and-steamers-60">Rice Cookers &amp; Steamers</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchen-47/hand-blender-61">Hand Blender</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchen-47/toasters-62">Toasters</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchen-47/mixer-grinder-63">Mixer Grinder</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchen-47/sandwich-maker-64">Sandwich Maker</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchen-47/mini-chopper-65">Mini Chopper</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchen-47/coffee-maker-66">Coffee Maker</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchen-47/induction-and-radiant-cookers-67">Induction &amp; Radiant Cookers</a> </li>
						</ul>
						<ul>
							<li class="oe_heading"><a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchenware-48">Kitchenware</a></li>
 <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchenware-48/kitchen-utilities-68">Kitchen Utilities</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchenware-48/home-utilities-69">Home Utilities</a> </li>
              <li> <a href="http://www.skbmart.com/home-and-kitchen-appliances-3/kitchenware-48/tableware-70">Tableware</a> </li>
						</ul>
					</div>
				</li>
				<li><a href="http://www.skbmart.com/apparel-4">Apparel</a>
					<div style="left:-335px;">
						<ul style="width: 275px;">
							<li class="oe_heading"><a href="http://www.skbmart.com/apparel-4/men-clothing-71">Men Clothing</a></li>
							 <li><a href="http://www.skbmart.com/apparel-4/men-clothing-71/ethnic-wear-83">Ethnic Wear</a></li>
						</ul>
						<ul style="width: 190px;">
							<li class="oe_heading"><a href="http://www.skbmart.com/apparel-4/women-clothing-72">Women Clothing</a></li>
 <li> <a href="http://www.skbmart.com/apparel-4/women-clothing-72/tops-85">Tops</a> </li>
              <li> <a href="http://www.skbmart.com/apparel-4/women-clothing-72/dresses-and-skirts-86">Dresses &amp; Skirts</a> </li>
              <li> <a href="http://www.skbmart.com/apparel-4/women-clothing-72/sarees-89">Sarees</a> </li>
              <li> <a href="http://www.skbmart.com/apparel-4/women-clothing-72/kurtis-tunics-90">Kurtis/Tunics</a> </li>
              <li> <a href="http://www.skbmart.com/apparel-4/women-clothing-72/lingrie-93">Lingrie</a> </li>
              <li> <a href="http://www.skbmart.com/apparel-4/women-clothing-72/suits-salwar-churidar-95">Suits Salwar/Churidar</a> </li>
              <li> <a href="http://www.skbmart.com/apparel-4/women-clothing-72/lehenga-choli-collection-96">Lehenga Choli Collection</a> </li>
              <li> <a href="http://www.skbmart.com/apparel-4/women-clothing-72/bollywood-collection-apparel-180">Bollywood Collection Apparel </a> </li>
						</ul>
						
					</div>
				</li>
				<li style="line-height:10px;"><a href="http://www.skbmart.com/beauty-and-personal-care-5">Beauty & Personal Care</a>
					<div style="left:-448px;">
						<ul class="oe_full">
							<li class="oe_heading"><a href="http://www.skbmart.com/beauty-and-personal-care-5/personal-care-100">Personal Care</a></li>
<li> <a href="http://www.skbmart.com/beauty-and-personal-care-5/personal-care-100/hair-dryer-109">Hair Dryer</a> </li>
              <li> <a href="http://www.skbmart.com/beauty-and-personal-care-5/personal-care-100/women-101">Women</a> </li>
              <li> <a href="http://www.skbmart.com/beauty-and-personal-care-5/personal-care-100/hair-straightner-110">Hair Straightner</a> </li>
              <li> <a href="http://www.skbmart.com/beauty-and-personal-care-5/personal-care-100/men-102">Men</a> </li>
              <li> <a href="http://www.skbmart.com/beauty-and-personal-care-5/personal-care-100/hair-styler-111">Hair Styler</a> </li>
              <li> <a href="http://www.skbmart.com/beauty-and-personal-care-5/personal-care-100/epilators-112">Epilators</a> </li>
              <li> <a href="http://www.skbmart.com/beauty-and-personal-care-5/personal-care-100/trimmers-113">Trimmers</a> </li>
              <li> <a href="http://www.skbmart.com/beauty-and-personal-care-5/personal-care-100/personal-grooming-114">Personal Grooming</a> </li>
						</ul>
                        
					</div>
				</li>
                
                
                <li><a href="http://www.skbmart.com/fashion-accessories-6">Fashion </a>
					<div style="left:-559px;">
						<ul>
							<li class="oe_heading"><a href="http://www.skbmart.com/fashion-accessories-6/jewellery-118">Jewellery</a></li>
 <li> <a href="http://www.skbmart.com/fashion-accessories-6/jewellery-118/necklace-122">Necklace</a> </li>
              <li> <a href="http://www.skbmart.com/fashion-accessories-6/jewellery-118/earring-123">Earring</a> </li>
              <li> <a href="http://www.skbmart.com/fashion-accessories-6/jewellery-118/pendant-124">Pendant</a> </li>
              <li> <a href="http://www.skbmart.com/fashion-accessories-6/jewellery-118/pendant-sets-125">Pendant sets</a> </li>
              <li> <a href="http://www.skbmart.com/fashion-accessories-6/jewellery-118/bangles-126">Bangles</a> </li>
						</ul>
						<ul>
							<li class="oe_heading"><a href="http://www.skbmart.com/fashion-accessories-6/sunglasses-119">Sunglasses</a></li>
 <li> <a href="http://www.skbmart.com/fashion-accessories-6/sunglasses-119/for-women-132">For Women</a> </li>
              <li> <a href="http://www.skbmart.com/fashion-accessories-6/sunglasses-119/for-kids-133">For Kids</a> </li>
              <li> <a href="http://www.skbmart.com/fashion-accessories-6/sunglasses-119/unisex-134">Unisex</a> </li>
						</ul>
						<ul>
							<li class="oe_heading"><a href="http://www.skbmart.com/fashion-accessories-6/bags-luggage-120">Bags/Luggage</a></li>
  <li> <a href="http://www.skbmart.com/fashion-accessories-6/bags-luggage-120/for-men-135">For Men</a> </li>
              <li> <a href="http://www.skbmart.com/fashion-accessories-6/bags-luggage-120/for-women-136">For Women</a> </li>
              <li> <a href="http://www.skbmart.com/fashion-accessories-6/bags-luggage-120/for-kids-137">For Kids</a> </li>
              <li> <a href="http://www.skbmart.com/fashion-accessories-6/bags-luggage-120/unisex-138">Unisex</a> </li>
						</ul>
                        
					</div>
				</li>
                
                
                <li><a href="http://www.skbmart.com/watches-7">Watches</a>
					<div style="left:-671px;">
                    
						<ul>
							<li class="oe_heading"><a href="http://www.skbmart.com/watches-7/shop-by-style-147">Shop by Style</a></li>
 <li> <a href="http://www.skbmart.com/watches-7/shop-by-style-147/analogue-watches-148">Analogue Watches</a> </li>
              <li> <a href="http://www.skbmart.com/watches-7/shop-by-style-147/digital-watches-149">Digital Watches</a> </li>
              <li> <a href="http://www.skbmart.com/watches-7/shop-by-style-147/chronograph-watches-150">Chronograph Watches</a> </li>
              <li> <a href="http://www.skbmart.com/watches-7/shop-by-style-147/pair-watches-151">Pair Watches</a> </li>
              <li> <a href="http://www.skbmart.com/watches-7/shop-by-style-147/casual-watches-152">Casual Watches</a> </li>
              <li> <a href="http://www.skbmart.com/watches-7/shop-by-style-147/sport-watches-153">Sport Watches</a> </li>
              <li> <a href="http://www.skbmart.com/watches-7/shop-by-style-147/leather-watches-154">Leather Watches</a> </li>
              <li> <a href="http://www.skbmart.com/watches-7/shop-by-style-147/formal-watches-155">Formal Watches</a> </li>
						</ul>
						<ul>
							<li class="oe_heading"><a href="http://www.skbmart.com/watches-7/for-him-144">For Him</a></li>
							
						</ul>
						<ul>
							<li class="oe_heading"><a href="http://www.skbmart.com/watches-7/for-kids-145">For Kids</a></li>

						</ul>
                        
                       <ul style="width: 200px;">
							<li class="oe_heading"><a href="http://www.skbmart.com/watches-7/unisex-146">Unisex</a></li>

						</ul>
                        <img src="http://skbmart.com/image/titanraga.jpg" style="float: right;margin-right: -19px;width: 243px;"/> 
                        
                 <img src="http://skbmart.com/image/unisexwatches.jpg" style="float: right;margin-right: -19px;width: 243px;"/>               <img src="http://skbmart.com/image/upto25offcasio.png" style="float: right;margin-right: 15px;width: 243px;"/>
					</div>
				</li>
                
                
                <li><a href="http://www.skbmart.com/lifestyle-8">Lifestyle</a>
					<div style="left:-783px;">
						<ul class="oe_full">
							<li class="oe_heading"><a href="http://www.skbmart.com/lifestyle-8">Lifestyle</a></li>
  <li><a href="http://www.skbmart.com/lifestyle-8/bedlinen-156">Bedlinen </a></li>
              <li><a href="http://www.skbmart.com/lifestyle-8/cushion-157">Cushion</a></li>
              <li><a href="http://www.skbmart.com/lifestyle-8/bath-care-158">Bath Care</a></li>
              <li><a href="http://www.skbmart.com/lifestyle-8/home-decore-159">Home Decore</a></li>
              <li><a href="http://www.skbmart.com/lifestyle-8/bar-and-bar-accessories-160">Bar & Bar Accessories</a></li>
              <li><a href="http://www.skbmart.com/lifestyle-8/gift-items-179">Gift Items</a></li>
						</ul>
                        
					</div>
				</li>
                
                
                <li><a href="http://www.skbmart.com/computer-9">Computer </a>
					<div style="left:-896px;">
                    
                    
                    
						<ul style="width: 275px;">
							<li class="oe_heading"><a href="http://www.skbmart.com/computer-9/computer-accessories-163">Computer Accessories</a></li>
							<li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/pen-drives-164">Pen Drives</a> </li>
              <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/storage-devices-165">Storage Devices</a> </li>
              <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/ram-166">RAM</a> </li>
              <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/keyboard-and-mouse-167">Keyboard &amp; Mouse</a> </li>
              <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/printers-and-scanners-168">Printers &amp; Scanners</a> </li>
              <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/headphones-and-mics-169">Headphones &amp; Mics</a> </li>
              <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/cabinets-170">Cabinets</a> </li>
              <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/multimedia-speakers-171">Multimedia Speakers</a> </li>
						</ul>
						<ul style="width: 190px;">
							<li class="oe_heading"><a href="http://www.skbmart.com/computer-9/computer-accessories-163">Computer Accessories</a></li>
 <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/webcams-172">Webcams</a> </li>
              <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/antivirus-173">Antivirus</a> </li>
              <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/software-174">Software</a> </li>
              <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/power-supply-unit-175">Power Supply Unit</a> </li>
              <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/processor-176">Processor</a> </li>
              <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/motherbaord-177">Motherbaord</a> </li>
              <li> <a href="http://www.skbmart.com/computer-9/computer-accessories-163/computer-component-178">Computer Component</a> </li>
						</ul>
                        
                        
                        
                        
					</div>
				</li>
                
                
			</ul>	
		</div>
<div style="clear:both;"></div>
<div id="notification"></div>
