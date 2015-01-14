<?php ?>
<div class="box">
  <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
  <div class="box-content">
    <div class="box-category">
      <ul>
        <?php foreach ($manufacturers as $manufacturer) { ?>
        <li>
		<a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
