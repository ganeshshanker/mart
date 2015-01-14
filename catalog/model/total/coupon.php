<?php
class ModelTotalCoupon extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		if (isset($this->session->data['coupon'])) {
			$this->language->load('total/coupon');
			
			$this->load->model('checkout/coupon');
			 
			$coupon_info = $this->model_checkout_coupon->getCoupon($this->session->data['coupon']);
			
			if ($coupon_info) {
				$discount_total = 0;
				
				if (!$coupon_info['product']) {
					 $sub_total = $this->cart->getSubTotal();
					
				} else {
					$sub_total = 0;
				
					foreach ($this->cart->getProducts() as $product) {
						if (in_array($product['product_id'], $coupon_info['product'])) {
							 $sub_total += $product['total'];
							  
							  // Ganesh
							  $cart_coupan_no = $this->session->data['coupon'];
							  $cart_valid_total = $sub_total;
							 
						}
					}					
				}
				
				// For Fixed Amount
				if ($coupon_info['type'] == 'F') {
					$coupon_info['discount'] = min($coupon_info['discount'], $sub_total);
				}
				
				foreach ($this->cart->getProducts() as $product) {
					$discount = 0;
					
					if (!$coupon_info['product']) {
						$status = true;
					} else {
						if (in_array($product['product_id'], $coupon_info['product'])) {
							$status = true;
						} else {
							$status = false;
						}
					}
					
					if ($status) {
						if ($coupon_info['type'] == 'F') {
							 $discount = $coupon_info['discount'] * ($product['total'] / $sub_total);
						} elseif ($coupon_info['type'] == 'P') {
							// For Percentage Amount
							   $cart_valid_total =  $product['total'];
							 $discount = $product['total'] / 100 * $coupon_info['discount'];
							 // Ganesh
									  $cart_discount = $discount;	 echo "<br>";										 
											 
									$con = mysqli_connect("localhost","skbmart_skb_db", "hT^GRp&*0p&W","skbmart_skb_db");
									// Check connection
									if (mysqli_connect_errno()) 
									{
									    "Failed to connect to MySQL: " . mysqli_connect_error();
									}
									
									$query_coupon = $this->session->data['coupon'];
									$select_query = "SELECT * FROM oc_coupon where code = $query_coupon"; 
									$result = mysqli_query($con,$select_query);
									
									while($row = mysqli_fetch_array($result)) 
									{
									  //echo $row['name'] . " " . $row['code'];
									  //echo $cart_valid_total;	
									  
									  // Ganesh			
									    $db_coupan_no = $row['code'];	// echo "<br>";
									    $db_min_valid_total = $row['total'];  //echo "<br>";
										$db_min_valid_total = sprintf("%01.2f", $db_min_valid_total);
										
										
									    $db_max_valid_total = $row['max_total'];  //echo "<br>";
										$db_max_valid_total = sprintf("%01.2f", $db_max_valid_total);
										
																				
									    $db_max_discount = $row['max_discount'];  //echo "<br>";
										$db_max_discount = sprintf("%01.2f", $db_max_discount);							  													  
									}
									
									 $cart_valid_total;  //echo "<br>";	
									 $cart_discount;   //echo "<br>";	
									mysqli_close($con);									
								 
									//echo $discount_total;
									//$cart_valid_total <= $db_min_valid_total and  $cart_valid_total > $db_max_valid_total )and 
									//if($cart_discount <= $db_max_discount && $cart_valid_total)
									//&& ($cart_discount <= $db_max_discount && $cart_valid_total > $db_max_valid_total)
									$cart_valid_total = sprintf("%01.2f", $cart_valid_total);
									//echo $cart_valid_total .'>'. $db_min_valid_total; echo "<br />";
									//echo $cart_valid_total .'<'. $db_max_valid_total; echo "<br />";
									//echo $discount  .'<='.  $db_max_discount; echo "<br />";
									if(($cart_valid_total > $db_min_valid_total) and $discount <= $db_max_discount)  // (($cart_valid_total < $db_max_valid_total))
									{
										//echo //$cart_valid_total .'-'; echo $db_min_valid_total;
										//$cart_discount += $discount;
										$discount_total +=  $discount;
										//echo sprintf("%01.2f", $db_min_valid_total);
										//echo "-if";
									}
									else
									{
										if($cart_discount <= $db_max_discount ) //&& $cart_valid_total
										{
											//$discount_total += $discount;
											$discount = 0;
											//echo "-else";
										}
										else
										{
											$discount_total += $db_max_discount;
											//echo "-other";
										}
									}
									//echo "<br />";
									  //$discount_total += $discount; echo "<br />";
									 
									// End Ganesh
							  }
					  
							  if ($product['tax_class_id']) {
								  $tax_rates = $this->tax->getRates($product['total'] - ($product['total'] - $discount), $product['tax_class_id']);
								  
								  foreach ($tax_rates as $tax_rate) {
									  if ($tax_rate['type'] == 'P') {
										  $taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
									  }
								  }
							  }
						  }							
				
				}
				
				if ($coupon_info['shipping'] && isset($this->session->data['shipping_method'])) {
					if (!empty($this->session->data['shipping_method']['tax_class_id'])) {
						$tax_rates = $this->tax->getRates($this->session->data['shipping_method']['cost'], $this->session->data['shipping_method']['tax_class_id']);
						
						foreach ($tax_rates as $tax_rate) {
							if ($tax_rate['type'] == 'P') {
								$taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
							}
						}
					}
					
					$discount_total += $this->session->data['shipping_method']['cost'];				
				}				
      			
				$total_data[] = array(
					'code'       => 'coupon',
        			'title'      => sprintf($this->language->get('text_coupon'), $this->session->data['coupon']),
	    			'text'       => $this->currency->format(-$discount_total),
        			'value'      => -$discount_total,
					'sort_order' => $this->config->get('coupon_sort_order')
      			);

				$total -= $discount_total;
			} 
		}
	}
	
	public function confirm($order_info, $order_total) {
		$code = '';
		
		$start = strpos($order_total['title'], '(') + 1;
		$end = strrpos($order_total['title'], ')');
		
		if ($start && $end) {  
			$code = substr($order_total['title'], $start, $end - $start);
		}	
		
		$this->load->model('checkout/coupon');
		
		$coupon_info = $this->model_checkout_coupon->getCoupon($code);
			
		if ($coupon_info) {
			$this->model_checkout_coupon->redeem($coupon_info['coupon_id'], $order_info['order_id'], $order_info['customer_id'], $order_total['value']);	
		}						
	}
}
?>