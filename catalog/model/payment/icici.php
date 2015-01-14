<?php 
class ModelPaymenticici extends Model {
  	public function getMethod($address, $total) {
		$this->load->language('payment/icici');
		
		$method_data = array();
	
		$status = true;
		if ($status) {  
      		$method_data = array( 
        		'code'       => 'icici',
        		'title'      => $this->language->get('text_title'),
				'sort_order' => $this->config->get('icici_sort_order')
      		);
    	}
   
    	return $method_data;
  	}
}
?>