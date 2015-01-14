<div id="footer">
  <div class="column">
    <h3>SHOPPING WITH US!</h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <?php if($information['title'] == "Track an order" || $information['title'] == "Terms and Conditions" || $information['title'] == "Return Policy"){ ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
  <div class="column">
    <h3>SHOP SECURE</h3>
    <ul class="no-bullet">
      <li>100% Secure Payments</li>
      <li>100% Secure Website</li>
      <li>100% Genuine Products</li>
      <li>100% Reliable Service</li>
    </ul>
  </div>
  <?php if ($informations) { ?>
  <div class="column">
    <h3><?php echo "SKBMART"//$text_information; ?></h3>
    <ul>
      <?php $ctr=1; ?>	
      <?php foreach ($informations as $information) { ?>
      <?php if($ctr == 2){ ?>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <?php } ?>
      <?php if($information['title'] == "Track an order" || $information['title'] == "Terms and Conditions" || $information['title'] == "Return Policy"){ } else { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
      <?php $ctr++; } ?>
    </ul>
  </div>
  <div class="column">
    <h3>PAYMENT OPTION</h3>
    <img src="image/mastercard.gif"/> &nbsp; <img src="image/visa.gif"/> &nbsp; <img src="image/american.gif"/><br/>
    All Debit cards, Credit cards accepted.<br/><br/>
    <img src="image/netbanking.jpg"/>&nbsp;<img src="image/cod.jpg"/><br/>
    Net Banking & Cash on Delivery available.
  </div>
  <div class="column" align="right">
    <h3>CONNECT & SHARE</h3>
    <img src="image/fb.gif"/> &nbsp; <img src="image/tw.gif"/><br/>
  </div>
  <?php } ?>
</div>
<br/>
<table cellpadding="0" cellspacing="0" border="0" width="1000" style="font-size: 8pt;">
<tr>
    <td align="left" style="padding-left: 10px;">
        Copyright &copy; 2011-2012 Funkeal.com - All rights reserved.<br/><br/>    
    </td>        
    <td align="right" style="padding-right: 10px;">
        Website developed, hosted and maintained by: <a class="smooky" style="text-decoration: none;" href="http://www.smookyweb.com" target="_blank"><b style="color: #959737;">Smooky</b><b style="color: #555555;"> Web</b></a><br/></div><br/>
    </td>
</tr>
</table>
</body></html>