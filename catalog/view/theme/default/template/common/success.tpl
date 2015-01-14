<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php echo $text_message; ?>
  <?php if(!$this->customer->getEmail()=="") { ?>
  <form  method="POST"  action="http://www.skbmart.com/cpayment/BuyCoupan.php">
    <div class="buttons" style="border:4px solid orange;  border-radius: 16px;">
      <input name="register_email" type="hidden" value="<?=$this->customer->getEmail()?>">
      <input type="submit" name="Buy Coupon" value="Buy Coupon">
    </div>
  </form>
  <?php } ?>
  <?php 
?>
  
<!--<div class="right"><a href="http://www.skbmart.com/cpayment/BuyCoupan.php?id=<?=$this->customer->getEmail()?>" class="button">Buy Coupan</a></div>-->
  
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div>
<style>

body, ul, li {

font-family: Arial, Helvetica, sans-serif;

text-align: left;

list-style: none;

}

input[type="submit"] {

padding: 6px 12px;

cursor:pointer;

}

</style>
<?php echo $footer; ?>