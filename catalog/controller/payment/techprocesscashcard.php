<?php
class ControllerPaymentTechProcessCashCard extends Controller {
	protected function index() {
    	$this->data['button_confirm'] = $this->language->get('button_confirm');

		$this->load->model('checkout/order');
		
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		
		$this->data['action'] = 'http://www.skbmart.com/catalog/controller/payment/getcheck.php';

		$this->data['liveid'] = $this->config->get('techprocesscashcard_account');
		$this->data['testid'] = $this->config->get('techprocesscashcard_testaccount');
		$this->data['secret'] = $this->config->get('techprocesscashcard_secret');
		$this->data['responseurl'] = $this->config->get('techprocesscashcard_responseurl');
		$this->data['bank'] = $this->config->get('techprocesscashcard_bank');
		$this->data['total'] = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
		$this->data['cart_order_id'] = $this->session->data['order_id'];
		/*$this->data['card_holder_name'] = $order_info['payment_firstname'] . ' ' . $order_info['payment_lastname'];
		$this->data['street_address'] = $order_info['payment_address_1'];
		$this->data['city'] = $order_info['payment_city'];
		
		if ($order_info['payment_iso_code_2'] == 'US' || $order_info['payment_iso_code_2'] == 'CA') {
			$this->data['state'] = $order_info['payment_zone'];
		} else {
			$this->data['state'] = 'XX';
		}
		
		$this->data['zip'] = $order_info['payment_postcode'];
		$this->data['country'] = $order_info['payment_country'];
		$this->data['email'] = $order_info['email'];
		$this->data['phone'] = $order_info['telephone'];
		
		if ($this->cart->hasShipping()) {
			$this->data['ship_street_address'] = $order_info['shipping_address_1'];
			$this->data['ship_city'] = $order_info['shipping_city'];
			$this->data['ship_state'] = $order_info['shipping_zone'];
			$this->data['ship_zip'] = $order_info['shipping_postcode'];
			$this->data['ship_country'] = $order_info['shipping_country'];
		} else {
			$this->data['ship_street_address'] = $order_info['payment_address_1'];
			$this->data['ship_city'] = $order_info['payment_city'];
			$this->data['ship_state'] = $order_info['payment_zone'];
			$this->data['ship_zip'] = $order_info['payment_postcode'];
			$this->data['ship_country'] = $order_info['payment_country'];			
		}
		
		$this->data['products'] = array();
		
		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$this->data['products'][] = array(
				'product_id'  => $product['product_id'],
				'name'        => $product['name'],
				'description' => $product['name'],
				'quantity'    => $product['quantity'],
				'price'		  => $this->currency->format($product['price'], $order_info['currency_code'], $order_info['currency_value'], false)
			);
		}
*/
		if ($this->config->get('techprocesscashcard_test')) {
			$this->data['demo'] = 'Y';
		} else {
			$this->data['demo'] = '';
		}
		
		$this->data['lang'] = $this->session->data['language'];

		$this->data['return_url'] = $this->url->link('payment/techprocess/callback', '', 'SSL');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/techprocesscashcard.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/techprocesscashcard.tpl';
		} else {
			$this->template = 'default/template/payment/techprocesscashcard.tpl';
		}	
		
		$this->render();
	}
	
	public function callback() {
		$this->load->model('checkout/order');
		
		$order_info = $this->model_checkout_order->getOrder($this->request->post['cart_order_id']);
		
		if (!$this->config->get('techprocesscashcard_test')) {
			$order_number = $this->request->post['order_number'];
		} else {
			$order_number = '1';
		}
		
		if (strtoupper(md5($this->config->get('techprocesscashcard_secret') . $this->config->get('techprocesscashcard_account') . $order_number . $this->request->post['total'])) == $this->request->post['key']) {
			if ($this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false) == $this->request->post['total']) {
				$this->model_checkout_order->confirm($this->request->post['cart_order_id'], $this->config->get('techprocesscashcard_order_status_id'));
			} else {
				$this->model_checkout_order->confirm($this->request->post['cart_order_id'], $this->config->get('config_order_status_id'));// Ugh. Some one've faked the sum. What should we do? Probably drop a mail to the shop owner?				
			}
			
			// We can't use $this->redirect() here, because of 2CO behavior. It fetches this page
			// on behalf of the user and thus user (and his browser) see this as located at Techprocess.com
			// domain. So user's cookies are not here and he will see empty basket and probably other
			// weird things.
			
			echo '<html>' . "\n";
			echo '<head>' . "\n";
			echo '  <meta http-equiv="Refresh" content="0; url=' . $this->url->link('checkout/success') . '">' . "\n";
			echo '</head>'. "\n";
			echo '<body>' . "\n";
			echo '  <p>Please follow <a href="' . $this->url->link('checkout/success') . '">link</a>!</p>' . "\n";
			echo '</body>' . "\n";
			echo '</html>' . "\n";
			exit();
		} else {
			echo 'The response from Payment gateway can\'t be parsed. Contact site administrator, please!'; 
		}		
	}
}
?>