<?php /* Opencart Module v1.0 for Citrus Payment Gateway - Copyrighted file (viatechs.in) - Please do not modify/refactor/disasseble/extract any or all part content  */ ?>
<?php 
	class ControllerCheckoutSuccess extends Controller 
	{ 
		public function index() 
		{ 
			// For dgxsell sent Total on sucess Page.
			$sucesstotal =  $this->session->data['total'];
			$sucessorder_id = $this->session->data['order_id'];
			$orderinfo =  $this->session->data['total'].$this->session->data['order_id']."<script src='//x.s2d6.com/js/globalpixel.js?x=r&h=67564&o=$sucessorder_id&g=transaction&s=$sucesstotal&q=1'></script>";

			if (isset($this->session->data['order_id'])) 
			{
				$this->cart->clear();
				
				// For dgxsell sent Total on sucess Page.
				unset($this->session->data['total']);   
				unset($this->session->data['shipping_method']);


				unset($this->session->data['shipping_methods']);


				unset($this->session->data['payment_method']);


				unset($this->session->data['payment_methods']);


				unset($this->session->data['guest']);


				unset($this->session->data['comment']);


				unset($this->session->data['order_id']);


				unset($this->session->data['coupon']);


				unset($this->session->data['reward']);


				unset($this->session->data['voucher']);


				unset($this->session->data['vouchers']);


			}   


			$this->language->load('checkout/success');


			$this->document->setTitle($this->language->get('heading_title'));


			$this->data['breadcrumbs'] = array();       


			$this->data['breadcrumbs'][] = array('href'=> 


			$this->url->link('common/home'),'text'=> $this->language->get('text_home'), 


			'separator' => false);      


			$this->data['breadcrumbs'][] = array('href'=> 


			$this->url->link('checkout/cart'),'text'=> 


			$this->language->get('text_basket'),'separator' => 


			$this->language->get('text_separator'));


			$this->data['breadcrumbs'][] = array('href'=> 


			$this->url->link('checkout/checkout', '', 'SSL'),'text'=> 


			$this->language->get('text_checkout'),'separator' => 


			$this->language->get('text_separator'));


			$this->data['breadcrumbs'][] = array('href'=> 


			$this->url->link('checkout/success'),'text'=> 


			$this->language->get('text_success'),'separator' => 


			$this->language->get('text_separator')      );   


			$this->data['heading_title'] = $this->language->get('heading_title');


//			if ($this->customer->isLogged()) 
//
//
//			{ 
//
//
//				$this->data['text_message'] = sprintf($this->language->get('text_customer'), 
//
//
//				$this->url->link('account/account', '', 'SSL'), 
//
//
//				$this->url->link('account/order', '', 'SSL'), 
//
//
//				$this->url->link('account/download', '', 'SSL'), 
//
//
//				$this->url->link('information/contact'));
//
//
//			} 
//
//
//			else 
//
//
//			{    
//
//
//				$this->data['text_message'] = sprintf($this->language->get('text_guest'), 
//
//
//				$this->url->link('information/contact'));
//
//
//			}    

			// For dgxsell sent Total on sucess Page.

			if ($this->customer->isLogged()) {
					 $new_message = $orderinfo;
					 $new_message .= sprintf($this->language->get('text_customer'), 
									 $this->url->link('account/account', '', 'SSL'), 
									 $this->url->link('account/order', '', 'SSL'), 
									 $this->url->link('account/download', '', 'SSL'), 
									 $this->url->link('information/contact'));
					  				 $this->data['text_message'] = $new_message;
				  } else {
					 $new_message = $orderinfo;
					 $new_message .= sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
					  $this->data['text_message'] = $new_message;
				  }


			$this->data['button_continue'] = $this->language->get('button_continue');  


			$this->data['continue'] = $this->url->link('common/home');


			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) 


			{


				$this->template = $this->config->get('config_template') . '/template/common/success.tpl';


			} 


			else 


			{


				$this->template = 'default/template/common/success.tpl';


			}


			$this->children = array('common/column_left','common/column_right','common/content_top','common/content_bottom','common/footer','common/header');


			$this->response->setOutput($this->render());  


		}


	}


?>