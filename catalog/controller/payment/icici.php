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
//include("icici/Sfa/EncryptionUtil.php");

class ControllerPaymenticici extends Controller {
	
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
		$gk = $this->getkey($this->currency->getCode());
		$cur=$gk['cur'];
		$key=$gk['key'];
		$this->data['currency'] = $gk['cur'];
		
		$total = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);		
		
		$ntotal = $this->currency->convert( $total, $order_info['currency_code'],$cur);		
		$total_amount =	sprintf("%.2f", $ntotal);	

		$redir_url= $this->url->link('payment/icici/callback', '', 'SSL');		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/icici.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/icici.tpl';
		} else {
			$this->template = 'default/template/payment/icici.tpl';
		}			
		
		//DATA FOR ICICI
		$oMerchant->setMerchantDetails($key,$key,$key,$_SERVER['REMOTE_ADDR'],$order_info['order_id'],"Ord".rand(),$redir_url,"POST",$cur,"INV".rand(),"req.Preauthorization",$total_amount,"","Ext1","true","Ext3","Ext4","New PHP");
		$oBTA->setAddressDetails ($order_info['customer_id'],$order_info['firstname'],$order_info['payment_address_1'],$order_info['payment_address_2'],"",$order_info['payment_city'],$order_info['payment_zone'],$order_info['payment_postcode'],$order_info['payment_iso_code_3'],$order_info['email']);
		//billing_address
		$oSTA->setAddressDetails ($order_info['shipping_address_1'],$order_info['shipping_address_2'],"",$order_info['shipping_city'],$order_info['shipping_zone'],$order_info['shipping_postcode'],$order_info['shipping_iso_code_3'],$order_info['email']);
		//shipping_address
		$oPGResp=$oPostLibphp->postSSL($oBTA,$oSTA,$oMerchant,$oMPI,$oPGReserveData);		
			
	  if($oPGResp->getRespCode() == '000'){
		  $url	=$oPGResp->getRedirectionUrl();	
		  
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
        $astrDigest = $_POST['EncryptedData'];
		$gk = $this->getkey($this->currency->getCode());
		$key=$gk['key'];
        //$key= $this->config->get('icici_access_key');
        $keypath="/icici/key/".$key.".key";
        $oEncryptionUtilenc = new EncryptionUtil();
		$astrsfaDigest  = $oEncryptionUtilenc->getHMAC($data,$keypath,$key);

        if (strcasecmp($astrDigest, $astrsfaDigest) == 0) {
        	$log->write("ICICI Response - ".$data);
        	parse_str($data, $resp);					
		
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
		else //tampared 
		{
			$log->write("ICICI Response Tampared- ".$data);
			$this->redirect($this->url->link('checkout/fail'));	
		}
		
	}
	
	private function getkey($code='')
	{
		$key='';
		$cur='';
		
		switch($code)
		{
			case $this->config->get('icici_currency1'): $key=$this->config->get('icici_access_key1'); $cur=$this->config->get('icici_currency1'); break;
			case $this->config->get('icici_currency2'): $key=$this->config->get('icici_access_key2'); $cur=$this->config->get('icici_currency2'); break;
			case $this->config->get('icici_currency3'): $key=$this->config->get('icici_access_key3'); $cur=$this->config->get('icici_currency3'); break;
			default: $key=$this->config->get('icici_access_key1'); $cur=$this->config->get('icici_currency1'); 
		}
		
		return array('key' => $key,'cur' =>$cur);
	}

}
?>