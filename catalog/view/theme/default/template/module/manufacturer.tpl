<?php ?>
<div class="box">
  <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
  <div class="box-content">
    <div class="box-category">
      <ul>
	<?php
		if(isset($this->request->get['manufacturer_id'])){
			$manufacturer_id = $this->request->get['manufacturer_id'];
		} else if(isset($_GET['manufacturer_id'])) {
			$manufacturer_id = $_GET['manufacturer_id'];
		} else {
			$manufacturer_id = '0';
		}
	?>
        <?php foreach ($manufacturers as $manufacturer) { ?>
        <li>
		<?php if($manufacturer['manufacturer_id'] == $manufacturer_id){ ?>
		<a href="<?php echo $manufacturer['href']; ?>" style="font-weight: bold;	"><?php echo $manufacturer['name']; ?></a>
		<?php } else { ?>
		<a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
		<?php } ?>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
