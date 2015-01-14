<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/mcatmod/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/mcatmod/ie7.css" />
<![endif]-->
<script type="text/javascript"> 
 $(document).ready(function(){ 
  if ($.browser.msie) {
		if ($.browser.version <= 7) {
			$('.box-mcatmod ul li.catfirst').bind('mouseover', function() {
				$(this).addClass('act');
			});
				
			$('.box-mcatmod ul li.catfirst').bind('mouseout', 500, function() {
				$(this).removeClass('act');
			});	
		}
	}
 });
</script>
<div class="box">
<div class="box-heading" style="background: none; background-color: #2b5470; color: #fff; repeat-x; border: 1px solid #2b5470;
"><?php echo $heading_title; ?></div>
<div class="box-content" style="padding: 0px; padding-top: 1px; padding-bottom: 1px; -webkit-border-radius: 0px; -moz-border-radius: 0px; -khtml-border-radius: 0px; border-radius: 0px;">
<div class="box-mcatmod">
 <ul>
        <?php foreach ($categories as $category) { ?>
        <li class="catfirst <?php if (!$category['children']) { echo 'kids'; } ?>">
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="lfirst active"><?php echo $category['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>" class="lfirst"><?php echo $category['name']; ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>
		  <div class="catright">
		  <div class="inner-catright">
		  <h2><?php echo $category['name']; ?></h2>
          <?php if ($category['image'] && $category['description']) { ?>
           <div class="category-info">
            <?php if ($category['image']) { ?>
             <div class="image"><img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" /></div>
            <?php } ?>
            <?php if ($category['description']) { ?>
             <?php echo $category['description']; ?>
            <?php } ?>
           </div>
          <?php } ?>
		   <div class="nochild">
		    <?php foreach ($category['children'] as $child) { ?>
		     <?php if (!$child['gchildren']) { ?>
              <a href="<?php echo $child['href']; ?>" class="ndfirst"><?php echo $child['name']; ?></a>
             <?php } ?>
		    <?php } ?>
		   </div>	
		   <ul>
           <?php foreach ($category['children'] as $child) { ?>
			<?php if ($child['gchildren']) { ?>
             <li class="ndlevel">
              <a href="<?php echo $child['href']; ?>" class="ndfirst"><?php echo $child['name']; ?></a>
               <ul class="rdlevel">
                <?php foreach ($child['gchildren'] as $gchild) { ?>
                 <li>
                  <a href="<?php echo $gchild['href']; ?>"><?php echo $gchild['name']; ?></a>
                 </li>
                <?php } ?>
               </ul>
             </li>
            <?php } ?>
           <?php } ?>
          </ul>
		  </div>
		  </div>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
</div>
</div>
</div>