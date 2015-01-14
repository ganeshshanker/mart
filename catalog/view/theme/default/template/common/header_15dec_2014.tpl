<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<style>
.headerline {
	width: 1003px;
	height: 30px;
	background: #2b5470;
	margin: 0 auto;
}
.headerlineright {
	width: 560px;
	height: 30px;
	margin: -31px -14px 0 0;
	float: right;
}
.headerlineright p {
	color: #FFFFFF;
	font-size: 15px;
	font-family: calibri;
	line-height: 30px;
	float: right;
	margin-right: 16px;
}
.headerlineright p span {
	font-size: 12px;
}
.headerlineright p a {
	text-decoration: underline;
	color: #FFFFFF;
	font-size: 15px;
	font-family: calibri;
}
.headerlineright ul {
	list-style-type: none;
	padding: 4px 0 0 0;
	margin: 0;
}
.headerlineright ul li {
	color: #222;
	padding: 0px 0 0 3px;
	margin: 0px;
	display: inline;
}
.headerlineright ul li a {
	text-decoration: none;
	color: #074D6B;
	font-size: 15px;
	font-family: calibri;
	border-left: 1px #074D6B solid;
	padding: 0 0 0 12px;
}
.headerlineright ul li a:hover {
	color: #fff;
}
.headerlineleft {
	width: 465px;
	height: 30px;
	margin: 0 0 0 0;
}
.headerlineleft ul {
	list-style-type: none;
	padding: 4px 0 0 0;
	margin: 0;
}
.headerlineleft ul li {
	color: #222;
	padding: 0px 0 0 3px;
	margin: 0px;
	display: inline;
}
.headerlineleft ul li a {
	text-decoration: none;
	color: #FFFFFF;
	font-size: 15px;
	font-family: calibri;
	border-left: 1px #A5A5A5 solid;
	padding: 0 0 0 12px;
}
.headerlineleft ul li a:hover {
	color: #fff;
}
#header #cart {
	position: absolute !important;
	top: -5px !important;
	right: 0px !important;
	z-index: 1000000 !important;
}
#header #search {
	position: absolute;
	top: 15px;
	right: 283px !important;
	width: 348px !important;
	top: 30px !important;
	z-index: 1500;
}
.headersearch {
	background: #FFF;
	border: 1px solid #CCCCCC;
	padding: 3px !important;
	width: 60px !important;
	height: 39px !important;
	color: #CCCCCC;
	float: left;
	font-size: 17px;
	background: #269bd1 !important;
	font-family: calibri;
}
#header #search input {
	color: #CCCCCC;
	font-size: 17px;
	font-family: calibri;
	background: #FFF;
	padding: 1px 1px 1px 3px;
	width: 445px !important;
	height: 35px !important;
	border: 1px solid #CCCCCC;
	-webkit-border-radius: 0 !important;
	-moz-border-radius: 0 !important;
	-khtml-border-radius: 0 !important;
	border-radius: 0 !important;
	-webkit-box-shadow: 0px 0px 0px #F0F0F0 !important;
	-moz-box-shadow: 0px 0px 0px #F0F0F0 !important;
	box-shadow: 0px 0px 0px #F0F0F0 !important;
}
element.style {
}
#header .button-search {
	position: absolute;
	left: 555px;
	top: 0px;
	background: url('../image/button-search.png') center center no-repeat;
	width: 28px;
	height: 24px;
	border: 1px solid #CCCCCC;
	cursor: pointer;
}
#header .button-search {
	position: absolute;
	left: 342px !important;
	top: 0px;
	background: url('../image/button-search.png') center center no-repeat;
	width: 107px !important;
	height: 37px !important;
	border: 1px solid #CCCCCC;
	cursor: pointer;
}
#header #cart .heading {
	border-right: none !important;
}
#header #cart .heading h4 {
	color: #333333;
	font-size: 15px;
	font-weight: bold;
	margin-top: 0px;
	margin-bottom: 2px !important;
	font-family: calibri !important;
}
#currency {
	width: 75px !important;
	position: absolute !important;
	top: 57px !important;
	left: 921px !important;
	color: #999 !important;
	line-height: 17px !important;
}
#filter_category_id {
	display: none;
}
</style>
<meta name="msvalidate.01" content="FABE42F69B2D7B69305D614B86AAD449" />
<link type='text/css' rel='stylesheet' href='//fonts.googleapis.com/css?family=Oswald|Open+Sans' />
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
<meta name="revisit-after" content="daily" />
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

<style>
.leftbanner {
	float: left;
	display: none;
}
.rightbanner {
	float: right;
	display: none;
}
@media screen and (max-width:1360px) {
	.leftbanner {
		display: none;
	}
	.rightbanner {
		display: none;
	}
}
</style>        
<div class="leftbanner"><img src="http://www.skbmart.com/images/left.png" width="150px"></div>
<div class="rightbanner"><img src="http://www.skbmart.com/images/right.png" width="150px"></div>

<div class="headerline">
          <div class="headerlineleft">
    <ul>
              <li><a href="http://www.skbmart.com/" style="border: none;">Home</a></li>
              <li><a href="http://www.skbmart.com/account/wishlist">Wish List</a></li>
              <li><a href="http://www.skbmart.com/account/account">My Account</a></li>
              <li><a href="http://www.skbmart.com/checkout/cart">Shopping Cart</a></li>
              <li><a href="http://www.skbmart.com/checkout/checkout">Place Order</a></li>
            </ul>
  </div>
          <div class="headerlineright">
    <p> <a href="http://www.skbmart.com/index.php?route=information/contact">CONTACT US</a> +91 9266168254 <span>(10 AM - 7 PM Mon to Sat)</span> <span style="color:#A5A5A5; font-size: 15px;">|<span> <a href="http://www.skbmart.com/account/register">Register </a><span style="color:#A5A5A5; font-size: 15px;">|<span> <a href="http://www.skbmart.com/account/login">
      <?php if (!$logged) { ?>
      <?php echo $text_welcome; ?>
      <?php } else { ?>
      <?php echo  $text_logged; ?>
      <?php } ?>
      </a> </p>
  </div>
        </div>
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
    <div class="button-search">
              <p style="

    color: #fff;

    text-align: center;

    font-family: calibri;

    font-size: 20px;

    line-height: 31px;

">Search</p>
            </div>
  </div>
          <?php echo $cart; ?> 
          
          <!-- <div id="welcome">

    <?php if (!$logged) { ?>

    <?php echo $text_welcome; ?>

    <?php } else { ?>

    <?php echo $text_logged; ?>

    <?php } ?>

  </div>--> 
          
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
              <div style="top:31px;">
        <ul>
                  <li class="oe_heading">Telephone</li>
                  <li><a href="http://www.skbmart.com/electronics-1/telephone-11/cordless-phone-22">Corded Phone</a></li>
                  <li><a href="http://www.skbmart.com/electronics-1/telephone-11/corded-phone-23">Cordless Phone</a></li>
                </ul>
        <ul style="margin-top: -7px;">
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
        <img src="http://skbmart.com/image/Electronic-products-banner.jpg" style="float: right;margin-right: 5px;width: 248px;  border:1px solid #c0c0c0;position: fixed;margin-top: 35px;"> </div>
            </li>
    <li><a href="http://www.skbmart.com/watches-7">Watches</a>
              <div style="left:-101px; top:31px;">
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
        <img src="http://skbmart.com/image/titanraga.jpg" style="margin-right: -26px;width: 238px; border:1px solid #c0c0c0;"/> <img src="http://skbmart.com/image/unisexwatches.jpg" style="float: right;margin-right: -20px;width: 238px; border:1px solid #c0c0c0;"/> <img src="http://skbmart.com/image/upto25offcasio.png" style="float: right;margin-right: 2px;width: 238px; border:1px solid #c0c0c0;"/> </div>
            </li>
    <li style="line-height:10px;"><a href="http://www.skbmart.com/home-and-kitchen-appliances-3">Home & Kitchen Appliances</a>
              <div style="left:-191px; top:31px;">
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
        <img src="http://skbmart.com/image/home-and-kitchen-appliances-img.jpg" style="float: right;margin-right: -13px;width: 308px;margin-top: -16px; border:1px solid #c0c0c0;"/> </div>
            </li>
    <li><a href="http://www.skbmart.com/apparel-4">Apparel</a>
              <div style="left:-388px; top:31px;">
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
        <img src="http://skbmart.com/image/women-clothing-img.jpg" style="float: right;margin-right: 5px;width: 355px;  border:1px solid #c0c0c0;"/> </div>
            </li>
    <li style="line-height:10px;"><a href="http://www.skbmart.com/beauty-and-personal-care-5">Beauty & Personal Care</a>
              <div style="left:-475px;  top:31px;">
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
        <img src="http://skbmart.com/image/beautypersonalcare.jpg" style="float: right;width: 81%;  border:1px solid #c0c0c0;margin-top: -187px;"/> </div>
            </li>
    <li><a href="http://www.skbmart.com/fashion-accessories-6">Fashion </a>
              <div style="left:-648px; top:31px;">
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
        <img src="http://skbmart.com/image/Sunglasses-banner.jpg" style="float: right;margin-right: -12px;width: 357px;  border:1px solid #c0c0c0;margin-top: -70px;"> </div>
            </li>
    <li><a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories">Mobiles</a>
              <div style="left:-732px; top:31px;">
        <ul class="oe_full">
                  <li class="oe_heading"><a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories">Mobile & Accessories</a></li>
                  <li> <a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories/batteries-39">Batteries</a> </li>
                  <li> <a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories/cases-and-pouches-40">Cases &amp; Pouches</a> </li>
                  <li> <a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories/chargers-41">Chargers</a> </li>
                  <li> <a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories/data-cards-42">Data Cards</a> </li>
                  <li> <a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories/handsfree-and-headsets-44">Handsfree &amp; Headsets</a> </li>
                  <li> <a href="http://www.skbmart.com/mobiles---accessories-2/mobile---accessories/bluetooth-45">Bluetooth</a> </li>
                </ul>
        <img src="http://skbmart.com/image/mobile-accessories-banner.jpg" style="float: right;width: 81%;  border:1px solid #c0c0c0;margin-top: -136px;"> </div>
            </li>
    <li><a href="http://www.skbmart.com/lifestyle-8">Lifestyle</a>
              <div style="left:-819px; top:31px;">
        <ul class="oe_full">
                  <li class="oe_heading"><a href="http://www.skbmart.com/lifestyle-8">Lifestyle</a></li>
                  <li><a href="http://www.skbmart.com/lifestyle-8/bedlinen-156">Bedlinen </a></li>
                  <li><a href="http://www.skbmart.com/lifestyle-8/cushion-157">Cushion</a></li>
                  <li><a href="http://www.skbmart.com/lifestyle-8/bath-care-158">Bath Care</a></li>
                  <li><a href="http://www.skbmart.com/lifestyle-8/home-decore-159">Home Decore</a></li>
                  <li><a href="http://www.skbmart.com/lifestyle-8/bar-and-bar-accessories-160">Bar & Bar Accessories</a></li>
                  <li><a href="http://www.skbmart.com/lifestyle-8/gift-items-179">Gift Items</a></li>
                </ul>
        <img src="http://skbmart.com/image/lifestyle.jpg" style="float: right;margin-right: -12px;width: 774px;  border:1px solid #c0c0c0;margin-top: -125px;"> </div>
            </li>
    <li><a href="http://www.skbmart.com/computer-9">Computer </a>
              <div style="left:-909px; top:31px;">
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
        <img src="http://skbmart.com/image/computer-accessories-banenr.jpg" style="float: right;margin-right: -12px;width: 357px;  border:1px solid #c0c0c0;margin-top: -12px;"> </div>
            </li>
  </ul>
        </div>
<div style="clear:both;"></div>
<div id="notification"></div>
