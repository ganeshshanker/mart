<?php
ob_start();
include("icici/Sfa/BillToAddress.php");
include("icici/Sfa/CardInfo.php");
include("icici/Sfa/Merchant.php");
include("icici/Sfa/MPIData.php");
include("icici/Sfa/ShipToAddress.php");
include("icici/Sfa/PGResponse.php");
include("icici/Sfa/PostLibPHP.php");
include("icici/Sfa/PGReserveData.php");

class ControllerPaymenticiciemi extends Controller {
	
	protected function index() {
		global $_SERVER;
		
		$oMPI 			= 	new MPIData();
		$oCI			=	new	CardInfo();
		$oPostLibphp	=	new	PostLibPHP();
		$oMerchant		=	new	Merchant();
		$oBTA			=	new	BillToAddress();
		$oSTA			=	new	ShipToAddress();
		$oPGResp		=	new	PGResponse();
		$oPGReserveData =	new PGReserveData();
		
    	$this->data['button_confirm'] = $this->language->get('button_confirm');

		$this->load->model('checkout/order');
		
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']); //order add
				
		
		$key= $this->config->get('icici_access_key_'.$this->session->data['emioptn']);	//Merchant ID as per emi option	
		
		$this->data['currency'] = $this->config->get('config_currency');
		
		$total = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);		
		
		$ntotal = $this->currency->convert( $total, $this->currency->getCode(),$this->data['currency']);		
		$total_amount =	sprintf("%.2f", $ntotal);	

		$redir_url= $this->url->link('payment/icici_emi/callback', '', 'SSL');		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/icici_emi.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/icici_emi.tpl';
		} else {
			$this->template = 'default/template/payment/icici_emi.tpl';
		}			
		
		//DATA FOR ICICI
		//$oMerchant->setMerchantDetails($key,$key,$key,"",$order_info['order_id'],"",$redir_url,"POST",$this->data['currency'],"","req.Sale",$total_amount,"","","","","","");
		$oMerchant->setMerchantDetails($key,$key,$key,$_SERVER['REMOTE_ADDR'],$order_info['order_id'],"Ord".rand(),$redir_url,"POST",$this->data['currency'],"INV".rand(),"req.Sale",$total_amount,"","Ext1","true","Ext3","Ext4","New PHP");
		$oBTA->setAddressDetails ($order_info['customer_id'],$order_info['firstname'],$order_info['payment_address_1'],$order_info['payment_address_2'],"",$order_info['payment_city'],$order_info['payment_zone'],$order_info['payment_postcode'],$order_info['payment_iso_code_3'],$order_info['email']);
		//billing_address
		$oSTA->setAddressDetails ($order_info['shipping_address_1'],$order_info['shipping_address_2'],"",$order_info['shipping_city'],$order_info['shipping_zone'],$order_info['shipping_postcode'],$order_info['shipping_iso_code_3'],$order_info['email']);
		//shipping_address
		$oPGResp=$oPostLibphp->postSSL($oBTA,$oSTA,$oMerchant,$oMPI,$oPGReserveData);		
		//$enc=new EncryptionUtil;
		//$tm=$enc->getKey($key,"/icici/key/".$key.".key");
		//echo 'Emi option/key:'.$tm;
		//echo '<br />Received Response Code:'.$oPGResp->getRespCode();
		//exit();
	  if($oPGResp->getRespCode() == '000'){
		  $url	=$oPGResp->getRedirectionUrl();	
		  
		  //Debug
		  $logdata=$key.'**'.$key.'**'.$key.'**'.$_SERVER['REMOTE_ADDR'].'**'.$order_info['order_id'].'**'."Ord".rand().'**'.$redir_url.'**'."POST".'**'.$this->data['currency'].'**'."INV".rand().'**'."req.Sale".'**'.$total_amount.'**'."".'**'."Ext1".'**'."true".'**'."Ext3".'**'."Ext4".'**'."New PHP";
		  $logdata.="**".$order_info['customer_id'].'**'.$order_info['firstname'].'**'.$order_info['payment_address_1'].'**'.$order_info['payment_address_2'].'**'."".'**'.$order_info['payment_city'].'**'.$order_info['payment_zone'].'**'.$order_info['payment_postcode'].'**'.$order_info['payment_iso_code_3'].'**'.$order_info['email'];
		  $logdata.='**'.$order_info['shipping_address_1'].'**'.$order_info['shipping_address_2'].'**'."".'**'.$order_info['shipping_city'].'**'.$order_info['shipping_zone'].'**'.$order_info['shipping_postcode'].'**'.$order_info['shipping_iso_code_3'].'**'.$order_info['email'];
		  $logdata.='**GatewayUrl-'.$url;
		  //$this->WriteDebug("datapassed.log",$logdata);
		  $this->data['url'] = $url;
		  ob_end_flush();
		  $this->render();
	  }else{		  
		  $this->data['url'] = $this->url->link('checkout/fail');
		  ob_end_flush();
		  $this->render();

	  }

	}	
	
	
	public function callback() {
		global $log;
		$this->load->model('checkout/order');
		$data=html_entity_decode($_POST['DATA']);
		$log->write("ICICI EMI Response - ".$data);
        parse_str($data, $resp);					
		//if ($_POST['RespCode'] == 0)
		//$this->WriteDebug("response.log",$resp['RespCode'].' - '.$resp['Message']);
		if($resp['RespCode'] == 0)
		{
			$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('icici_order_status_id'));
		  	$this->redirect($this->url->link('checkout/success'));		  
		}
		else
		{
			$this->redirect($this->url->link('checkout/fail'));		  
		
		}
		
	}
	//Debug dumps
public function WriteDebug($file, $text)
{
	$fp=fopen($file,'w');
	fwrite($fp,trim($text));
	fclose($fp);	
}

}
?>