  <?php if($tpsl_bank_code_type=="single"){?>
  <form action="<?php echo $action; ?>" method="post" id="payment" >
 
  <input type="hidden" name="tpsl_account_no" value="<?php echo $tpsl_account_no; ?>" />
  <input type="hidden" name="tpsl_market_code" value="<?php echo $tpsl_market_code; ?>" />
   <input type="hidden" name="order_id" value="<?php echo $order_id; ?>" />
    <input type="hidden" name="amount" value="<?php echo $amount; ?>" />
    <input type="hidden" name="tpsl_bank_code" value="<?php echo $tpsl_single_bank_code; ?>" />
  
  <?php }
  else
  {
   ?>
   <form action="<?php echo $action; ?>" method="post" id="payment" onsubmit="return validBank();">
 
  <input type="hidden" name="tpsl_account_no" value="<?php echo $tpsl_account_no; ?>" />
  <input type="hidden" name="tpsl_market_code" value="<?php echo $tpsl_market_code; ?>" />
   <input type="hidden" name="order_id" value="<?php echo $order_id; ?>" />
    <input type="hidden" name="amount" value="<?php echo $amount; ?>" />
    <input type="hidden" name="tpsl_bank_code" id="tpsl_bank_code" value="" />
    
    <script>
function validBank()
{
  var bank_valarr=document.getElementsByName('bank_code');
  
  var ll=bank_valarr.length;
  var selval="";
  var sel=false;
  for(i=0;i<ll;i++)
  {
    if(bank_valarr[i].checked==true)  { sel=true; selval=bank_valarr[i].value; }
  }
  
  if(!sel) {alert('Please select  bank !'); return false;}
  else{ document.getElementById('tpsl_bank_code').value=selval;  return true;}
}
</script>
   <style>
.menu_ul { width:940px; padding:0px;}
.menu_active{background-color:#DDD; color:#000000; display:block; float:left; width:150px; list-style: none; padding-left:10px; padding-top: 6px; font-weight:bold; cursor:pointer;  font-weight:bold; -webkit-border-radius: 10px 10px 0px 0px; -moz-border-radius: 10px 10px 0px 0px; -khtml-border-radius: 10px 10px 0px 0px; border-radius: 10px 10px 0px 0px; border-top: 1px solid #DDD; border-left: 1px solid #DDD; border-right: 1px solid #DDD; min-height: 24px;}
.menu_inactive_{background-color:#F8F8F8; color:#000000; display:block; float:left; width:150px; list-style: none; padding-left:10px; padding-top: 6px; font-weight:bold; cursor:pointer;  font-weight:bold; -webkit-border-radius: 10px 10px 0px 0px; -moz-border-radius: 10px 10px 0px 0px; -khtml-border-radius: 10px 10px 0px 0px; border-radius: 10px 10px 0px 0px; border-top: 1px solid #DDD; border-left: 1px solid #DDD; border-right: 1px solid #DDD; min-height: 24px;}
.box{ 
        background-color: #F8F8F8;
        width:940px; 	
        -webkit-border-radius: 0px 10px 10px 10px;
        -moz-border-radius: 0px 10px 10px 10px;
        -khtml-border-radius: 0px 10px 10px 10px;
        border-radius: 0px 10px 10px 10px;
        -webkit-box-shadow: 0px 2px 2px #DDDDDD;
        -moz-box-shadow: 0px 2px 2px #DDDDDD;
        box-shadow: 0px 2px 2px #DDDDDD;
        padding-bottom: 30px;
    }
.node{ width: 300px; float:left; text-align:left; height:30px; }
</style>
      
 <label><?php echo $entry_mul_bank_code; ?></label>&nbsp;
 
    <script>
				   var ss='<?php if(is_array($tpsl_multiple_bank_code_sel) and count($tpsl_multiple_bank_code_sel)>0){ echo "bank,"; }if(is_array($tpsl_broking_bank_code_sel) and count($tpsl_broking_bank_code_sel)>0){ echo "broking,"; }if(is_array($tpsl_cc_bank_code_sel) and count($tpsl_cc_bank_code_sel)>0){ echo "cc,"; } if(is_array($tpsl_cash_bank_code_sel) and count($tpsl_cash_bank_code_sel)>0){ echo "cash,"; }if(is_array($tpsl_corp_bank_code_sel) and count($tpsl_corp_bank_code_sel)>0){ echo "corp,"; }?>';
			 
			 				   
				     var banktype=ss.split(",");
					 var l=banktype.length;
					 
					 fe=banktype[0];
					 $("#"+fe+"_m").removeClass('menu_inactive_');
			   	     $("#"+fe+"_m").addClass('menu_active');
				   
				  	 //new Effect.SlideDown(fe, {duration: 0.5});
					 $("#"+fe).show();
					  $("#"+fe).addClass('menu_active');
					 
					 function showTab(v)
					 {
					   for(i=0;i<l-1;i++){
					   //alert("=="+banktype[i]+"=="+i);  
						  if(banktype[i]!="" || banktype[i]!=null){
						//	alert(i);
						   document.getElementById(banktype[i]).style.display='none';
						   
						    v_m=banktype[i]+"_m";
						   $("#"+v_m).removeClass('menu_active');
					   	   $("#"+v_m).addClass('menu_inactive_');
						   }
					  
					   }
					   
					 //alert(v);
					  $("#"+v).show();
					   v_m=v+"_m";
					   $("#"+v).addClass('menu_active');
				   //alert(v_m);

					   $("#"+v_m).removeClass('menu_inactive_');
					   $("#"+v_m).addClass('menu_active');
					 }
				   </script>
  
   <table width="600" border="0" cellspacing="0" cellpadding="4">
			
                <tr>
                 <td width="100%" >
                    <table width="100%" cellpadding="0" cellspacing="0">
                    	<tr>
						 <td width="100%" >	
                              <ul class="menu_ul">
                         
    <?php if(is_array($tpsl_multiple_bank_code_sel) and count($tpsl_multiple_bank_code_sel)>0){ ?>
    <li   class="menu_inactive_" onClick="showTab('bank');" id="bank_m">Net Banking</li>
                          <?php }?>
                                                   
                           <?php if(is_array($tpsl_broking_bank_code_sel) and count($tpsl_broking_bank_code_sel)>0){ ?>
    <li   class="menu_inactive_" onClick="showTab('broking');" id="broking_m">Broking Bank</li>
                          <?php }?>
                          
                           <?php if(is_array($tpsl_cc_bank_code_sel) and count($tpsl_cc_bank_code_sel)>0){ ?>
    <li   class="menu_inactive_" onClick="showTab('cc');" id="cc_m">Credit Card Bank</li>
                          <?php }?>
                          
                           <?php if(is_array($tpsl_cash_bank_code_sel) and count($tpsl_cash_bank_code_sel)>0){ ?>
    <li   class="menu_inactive_" onClick="showTab('cash');" id="cash_m">Cash Bank</li>
    
                          <?php }?>
                          
                           <?php if(is_array($tpsl_corp_bank_code_sel) and count($tpsl_corp_bank_code_sel)>0){ ?>
    <li   class="menu_inactive_" onClick="showTab('corp');" id="corp_m">Corporatye Bank</li>
                          <?php }?>
                          </ul>
                          
                          
                             <?php if(is_array($tpsl_multiple_bank_code_sel) and count($tpsl_multiple_bank_code_sel)>0){ ?>
                          
                          		<div class="box" id="bank" style="display:none;">
                                
								<?php $b=1; 
                                 foreach ($tpsl_multiple_bank_code_arr as $mul_bank_code){
    if(in_array($mul_bank_code['id'],$tpsl_multiple_bank_code_sel)){
    ?>
<div class="node"><input type="radio" name="bank_code" value="<?php echo $mul_bank_code['id'];?>" ><span><?php echo $mul_bank_code['name'];  ?></span></div>

<?php if($b%3 ==0 )echo "<br style='clear:both;'>"; $b++;?>  
 <?php 
   }
                 
                 
                 } ?> 
                 <br style='clear:both;'>
                 </div>
                          
                          <?php }?>
                          
                          <?php if(is_array($tpsl_broking_bank_code_sel) and count($tpsl_broking_bank_code_sel)>0){ ?>
                          
                          		<div class="box" id="broking" style="display:none;">
                                
								<?php $b=1;  foreach ($tpsl_broking_bank_code_arr as $mul_bank_code){
    if(in_array($mul_bank_code['id'],$tpsl_broking_bank_code_sel)){
    ?>
<div class="node"><input type="radio" name="bank_code" value="<?php echo $mul_bank_code['id'];?>" ><span><?php echo $mul_bank_code['name'];  ?></span></div><?php if($b%2 ==0 )echo "<br style='clear:both;'>"; $b++;?>   <?php 
   }
                 
                 
                 } ?> 
             <br >
                 </div>
                          
                          <?php }?>
                          
                          <?php if(is_array($tpsl_cc_bank_code_sel) and count($tpsl_cc_bank_code_sel)>0){ ?>
                          
                          		<div class="box" id="cc" style="display:none;">
                                
								<?php $b=1;  foreach ($tpsl_cc_bank_code_arr as $mul_bank_code){
    if(in_array($mul_bank_code['id'],$tpsl_cc_bank_code_sel)){
    ?>
<div class="node"><input type="radio" name="bank_code" value="<?php echo $mul_bank_code['id'];?>" ><span><?php echo $mul_bank_code['name'];  ?></span></div><?php if($b%2 ==0 )echo ""; $b++;?>   <?php 
   }
                 
                 
                 } ?> 
                 <br >
                 </div>
                          
                          <?php }?>
                          
                          <?php if(is_array($tpsl_cash_bank_code_sel) and count($tpsl_cash_bank_code_sel)>0){ ?>
                          
                          		<div class="box" id="cash" style="display:none;">
                                
								<?php $b=1;  foreach ($tpsl_cash_bank_code_arr as $mul_bank_code){
    if(in_array($mul_bank_code['id'],$tpsl_cash_bank_code_sel)){
    ?>
<div class="node"><input type="radio" name="bank_code" value="<?php echo $mul_bank_code['id'];?>" ><span><?php echo $mul_bank_code['name'];  ?></span></div><?php if($b%2 ==0 )echo "<br style='clear:both;'>"; $b++;?>   <?php 
   }
                 
                 
                 } ?>  <br >
                 </div>
                          
                          <?php }?>
                          
                          <?php if(is_array($tpsl_corp_bank_code_sel) and count($tpsl_corp_bank_code_sel)>0){ ?>
                          
                          		<div class="box" id="corp" style="display:none;">
                                
								<?php $b=1;  foreach ($tpsl_corp_bank_code_arr as $mul_bank_code){
    if(in_array($mul_bank_code['id'],$tpsl_corp_bank_code_sel)){
    ?>
<div class="node"><input type="radio" name="bank_code" value="<?php echo $mul_bank_code['id'];?>" ><span><?php echo $mul_bank_code['name'];  ?></span></div><?php if($b%2 ==0 )echo "<br style='clear:both;'>"; $b++;?>   <?php 
   }
                 
                 
                 } ?>  <br >
                 </div>
                          
                          <?php }?>
                           </td>
                          </tr> 
                          </table>
                          </td>
                          </tr>
                          </table>
                          
                <?php 
  }?>           
  <div class="buttons">
    <div class="right"><a onclick="$('#payment').submit();" class="button"><span><?php echo $button_confirm; ?></span></a></div>
  </div>
</form>

