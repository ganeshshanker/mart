<?php
class ControllerPaymentTpsl extends Controller {
	protected function index() {
    	$this->data['button_confirm'] = $this->language->get('button_confirm');

		$this->load->model('checkout/order');
		
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		
		$this->load->library('encryption');
		
		$this->data['action'] = 'index.php?route=payment/tpsl/process';

		
		$this->data['order_id'] = $order_info['order_id'];
		$this->data['amount'] = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
		
		
		$this->data['siteurl'] = $this->config->get('siteurl');
		$this->data['tpsl_account_no'] = $this->config->get('tpsl_account_no');
		
		$this->data['tpsl_market_code'] = $this->config->get('tpsl_market_code');
		
		$this->data['tpsl_bank_code_type'] = $this->config->get('tpsl_bank_code_type');
		
		$this->data['tpsl_single_bank_code'] = $this->config->get('tpsl_single_bank_code');
		
		$this->data['tpsl_single_bank_code'] = $this->config->get('tpsl_single_bank_code');
		
		$this->load->model('bankcode/bankcode');
		
		$this->data['tpsl_multiple_bank_code_arr']=$this->model_bankcode_bankcode->getBankCode();		
		$this->data['tpsl_multiple_bank_code_sel']=$this->config->get('tpsl_multiple_bank_code');
		
		$this->data['tpsl_broking_bank_code_arr']=$this->model_bankcode_bankcode->getBrokingBankCode();		
		$this->data['tpsl_broking_bank_code_sel']=$this->config->get('tpsl_broking_bank_code');
		
		$this->data['tpsl_cash_bank_code_arr']=$this->model_bankcode_bankcode->getCashBankCode();		
		$this->data['tpsl_cash_bank_code_sel']=$this->config->get('tpsl_cash_bank_code');
		
		$this->data['tpsl_cc_bank_code_arr']=$this->model_bankcode_bankcode->getCcBankCode();		
		$this->data['tpsl_cc_bank_code_sel']=$this->config->get('tpsl_cc_bank_code');
		
		$this->data['tpsl_corp_bank_code_arr']=$this->model_bankcode_bankcode->getCorpBankCode();		
		$this->data['tpsl_corp_bank_code_sel']=$this->config->get('tpsl_corp_bank_code');
		
		
		
		//-lable text
		$this->load->language('payment/tpsl');
		$this->data['entry_single_bank_code'] = $this->language->get('entry_single_bank_code');
		$this->data['entry_mul_bank_code'] = $this->language->get('entry_mul_bank_code');
		
		//print_r($this->config->get('tpsl_multiple_bank_code'));
		
		$this->template = 'default/template/payment/tpsl.tpl';
		
		$this->render();
	}
	
	public function process()
	{
		
	//----------load merchant properties
	$this->load->model('bankcode/bankcode');
	$property_data_array=$this->model_bankcode_bankcode->getMerchantProperties();	
	//echo "============".count($property_data_array);
	//die();
	
		if(count($property_data_array)<5)
		{
			/*echo("Invald Proprty File");
			die();*/
			$this->data['error']="Invalid property file data count"; 
		}

		$txtBillerId=$property_data_array['txtBillerId'];
		$txtResponseUrl=$property_data_array['txtResponseUrl'];
		$txtCRN=$property_data_array['txtCRN'];
		$txtCheckSumKey=$property_data_array['txtCheckSumKey'];
		$CheckSumGenUrl=$property_data_array['CheckSumGenUrl'];
		$TPSLUrl=$property_data_array['tpslUrl'];
		
//---Create String using property data 
		$txtBillerIdStr="txtBillerid=".trim($txtBillerId)."&";
		$txtResponseUrl1="txtResponseUrl=".trim($txtResponseUrl)."&";
		$txtCRN1="txtCRN=".trim($txtCRN)."&";
		$txtCheckSumKey1="txtCheckSumKey=".trim($txtCheckSumKey);
				
		$Proper_string=$txtBillerIdStr.$txtResponseUrl1.$txtCRN1.$txtCheckSumKey1;

//---Encrypting values
		$txtTranID=trim($this->request->post['order_id']); 
		$txtMarketCode=trim(trim($this->request->post['tpsl_market_code']));
		$txtAcctNo=trim(trim($this->request->post['tpsl_account_no']));
		$txtTxnAmount=trim(trim($this->request->post['amount']));
		$txtBankCode=trim(trim($this->request->post['tpsl_bank_code']));
		
		$txtVals = trim($txtTranID) . trim($txtMarketCode) . trim($txtAcctNo) . trim($txtTxnAmount) . trim($txtBankCode);

		$txt_encrypt = md5(base64_encode($txtVals));
		
        $txtKey = $txtCheckSumKey;
		$txtForEncode = trim($txt_encrypt) . trim($txtKey);
		$txtPostid = md5($txtForEncode);
		
		
// Creating string for $Postid.
		$txtPostid="txtPostid=".$txtPostid;
		  
		$UserDataString="action=process&txtTranID=".$txtTranID."&txtMarketCode=".trim(trim($this->request->post['tpsl_market_code']))."&txtAcctNo=".trim(trim($this->request->post['tpsl_account_no']))."&txtTxnAmount=".trim(trim($this->request->post['amount']))."&txtBankCode=".trim(trim($this->request->post['tpsl_bank_code']))."&proceed=Proceed";
	
		$PostData=trim($UserDataString).trim("&").trim($Proper_string).trim("&").trim($txtPostid);
		
		//------------------------------------------------------
		
		$url=$CheckSumGenUrl;
		
		$ref_url= $this->config->get('siteurl')."?route=payment/tpsl/callback/";
        //$ref_url = "http://www.skbmart.com/catalog/controller/payment/getcheck.php";
		
        //echo $url . " -- " . $PostData . " -- " . $ref_url;
		$Received_CheckSum_Data=$this->executeCurl($url,$PostData,$ref_url);
	 
	 	//$Received_CheckSum_Data="12345678";
		 if(strlen(trim($Received_CheckSum_Data))>0 && is_numeric(trim($Received_CheckSum_Data)))
		 {
		
		//###########  Create msg String ###########################
		  $ParamString=trim($txtBillerId)."|".trim($txtTranID)."|NA|NA|".trim($txtTxnAmount)."|".trim($txtBankCode)."|NA|NA|".trim($txtCRN)."|NA|NA|NA|NA|NA|NA|NA|".trim($txtMarketCode)."|".trim($txtAcctNo)."|NA|NA|NA|NA|NA|".trim($txtResponseUrl);
	
	
	
		 $this->data['finalUrlParam']=trim($ParamString)."|".trim($Received_CheckSum_Data);
			$this->data['error']=""; 
	        echo "
		          <form id='subFrm' name='subFrm' method='post' action='".$TPSLUrl."'>
			          <input type='hidden' name='msg' value='".$this->data['finalUrlParam']."'>
			          </form>
		          <script>
		          document.subFrm.submit();
		         </script>
	          ";	
	
		 //----Create dyanamic form and submit to payment gatway
	
		  }
		  else
		  {
			$this->data['error']="There is some problem contacting Payment Gateway Server.<br/>Kindly try again and if problem persists, please contact support at <a href='mailto:support@skbmart.com'>support@skbmart.com</a>"; 
		  }  

			$this->data['tpslurl']=$TPSLUrl;
		//	$this->data['tpslurl']="http://97.74.152.100/tpsl/opencart/submit.php";

	
	$this->template =  'default/template/payment/tpsl_process.tpl';
	$this->data['postdata'] = $this->request->post;
	
	
	
		//print_r($this->request->post);
		$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'	
			);
						
			$this->response->setOutput($this->render());
			$this->response->setOutput($this->render());
	   
	}
	
	protected function executeCurl($url,$param,$ref_url)
	{
	  
	 //echo "<br>=====current working".getcwd() . "->" . $ref_url; 
	 $ch = curl_init($url);
	 curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 1);
	 curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, False);
	 curl_setopt($ch, CURLOPT_CAINFO, getcwd() . '/keystoretekp.pem'); //Setting certificate path
	 curl_setopt ($ch, CURLOPT_SSLCERTPASSWD, 'changeit');
	 curl_setopt($ch, CURLOPT_POST      ,1);
	 //curl_setopt($ch, CURLOPT_TIMEOUT  ,10); // Not required. Don't use this.
	 curl_setopt($ch, CURLOPT_REFERER  ,$ref_url); //Setting header URL
	 curl_setopt($ch, CURLOPT_POSTFIELDS    ,$param);
	 curl_setopt($ch, CURLOPT_FOLLOWLOCATION  ,1); 
	 curl_setopt($ch, CURLOPT_HEADER      ,0);  // DO NOT RETURN HTTP HEADERS 
	 curl_setopt($ch, CURLOPT_RETURNTRANSFER  ,1); // RETURN THE CONTENTS OF THE CALL
	 
	 $Received_CheckSum_Data = curl_exec($ch);
	 
	 //print_r( $Received_CheckSum_Data);
	 curl_close($ch);
	
	return $Received_CheckSum_Data;
	  
	}
	
	public function callback() {
		if (isset($this->request->post['msg'])) {
		
		
		   //------------------receive response
		   $msg=$this->request->post['msg'];
		   //echo $msg;
		   
		
			$this->language->load('payment/tpsl');
		
			$this->data['title'] = $this->language->get('heading_title');

			if (!isset($this->request->server['HTTPS']) || ($this->request->server['HTTPS'] != 'on')) {
				$this->data['base'] = HTTP_SERVER;
			} else {
				$this->data['base'] = HTTPS_SERVER;
			}
		
			$this->data['charset'] = $this->language->get('charset');
			$this->data['language'] = $this->language->get('code');
			$this->data['direction'] = $this->language->get('direction');
		
			$this->data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
			
			$this->data['text_response'] = $this->language->get('text_response');
			$this->data['text_success'] = $this->language->get('text_success');
			$this->data['text_success_wait'] = sprintf($this->language->get('text_success_wait'), $this->url->link('checkout/success'));
			$this->data['text_failure'] = $this->language->get('text_failure');
			$this->data['text_failure_wait'] = sprintf($this->language->get('text_failure_wait'), $this->url->link('checkout/cart', '', 'SSL'));
			
			
			//-----------Cross check response 
			
			 $msg_array=explode("|",$msg);
			 $orderid=$msg_array[1];
			//--------------create respose string
			$txtResponseKey = $this->getresponseString($msg_array);
			$txtResponseKey = "txtResponseKey=" . $txtResponseKey;
			
			//---------------execute curl
			
			$this->load->model('bankcode/bankcode');
			$property_data_array=$this->model_bankcode_bankcode->getMerchantProperties();	
			
			
			$url=$property_data_array['CheckSumGenUrl'];
			$ref_url=  $this->config->get('siteurl')."index.php?route=payment/tpsl/callback/";
			$Received_CheckSum_Data=$this->executeCurl($url,$txtResponseKey,$ref_url);
			
		//	$Received_CheckSum_Data=111; $msg_array[25]=111;
			
			if(trim($Received_CheckSum_Data) == trim($msg_array[25])){ 
				$this->load->model('checkout/order');

				$this->model_checkout_order->confirm($orderid, $this->config->get('tpsl_order_status_id'));
		
				$message = '';

				if (isset($orderid)) {
					$message .= 'transId: ' . $orderid . "\n";
				}
			
				
			//$msg_array[14]='0300';
			//echo "<br>-------------".$msg_array[14];
				if(trim($msg_array[14])=='0300') //-----order is success
				{
					
				//	echo "<br><br>=====In Success";
					$this->model_checkout_order->confirm($orderid, 5);
					
					$this->model_checkout_order->update($orderid, 5, $message, false);
		
					$this->data['continue'] = $this->url->link('checkout/success');				
					$this->template = 'default/template/payment/tpsl_success.tpl';				
		
	  				$this->response->setOutput($this->render());
				}
				else //-----order is fail
				{
				 
				 	$this->data['continue'] = $this->url->link('checkout/cart');				
					$this->template = 'default/template/payment/tpsl_failure.tpl';					
					$this->response->setOutput($this->render());
				}		

								
			}
			 else {
    			$this->data['continue'] = $this->url->link('checkout/cart');		
				
				$this->template = 'default/template/payment/tpsl_failure.tpl';
				
				
	  			$this->response->setOutput($this->render());					
			}
		}
	}
	
	protected function getresponseString($msg_array)
	{
	
	$this->load->model('bankcode/bankcode');
	$property_data_array=$this->model_bankcode_bankcode->getMerchantProperties();	
	
	
	$txtCheckSumKey=$property_data_array['txtCheckSumKey'];
	
	 $txtResponseKey = $msg_array[0] ."|".$msg_array[1] ."|".$msg_array[2] ."|".$msg_array[3] ."|".$msg_array[4] ."|".$msg_array[5] ."|".$msg_array[6] ."|".$msg_array[7] ."|".$msg_array[8] ."|".$msg_array[9] ."|".$msg_array[10] ."|".$msg_array[11] ."|".$msg_array[12] ."|".$msg_array[13] ."|".$msg_array[14] ."|".$msg_array[15] ."|".$msg_array[16] ."|".$msg_array[17] ."|".$msg_array[18] ."|".$msg_array[19] ."|".$msg_array[20] ."|".$msg_array[21] ."|".$msg_array[22] ."|".$msg_array[23] ."|".$msg_array[24] ."|".$txtCheckSumKey;
	 
	 return $txtResponseKey;
	}
}
?>