<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content-special">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div class="box-special">
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img class="special" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        
        
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php   
         	$a=$product['price'];
          	$b=$product['special'];
          
          	$m1 = str_replace(',','',$a);
            $m2 = str_replace(',','',$b);            
                       
             $n1 = str_replace('र','',$m1);
             $n2 = str_replace('र','',$m2);             
            
            $n1 = str_replace('€','',$n1);
            $n2 = str_replace('€','',$n2);
            
            $n1 = str_replace('$','',$n1);
            $n2 = str_replace('$','',$n2);
            $c = number_format($n1 - $n2,2);
            //echo $a[0];
          ?>
          
          <?php 
             $n = (string)$this->currency->getCode();
            //echo var_dump($n);
            $curr = "र";
            if($n=="USD")
            {
                $curr = "$";
            }
            elseif($n=="Eur")
            {
                 $curr = "€";
            }
            else
            {   
                 $curr = "र";
            }        
         ?>
          <div class="discount">Off <?php echo $curr." "; /*$a[0];*/ echo $c; ?></div>
			<style>
            .box-product .discount
             {
            font-size: 11pt;
            display: block;
            font-weight: bold;
            color: white;
            margin-bottom: 4px;
            background-color:red;
            }
         	</style>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
