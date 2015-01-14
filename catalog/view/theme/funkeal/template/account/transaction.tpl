<?php echo $header; ?>

	<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?>
			<a href="<?php echo $breadcrumb['href']; ?>">
				<?php echo $breadcrumb['text']; ?>
			</a>
		<?php } ?>
	</div>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?> information" role="main">

			<div class="mainborder">

				<?php if ($column_left) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<header class="heading">
					<h1 class="page-header"><?php echo $heading_title; ?></h1>
				</header>

				<p><?php echo $text_total; ?><b> <?php echo $total; ?></b>.</p>

				<table class="table table-bordered">
					<thead>
						<tr>
							<td class="left"><?php echo $column_date_added; ?></td>
							<td class="left"><?php echo $column_description; ?></td>
							<td class="right"><?php echo $column_amount; ?></td>
						</tr>
					</thead>
					<tbody>
						<?php if ($transactions) { ?>
						<?php foreach ($transactions  as $transaction) { ?>
						<tr>
							<td class="left"><?php echo $transaction['date_added']; ?></td>
							<td class="left"><?php echo $transaction['description']; ?></td>
							<td class="right"><?php echo $transaction['amount']; ?></td>
						</tr>
						<?php } ?>
						<?php } else { ?>
						<tr>
							<td class="center" colspan="3"><?php echo $text_empty; ?></td>
						</tr>
						<?php } ?>
					</tbody>
				</table>
				
				<div class="paginate"><?php echo $pagination; ?></div>

				<div class="form-actions">
					<a href="<?php echo $continue; ?>" class="btn btn-inverse"><?php echo $button_continue; ?></a>
				</div>

			</div>
		
		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>
	
	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>