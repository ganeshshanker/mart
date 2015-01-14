<?php ?>

<div class="box">

  <div class="box-heading"><span><?php echo $heading_title; ?></span></div>

  <div class="box-content">

    <div class="box-category">
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

      <ul>

        <li><a href="index.php?route=product/pricerange&path=0_1000">Under <?php echo $curr." ";?>1000</a></li>

        <li><a href="index.php?route=product/pricerange&path=1001_2000"><?php echo $curr." ";?>1000 - <?php echo $curr." ";?>2000</a></li>

        <li><a href="index.php?route=product/pricerange&path=2001_3000"><?php echo $curr." ";?>2000 - <?php echo $curr." ";?>3000</a></li>

        <li><a href="index.php?route=product/pricerange&path=3001_4000"><?php echo $curr." ";?>3000 - <?php echo $curr." ";?>4000</a></li>

        <li><a href="index.php?route=product/pricerange&path=4001_5000"><?php echo $curr." ";?>4000 - <?php echo $curr." ";?>5000</a></li>

        <li><a href="index.php?route=product/pricerange&path=5001_0"><?php echo $curr." ";?>5000+</a></li>

      </ul>

    </div>

  </div>

</div>

