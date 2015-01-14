<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <h2><?php echo $text_location; ?></h2>
    <div class="contact-info">
      <div class="content">
      <div class="left"><b>Customer Care<?php //echo $text_address; ?></b><br />
        <?php if ($telephone) { ?>
        Phone: <?php echo $telephone; ?><br /><br />
        Support Time: 10AM to 7 PM <br /><br />
	<?php } ?>
	Email:support@skbmart.com<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; skbmartindia@gmail.com<br />
        <?php //echo $store; ?><br />
        <?php //echo $address; ?>
      </div>
      <div class="right">
	<b>Other Enquiries<?php //echo $text_address; ?></b><br />
	Corporate Sales: <a href="mailto:corporate@skbmart.com">corporate@skbmart.com</a><br />
	Business Development & Partnerships: <a href="mailto:business@skbmart.com">business@skbmart.com</a><br />
	Careers: <a href="mailto:career@skbmart.com">career@skbmart.com</a><br />
	Press Relations: <a href="mailto:press@skbmart.com">press@skbmart.com</a><br />
        <!--<?php //if ($telephone) { ?>
        <b><?php //echo $text_telephone; ?></b><br />
        <?php //echo $telephone; ?><br />
        <br />
        <?php //} ?>
        <?php //if ($fax) { ?>
        <b><?php //echo $text_fax; ?></b><br />
        <?php //echo $fax; ?>
        <?php //} ?>-->
      </div>
    </div>
    </div>
    <h2><?php echo $text_contact; ?></h2>
    <div class="content">
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="<?php echo $name; ?>" />
    <br />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_email; ?></b><br />
    <input type="text" name="email" value="<?php echo $email; ?>" />
    <br />
    <?php if ($error_email) { ?>
    <span class="error"><?php echo $error_email; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_enquiry; ?></b><br />
    <textarea name="enquiry" cols="40" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
    <br />
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
    <br />
    <img src="index.php?route=information/investers/captcha" alt="" />
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>
    </div>
    <div class="buttons">
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>