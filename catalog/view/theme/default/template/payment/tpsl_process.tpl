<?php echo $header; ?>
<div class="container"><?php echo $column_left; ?><?php echo $column_right; ?>
  <div id="content"><?php echo $content_top; ?>
    <br /><br />
    <h1>Process Page  
    </h1>
   <?php 
   if($error==""){
   ?>
   Please do not click back button or refresh browser. You will be redirected to payment page...
  <form id='subFrm' name='subFrm' method='post' action='<?php echo $tpslurl; ?>'>
			  <input type='hidden' name='msg' value='<?php echo $finalUrlParam; ?>'>
			  </form>
		  <script>
		//document.subFrm.submit();
		 </script>
<?php }
else
{
 ?>
 <div style="color:red; padding: 10px; text-align: center;"><?php echo $error;?></div>
 <?php 
}?>    
    
    <?php echo $content_bottom; ?></div>
</div>
<?php echo $footer; ?>