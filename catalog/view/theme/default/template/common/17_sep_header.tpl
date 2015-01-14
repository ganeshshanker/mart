<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!-- <meta http-equiv="Content-type" content="text/html" charset=UTF-8"/>
meta charset="UTF-8" /> -->

<meta name="page-topic" content=" Online Shopping Store, Online Shopping  Website " />
<meta name="Author" content="http://www.skbmart.com " />
<meta name="owner" content="SKBMart India" />
<meta name ="copyright" content=" SKBMart India"/>
<meta name="googlebot" content=" index,follow" />
<meta name="allow-search" content="yes" />
<meta name="revisit-after" content="10 days" />
<meta name="distribution" content="global" />
<meta name="rating" content="safe for kids" />
<meta name="reply-to" content="business@skbmart.com" />
<meta name="expires" content="never" />
<meta name="dcterms.format" content="text/html" />
<meta name="dcterms.title" content="Devices" />
<meta name="dcterms.type" content="Text" />
<meta name="msvalidate.01" content="FABE42F69B2D7B69305D614B86AAD449" />
<meta name="p:domain_verify" content="07683968be4fdcc470306c4f9225edb1"/>
<link rel="shortcut icon" href=" https://lh4.googleusercontent.com/-4ZYEXkZdAeA/Un9V4-BvSqI/AAAAAAAACQ8/V7UjJCTyK_8/s15-no/hi.png" />
 
<!--mobile 
<meta name="SKYPE_TOOLBAR" content ="SKYPE_TOOLBAR_PARSER_COMPATIBLE"/>
<meta name="viewport" content="initial-scale=0,user-scalable=yes,maximum-scale=1"/>
<meta name="format-detection" content="telephone=yes"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<!--mobile-->
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>

<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<!--<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/cloud-zoom.css" />-->
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/custom_stylesheet.css" />
<!--<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/product_slider.css" />-->
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
<?php echo $google_analytics; ?>
</head>
<body onload="blink()">
<!--<table cellpadding="0" cellspacing="0" width="100%" style="width: 100%; position: fixed; z-index: -100; top: 0px;" border="0">
<tr>
	<td align="left" style="background-image: url('http://www.skbmart.com/image/background/santa.jpg'); background-repeat: no-repeat; height: 150px; width: 50%; background-position: 0% 0%;"></td>
	<td align="right" style="background-image: url('http://www.skbmart.com/image/background/jinglebells.jpg'); background-repeat: no-repeat; height: 150px; width: 50%; background-position: 100% 0%;"></td>
</tr>
</table>
-->
<!--<div style="position: fixed; z-index: -1; right: 5px;"> <img alt="" class="top-right" src="http://www.skbmart.com/image/diwali-home-right.png"></div> -->
<!--<div style="position: fixed; top: -15px; z-index: -1; left: 5px;">
<img alt="" src="http://www.skbmart.com/image/diwali-home-left.png"></div>-->
<div id="container">
<div id="header">
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
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
  <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a> <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a><!--id="aF"--> 
<a href="http://www.skbmart.com/index.php?route=product/hotdeals"><b style="color:#F00 !important;">Hot Deals</b></a> <a href="http://www.skbmart.com/index.php?route=product/hotsales"><b style="color:#F00 !important;">Supar Sale</b></a> </div>
</div>
<?php if ($categories) { ?>
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
<?php }  ?>
<div id="notification"></div>