<?php echo $header; ?>

	<div id="notification" class="home"></div>

	<?php 	
		if ($column_left || $column_right) $main = "span9"; 
		else $main = "span12";  
	?>

	<div class="row">

		<?php echo $column_left; ?>
		
		<section id="maincontent" class="<?php echo $main; ?> home">

			<div class="mainborder">

				<?php if ($column_left) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<h1 style="display: none;"><?php echo $heading_title; ?></h1>
				<?php echo $content_top; ?>

			</div>
			
		</section>
		
		<?php echo $column_right; ?>

	</div>

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>