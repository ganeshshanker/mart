<?php 
class ModelPaymenticiciemi extends Model {
  	public function getMethod($address, $total) {
		$this->load->language('payment/icici_emi');
		
		$method_data = array();
	
		$status = true;
		if ($status) {  
      		$method_data = array( 
        		'code'       => 'icici_emi',
        		'title'      => $this->language->get('text_title'),
				'sort_order' => $this->config->get('icici_emi_sort_order'),
				'custom' => '<label>Hello</label>'
      		);
    	}
   
    	return $method_data;
  	}
}
?>