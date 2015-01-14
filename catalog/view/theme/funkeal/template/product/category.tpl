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

	<div id="notification"></div>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>


		<section id="maincontent" class="<?php echo $main; ?> category" role="main">

			<div class="mainborder">

				<?php if ($column_left) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<header class="heading">
					<h1 class="page-header"><?php echo $heading_title; ?></h1>
				</header>

				<div class="category-details">

					<?php if ($thumb || $description) { ?>

						<div class="category-info">
							<?php if ($thumb) { ?>
							<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
							<?php } ?>
							<?php if ($description) { ?>
							<?php echo $description; ?>
							<?php } ?>
						</div>

					<?php } ?>

							<!-- Subcategories 
					============================== -->

					<?php if ($categories) { ?>

						<div class="contentset">
							<h4 class="inner">
								<span><?php echo $text_refine; ?></span>
							</h4>
						</div>

						<ul class="category-list">

							<?php foreach ($categories as $category) { ?>

							<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_subcat_thumbs')!= '') { ?>

								<li class="subcat_thumb">
									<a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>">
										<?php if (isset($category['thumb'])) { ?>
											<img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" />
										<?php } else { ?>
											<img src="image/no_image.jpg" width="60" height="60" />
										<?php } ?>
										<span><?php echo $category['name']; ?></span>
									</a>
								</li>
								<?php } else { ?>
								<li class="subcat">
									<a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
								</li>
								<?php } ?>

							<?php } ?>

						</ul>

					<?php } ?> <!-- subcategories END -->

				</div>


				<!-- Products 
				============================== -->

				<?php if ($products) { ?>

					<!-- Grid/Lis view, filters 
					============================== -->

					<div class="product-filter">

						<div class="btn-group display" data-toggle="buttons-radio">

							<button id="grid" class="btn btn-mini" title="<?php echo $text_grid; ?>" onclick="display('grid');">
								<i class="icon-th"></i>
							</button>

							<button id="list" class="btn btn-mini" title="<?php echo $text_list; ?>" onclick="display('list');">
								<i class="icon-list"></i>
							</button>

						</div>

						<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_hide_compare')=='') { ?>
						<span class="product-compare">
							<a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>
						</span>
						<?php } ?>
							
						<div class="list-options"> 

							<div class="sort">

								<?php echo $text_sort; ?>

								<select onchange="location = this.value;">
									<?php foreach ($sorts as $sorts) { ?>
									<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
									<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>

							</div>

							<div class="limit">

								<?php echo $text_limit; ?>

								<select onchange="location = this.value;">
									
									<?php foreach ($limits as $limits) { ?>

										<?php if ($limits['value'] == $limit) { ?>

											<option value="<?php echo $limits['href']; ?>" selected="selected">
												<?php echo $limits['text']; ?>
											</option>

										<?php } else { ?>

											<option value="<?php echo $limits['href']; ?>">
												<?php echo $limits['text']; ?>
											</option>

										<?php } ?>

									<?php } ?>

								</select>

							</div>

						</div>

					</div>
				
					<!-- Product list (Default to Grid) 
					============================== -->

					<div class="product-grid row-fluid">

						<?php 

						$counter=0;

						foreach ($products as $product) { 

							if ($counter == 0 ) $xclass = 'alpha';
							else if (($counter+3) % 3 == 0 ) $xclass = 'alpha3';
							else if (($counter+4) % 4 == 0 ) $xclass = 'alpha4';
							else $xclass = '';

							if (($counter+2) % 2 == 0 ) $xclass .= ' odd';

						?>

						<div class="grid-box <?php echo $xclass; ?>">

							<div class="inner">

								<?php if ($product['price'] && $product['special']) { ?>
									<div class="onsale">
										<div class="ribbon">
											<?php $this->language->load('module/fortuna');
											echo $this->language->get('text_onsale'); ?>
										</div>
										<div class="ribbonshadow"></div>
									</div>
								<?php } ?>

								<?php if ($product['thumb']) { ?>
									<div class="image">
										<a href="<?php echo $product['href']; ?>">
											<img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
											<div class="hoverpattern"></div>
										</a>
									</div>
								<?php } ?>

								<div class="name">
									<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
								</div>

								<?php if ($product['rating']) { ?>
									<div class="rating">
										<img src="catalog/view/theme/fortuna/images/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
									</div>
								<?php } ?>

								<div class="description"><?php echo $product['description']; ?></div>

								<?php if ($product['price']) { ?>

									<div class="price">
										
										<?php if (!$product['special']) { ?>
											<?php echo $product['price']; ?>
										<?php } else { ?>
											<span class="price-old"><?php echo $product['price']; ?></span>
											<span class="price-new"><?php echo $product['special']; ?></span>
										<?php } ?>

										<?php if ($product['tax']) { ?>
											<br />
											<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
										<?php } ?>

									</div>

								<?php } ?>

								<div class="actions">

									<div class="cart">
										<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-small btn-cart" ><?php echo $button_cart; ?></a>
									</div>
									<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_hide_wishlist')=='') { ?>
									<div class="wishlist">
										<a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $button_wishlist; ?>"><i class="icon-wishlist"></i></a>
									</div>
									<?php } ?>
									<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_hide_compare')=='') { ?>
									<div class="compare">
										<a onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $button_compare; ?>"><i class="icon-compare"></i></a>
									</div>
									<?php } ?>

								</div>

							</div>

						</div>

						<?php $counter++; } ?>

					</div> <!-- .produc-grid -->

					<div class="paginate"><?php echo $pagination; ?></div>
				
				<?php } ?> <!-- products END -->


				<!-- If Category is empty 
				============================== -->

				<?php if (!$categories && !$products) { ?>

					<div class="content empty">

						<p><?php echo $text_empty; ?></p>

						<div class="buttons">
							<a href="<?php echo $continue; ?>" class="btn btn-inverse">
								<?php echo $button_continue; ?>
							</a>
						</div>

					</div>

				<?php } ?>

			</div>

		</section> <!-- #maincontent -->
		
		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>