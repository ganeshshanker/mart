<?php 
//-----------------------------------------------------
// Filter Products Module for Opencart v1.5.X				
// Modified by Huu Ha                          		
// huuhath@gmail.com
// Website: http://tutviet.net 
// Version: 2.5                       		
//-----------------------------------------------------

class ControllerProductResults extends Controller {  
	public function index() { 
		$this->language->load('module/refine_search');

		$this->load->model('catalog/refine_search');
		
		$this->load->model('tool/image'); 
		if (substr(VERSION, 0, 5) >= '1.5.5') {
			$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');
		}
		$this->data['versionOC'] = substr(VERSION, 0, 5);
		//echo substr(VERSION, 0, 5);die;
		$this->data['breadcrumbs'] = array();
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);	
		
		$url_filter = '';

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}
		//$this->data['sidebar'] = true;
		if(isset($this->request->get['filterProduct'])){
			$url_filter .= '&filterProduct='.$this->request->get['filterProduct'];
			$filterProduct = $this->request->get['filterProduct'];
  			//$this->data['sidebar'] = false;
		}else{
			$filterProduct = '';
		}
		
		if (isset($this->request->get['category'])) {
			$url_filter .= '&category='.$this->request->get['category'];
			$listCategory = $this->stringToArray($this->request->get['category']);
			$category_id = array_shift($listCategory);
		} else {			
			$category_id = 0;
			$listCategory = '';
		}

		//$this->data['rootcate'] = $cateRoot;
		if (isset($this->request->get['brand'])) {
			$url_filter .= '&brand='.$this->request->get['brand'];
			$listBrands = $this->stringToArray($this->request->get['brand']);
		} else {
			$listBrands = '';
		}

		//get attribute group
		$listAttributes = array();
		$groups_attr = $this->model_catalog_refine_search->getAttributeGroups();
		foreach($groups_attr as $goup_attr){
			$results = $this->model_catalog_refine_search->getAttributesByAttributeGroupId(array('filter_attribute_group_id'=>$goup_attr['attribute_group_id']));
			if (isset($this->request->get['attr_group_'.$this->slug($goup_attr['name'],true)])) {
				$listAttributesByGroup =  $this->stringToArray($this->request->get['attr_group_'.$this->slug($goup_attr['name'],true)]);
				$listAttributes = array_merge($listAttributes , $listAttributesByGroup);
				$url_filter .= '&attr_group_'.$this->slug($goup_attr['name'],true).'=' . $this->request->get['attr_group_'.$this->slug($goup_attr['name'],true)];
			}
		}
		//get Option
		$listOptions = array();
		$options = $this->model_catalog_refine_search->getOptions();
		foreach($options as $option){
			if (isset($this->request->get['option_'.$this->slug($option['name'],true)])) {
				$arrayOptions =  $this->stringToArray($this->request->get['option_'.$this->slug($option['name'],true)]);
				$listOptions = array_merge($listOptions , $arrayOptions);
				$url_filter .= '&option_'.$this->slug($option['name'],true).'=' . $this->request->get['option_'.$this->slug($option['name'],true)];
			}
		}
		//$listOptions = array();
		//$groups_options = $this->model_catalog_product->getOptions();
		
		if (isset($this->request->get['op_colors'])) {
			$listColors = $this->stringToArray($this->request->get['op_colors']);
			//$brand_id = array_shift($arrBrand);
		} else {
			$listColors = '';
		}


		if (isset($this->request->get['size_Width'])) {
			$width = $this->request->get['size_Width'];
		} else {
			$width = '';
		}
		if (isset($this->request->get['size_Height'])) {
			$height = $this->request->get['size_Height'];
		} else {
			$height = '';
		}
		if (isset($this->request->get['size_Length'])) {
			$length = $this->request->get['size_Length'];
		} else {
			$length = '';
		}
		if (isset($this->request->get['minPrice'])) {
			$url_filter .= '&minPrice='.$this->request->get['minPrice'];
			$min = $this->request->get['minPrice'];
		} else {
			$min = $this->config->get('refine_search_min');
		}
		if (isset($this->request->get['maxPrice'])) {
			$url_filter .= '&maxPrice='.$this->request->get['maxPrice'];
			$max = $this->request->get['maxPrice'];
		} else {
			$max = $this->config->get('refine_search_max');
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	
							
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}
					

		//$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE query = 'category_id=" . $cateRoot . "'");
		//var_dump($query->row['keyword']);die;
		//$this->data['slug_category'] = $query->row['keyword'];
		
			$this->data['heading_title'] = 'Results filter';
			$this->data['thumb'] = '';
			$this->data['description'] = '';
			$this->data['text_clear'] = $this->language->get('text_clear');
			$this->data['text_collapse'] = $this->language->get('text_collapse');
			$this->data['text_expand'] = $this->language->get('text_expand');
			$this->data['text_refine'] = $this->language->get('text_refine');
			$this->data['text_empty'] = $this->language->get('text_empty');			
			$this->data['text_quantity'] = $this->language->get('text_quantity');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_points'] = $this->language->get('text_points');
			$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$this->data['text_display'] = $this->language->get('text_display');
			$this->data['text_list'] = $this->language->get('text_list');
			$this->data['text_grid'] = $this->language->get('text_grid');
			$this->data['text_sort'] = $this->language->get('text_sort');
			$this->data['text_limit'] = $this->language->get('text_limit');
					
			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			$this->data['button_compare'] = $this->language->get('button_compare');
			$this->data['button_continue'] = $this->language->get('button_continue');
					
			$this->data['compare'] = $this->url->link('product/compare');
			$url = '';
			$url .= $url_filter;
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			//echo 'filter_category_id = '.$category_id.'<br>';
			//echo 'filter_list_category_id = '; var_dump($listCategory).'<br>';
			if($category_id == 0){$filter_category = '';}else{$filter_category = $category_id;}
			$this->data['categories'] = array();
			$this->data['products'] = array();
			$data = array(
				'filter_product' 				=> $filterProduct, 
				'filter_category_id'			=> $filter_category, 
				'filter_list_category_id' 		=> $listCategory, 
				'filter_manufacturer_id' 	 	=> $listBrands, 
				'filter_list_attribute_id' 		=> $listAttributes, 
				'filter_list_option_id' 		=> $listOptions, 
				'filter_width'       			=> $width,
				'filter_height'      			=> $height,
				'filter_length'      			=> $length,
				'filter_min'      				=> $min,
				'filter_max'      				=> $max,
				'sort'               			=> $sort,
				'order'             			=> $order,
				'start'              			=> ($page - 1) * $limit,
				'limit'             			=> $limit
			);
			    
			$results = $this->model_catalog_refine_search->getProducts($data);
			
			$product_total = $this->model_catalog_refine_search->getTotalProducts($data); 
			// get valuue product
			    
			    
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
				} else {
					$image = false;
				}
				
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}	
				
				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}				
				
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
					
				$genders = $this->model_catalog_refine_search->getProductAttributes($result['product_id']);
				$val = '';
				if($genders){
					foreach ($genders as $gender) {
						if($gender['attribute_group_id'] == 8){
							$val = $gender['attribute'];
						}
					}
				}
				$this->data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $result['rating'],
					'gender'      => $val,
					'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'])
				);
			}
			// get value for url
			
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
							
			$this->data['sorts'] = array();
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			); 

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			); 
			
			if ($this->config->get('config_review_status')) {
				$this->data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				); 
				
				$this->data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);
			}
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);
			
			$url = '';
			$url .= $url_filter;
	
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->data['limits'] = array();
			$this->data['limits2'] = array();
			
			$this->data['limits'][] = array(
				'text'  => $this->config->get('config_catalog_limit'),
				'value' => $this->config->get('config_catalog_limit'),
				'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . $url . '&limit=' . $this->config->get('config_catalog_limit'))
			);
						
			$this->data['limits'][] = array(
				'text'  => 25,
				'value' => 25,
				'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . $url . '&limit=25')
			);
			
			$this->data['limits'][] = array(
				'text'  => 50,
				'value' => 50,
				'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . $url . '&limit=50')
			);

			$this->data['limits'][] = array(
				'text'  => 75,
				'value' => 75,
				'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . $url . '&limit=75')
			);
			
			$this->data['limits'][] = array(
				'text'  => 100,
				'value' => 100,
				'href'  => $this->url->link('product/results', 'path=' . $this->request->get['path'] . $url . '&limit=100')
			);
			$this->data['limits2'] = $this->data['limits'];	
			$this->data['sorts2'] = $this->data['sorts'];	
			
			$url = '';
			$url .= $url_filter;
	
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
	
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
					
			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = 'Results:  <b> {total} </b>';
			$pagination->url = $this->url->link('product/results', 'path=' . $this->request->get['path'] . $url . '&page={page}');
		
			$this->data['pagination'] = $pagination->render();
		
			$this->data['sort'] = $sort;
			$this->data['order'] = $order;
			$this->data['limit'] = $limit;
		
			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/category.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/category.tpl';
			} else {
				$this->template = 'default/template/product/category.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
				
			$this->response->setOutput($this->render());										

  	}
	public function stringToArray($string){
		//Remove accet first and end
		$result = array();
		if($string{0} =="["){
			$string = substr($string, 1, -1);
		}
		 $result = explode("|", $string);
		 //var_dump($result);die;
		 return $result;
	}
	
	public function slug($text, $lowercase = true) { 
	  // replace non letter or digits by -
	  $text = preg_replace("/&#?[a-z0-9]+;/i","",$text);
	  $text = preg_replace('~[^\\pL\d]+~u', '', $text);
	  // trim
	  $text = trim($text, '');
	
	  // transliterate
	  $text = iconv('utf-8', 'utf-8//TRANSLIT', $text);
	
	  // lowercase
	  if($lowercase){
		  $text = strtolower($text);
	  }
	  // remove unwanted characters
	  $text = preg_replace('~[^-\w]+~', '', $text);
	
	  if (empty($text))
	  {
		return 'n-a';
	  }
	
	  return $text;
	}
	

}
?>