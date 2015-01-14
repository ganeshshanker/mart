</div>
<div class="header">
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="infiniteCarousel">
		<div style="overflow: hidden;" class="wrapper">
			<ul style="width: 9999px;">
				 <?php foreach ($products as $product) { ?>
				<li class="cloned">
					<?php if ($product['thumb']) { ?>
						<div class="image">
						<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
						</div>	
       				 <?php } ?>
					 <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>	
					 <?php if ($product['price']) { ?>
						<div class="price">
						  <?php if (!$product['special']) { ?>
						  <?php echo $product['price']; ?>
						  <?php } else { ?>
						  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
						  <?php } ?>
						</div>
       				<?php } ?>
					<?php if ($product['rating']) { ?>
					<div class="rating">
						<img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
					<?php } ?>
					<div class="cart"><a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><span><?php echo $button_cart; ?></span></a></div>
				</li>
				<?php } ?>
			</ul>
		</div><a href="#" class="arrow back">&lt;</a><a href="#" class="arrow forward"></a>
	</div>
  </div>
</div>
</div>
<div class="content">
