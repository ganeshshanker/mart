<?php  
//-----------------------------------------------------
// Filter Products Module for Opencart v1.5.X				
// Modified by Huu Ha                          		
// huuhath@gmail.com
// Website: http://tutviet.net 
// Version: 2.5 
// Controller Catalog                      		
//-----------------------------------------------------

class ControllerModuleRefineSearch extends Controller {
	protected function index($setting) {
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = $this->config->get('config_ssl');
		} else {
			$this->data['base'] = $this->config->get('config_url');
		}
		$this->document->addStyle('catalog/view/theme/default/stylesheet/refine_styles.css');

		// Load javaScript 
		
		$this->document->addScript('catalog/view/javascript/refine_search.js'); 
		$this->data['options'] = $setting['options'];
		/* Language */
		
		$this->language->load('module/refine_search');		
		if (substr(VERSION, 0, 5) >= '1.5.5') {
			$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');
		}
		$this->data['versionOC'] = substr(VERSION, 0, 5);
		/* Categories Dropdown */
		$this->load->model('catalog/refine_search');
		$this->load->model('tool/image');

		$this->data['text_cat'] = $this->language->get('text_cat');
		$this->data['text_price'] = $this->language->get('text_price');
		$this->data['text_brand'] = $this->language->get('text_brand');
		$this->data['text_clear'] = $this->language->get('text_clear');
		// Get values request ------------------------------------------------------->
		// get title
		$language = $this->config->get('config_language_id');
		$this->data['refine_search_title'] = $this->config->get('refine_search_title' . $language);

		if(isset($this->request->get['filterProduct'])){
			$filterProduct = $this->request->get['filterProduct'];
  			//$this->data['sidebar'] = false;
		}else{
			$filterProduct = '';
		}
		$filterGroups = '';
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		$only_sub_cate = $this->config->get('only_sub_cate');
		
		if ($only_sub_cate && isset($parts[1])) {
			$rootCategory = $parts[0];
		} else {
			$rootCategory = 0;
		}
		//echo $rootCategory;die;
		
		    
		if (isset($this->request->get['category'])) {
			$listCategory = $this->stringToArray($this->request->get['category']);
			// Shift an element off the beginning of array
			$category_id = array_shift($listCategory);
			$filterGroups .= 'category|';
		}else {			
			$category_id = 0;
			$listCategory = '';
		}
		
		if (isset($this->request->get['brand'])) {
			$listBrands = $this->stringToArray($this->request->get['brand']);
			$filterGroups .= 'brand|';
		} else {
			$listBrands = '';
		}

		//get attribute group
		$attr_status = $this->config->get('attr_status');
		$this->data['attr_status'] = $attr_status;

		$listAttributes = array();
		if ($attr_status && $this->config->get('refine_search_attr')){
			foreach ($this->config->get('refine_search_attr') as $group_id) {
					$groups = $this->model_catalog_refine_search->getAttributeGroupDescriptions($group_id);
					$groups_attr[] = array(
							'attribute_group_id' =>$group_id,
							'name' => $groups[$language]['name']
						);
				}
			foreach($groups_attr as $goup_attr){
				if (isset($this->request->get['attr_group_'.$this->slug($goup_attr['name'],true)])) {
					$filterGroups .= 'attr_group_'.$this->slug($goup_attr['name'],true).'|';
					$listAttributesByGroup =  $this->stringToArray($this->request->get['attr_group_'.$this->slug($goup_attr['name'],true)]);
					$listAttributes = array_merge($listAttributes , $listAttributesByGroup);
				}
			}
		} 
		
		$listOptions = array();
		if ($this->config->get('refine_search_option')){
			foreach ($this->config->get('refine_search_option') as $option_id) {
					$result_option = $this->model_catalog_refine_search->getOption($option_id);
					$options[] = array(
							'id' =>$result_option['option_id'],
							'name' => $result_option['name']
						);
				}
		} else {
			$options = $this->model_catalog_refine_search->getOptions(array('type' =>'select'));
		}
		foreach($options as $option){
			if (isset($this->request->get['option_'.$this->slug($option['name'],true)])) {
				$filterGroups .= 'option_'.$this->slug($option['name'],true).'|';
				$listOption =  $this->stringToArray($this->request->get['option_'.$this->slug($option['name'],true)]);
				$listOptions = array_merge($listOptions , $listOption);
			}
		}

		//$groups_options = $this->model_catalog_product->getOptions();
		
		if (isset($this->request->get['op_colors'])) {
			$listColors = $this->stringToArray($this->request->get['op_colors']);
			$filterGroups .= 'op_colors|';
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
			$min = filter_var($this->request->get['minPrice'], FILTER_SANITIZE_NUMBER_INT) ;
		} else {
			$min = filter_var( $this->config->get('refine_search_min'), FILTER_SANITIZE_NUMBER_INT) ;
		}
		if (isset($this->request->get['maxPrice'])) {
			$max = filter_var($this->request->get['maxPrice'], FILTER_SANITIZE_NUMBER_INT) ;
		} else {
			$max = filter_var( $this->config->get('refine_search_max'), FILTER_SANITIZE_NUMBER_INT) ;
		}
		$this->data['step'] = filter_var( $this->config->get('refine_search_step'), FILTER_SANITIZE_NUMBER_INT) ;
		$currencyCode = $this->currency->getCode();
		
		$this->load->model('localisation/currency');
		 
		$currencyInfo = $this->model_localisation_currency->getCurrencyByCode($currencyCode);	
		$this->data['symbol_left'] = $currencyInfo['symbol_left'];
		$this->data['symbol_right'] = $currencyInfo['symbol_right'];
		  

		if($category_id == 0){$filter_category = '';}else{$filter_category = $category_id;}
		$dataFilter = array(
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
		);
		 
		$products = $this->model_catalog_refine_search->getProducts($dataFilter);
		$data = array();
		
		// Display
		$this->data['selectCategory'] = '';
		$cat_status = $this->config->get('cat_status');
		$hide_cate_empty = $this->config->get('hide_cate_empty');
		$this->data['cat_expand'] = $this->config->get('cat_expand');
		$this->data['cat_status'] = $cat_status;
			if(!empty($filterProduct)){
				$this->data['category_id'] = $this->request->get['path'];
				if(!empty($this->request->get['category'])){
					$this->data['selectCategory'] = $this->stringToArray($this->request->get['category']);
				}
			}else{
				$this->data['category_id'] = $category_id;
			}
			$this->data['categories'] = array();
						
			$categories = $this->model_catalog_refine_search->getCategories($rootCategory);

			foreach ($categories as $category) {
			$children_data = array();
			
			$children = $this->model_catalog_refine_search->getCategories($category['category_id']);
			
			foreach ($children as $child) {
				$child_data = array();
					$children2 = $this->model_catalog_refine_search->getCategories($child['category_id']);
					foreach ($children2 as $child2) {
						$data = array(
							'filter_category_id'  => $child2['category_id'],
							'filter_list_category_id' 		=> '', 
							'filter_sub_category' 		=> '', 
						);	
						$data = array_merge($dataFilter,$data);	
						$product_total = $this->model_catalog_refine_search->getTotalProducts($data);
						if($hide_cate_empty){
							if($product_total>0){
								$child_data[] = array(
									'category_id' => $child2['category_id'],
									'count' 	  => $product_total,
									'checked' 	  => $this->checkedSelect($child2['category_id'],$this->data['selectCategory'] ),
									'name'        => $child2['name']
								);
							}
						}else{
							$child_data[] = array(
								'category_id' => $child2['category_id'],
								'count' 	  => $product_total,
								'checked' 	  => $this->checkedSelect($child2['category_id'],$this->data['selectCategory'] ),
								'name'        => $child2['name']
							);
						}			
					}
				$data = array(
					'filter_category_id'  => $child['category_id'],
					'filter_list_category_id' 		=> '', 
					'filter_sub_category' 		=> '', 
				);		
					$data = array_merge($dataFilter,$data);	
					$product_total = $this->model_catalog_refine_search->getTotalProducts($data);
					if($hide_cate_empty){
						if($product_total>0){
							$children_data[] = array(
								'category_id' => $child['category_id'],
								'count' 	  => $product_total,
								'checked' 	  => $this->checkedSelect($child['category_id'],$this->data['selectCategory'] ),
								'name'        => $child['name'],
								'child'		  => $child_data
							);	
						}elseif (!empty($child_data)) {
							$children_data[] = array(
								'category_id' => $child['category_id'],
								'count' 	  => $product_total,
								'checked' 	  => $this->checkedSelect($child['category_id'],$this->data['selectCategory'] ),
								'name'        => $child['name'],
								'child'		  => $child_data
							);	
					}	
					}else{
						$children_data[] = array(
							'category_id' => $child['category_id'],
							'count' 	  => $product_total,
							'checked' 	  => $this->checkedSelect($child['category_id'],$this->data['selectCategory'] ),
							'name'        => $child['name'],
							'child'		  => $child_data
						);
					}					
			}
			
			$data = array(
					'filter_category_id'  => $category['category_id'],
					'filter_list_category_id' 		=> '', 
					'filter_sub_category' 		=> false, 
				);		
			$data = array_merge($dataFilter,$data);	
				$product_total = $this->model_catalog_refine_search->getTotalProducts($data);
				if($hide_cate_empty){
					if($product_total>0){
						$this->data['categories'][] = array(
							'category_id' => $category['category_id'],
							'count' 	  => $product_total,
							'checked' 	  => $this->checkedSelect($category['category_id'],$this->data['selectCategory'] ),
							'name'        => $category['name'],
							'children'    => $children_data
						);
					}elseif (!empty($children_data)) {
						$this->data['categories'][] = array(
							'category_id' => $category['category_id'],
							'count' 	  => $product_total,
							'checked' 	  => $this->checkedSelect($category['category_id'],$this->data['selectCategory'] ),
							'name'        => $category['name'],
							'children'    => $children_data
						);
					}	
				}else{
					$this->data['categories'][] = array(
							'category_id' => $category['category_id'],
							'count' 	  => $product_total,
							'checked' 	  => $this->checkedSelect($category['category_id'],$this->data['selectCategory'] ),
							'name'        => $category['name'],
							'children'    => $children_data
						);
				}		
		}
	    
		$brand_status = $this->config->get('brand_status');
		$this->data['brand_status'] = $brand_status;
		$this->data['brand_expand'] =  $this->config->get('brand_expand');
		if($brand_status){
			$this->data['brands'] = array();
			
			$this->load->model('catalog/manufacturer');
			$brands = $this->model_catalog_manufacturer->getManufacturers();
			foreach($brands as $brand){
					$data = array(
						'filter_manufacturer_id' 		=> $brand['manufacturer_id']	
					);
					$data = array_merge($dataFilter,$data);		
					$total_menufacture = $this->model_catalog_refine_search->getTotalProducts($data);
						$this->data['brands'][] = array(
							'id' => $brand['manufacturer_id'],
							'slug' => $this->slug($brand['name'],false),
							'total' => $total_menufacture,
							'checked' 	  => $this->checkedSelect($brand['manufacturer_id'],$listBrands ),
							'name' => $brand['name']
						);
			}
		}
		
		//get attribute group
		$hide_attr_empty = $this->config->get('hide_attr_empty');
		$this->data['groups_attribute'] = array();
		$this->data['attr_status'] = $attr_status;
		$this->data['attr_expand'] =  $this->config->get('attr_expand');
		if($attr_status && isset($groups_attr)){
			foreach($groups_attr as $goup_attribute){			
				$results = $this->model_catalog_refine_search->getAttributesByAttributeGroupId(array('filter_attribute_group_id'=>$goup_attribute['attribute_group_id']));
				$data_attribute = array();
				foreach ($results as $result) {
					$data = array(
						'filter_list_attribute_id' => $result['attribute_id']	
					);
					$data = array_merge($dataFilter,$data);		
					$count_attr = $this->model_catalog_refine_search->getTotalProducts($data);
					if($hide_attr_empty){
						if($count_attr>0){
							$data_attribute[] = array(
								'id'    		=> $result['attribute_id'], 
								'name'          => $result['name'],
								'checked' 	  	=> $this->checkedSelect($result['attribute_id'],$listAttributes ),
								'slug'          => $this->slug($result['name'],false),
								'count'         => $count_attr,
							);
						}	
					}else{
						$data_attribute[] = array(
							'id'    		=> $result['attribute_id'], 
							'name'          => $result['name'],
							'checked' 	  	=> $this->checkedSelect($result['attribute_id'],$listAttributes ),
							'slug'          => $this->slug($result['name'],false),
							'count'         => $count_attr,
						);
					}	
				}
				if(!empty($data_attribute))	{
					$this->data['groups_attribute'][]= array(
							'id'     	=> $goup_attribute['attribute_group_id'],
							'group'     => $goup_attribute['name'],
							'slug'      => $this->slug($goup_attribute['name'],true),
							'attribute' => $data_attribute,
					);
				}
			}
		}
		//get option
		$hide_op_empty = $this->config->get('hide_op_empty');
		$op_status = $this->config->get('op_status');
		$this->data['op_status'] = $op_status;
		$this->data['op_display'] = $this->config->get('op_display');
		$this->data['op_expand'] =  $this->config->get('op_expand');
		//echo $this->data['op_display'];
		if($op_status){
			$this->data['getoptions'] = array();
			foreach($options as $option){			
				$results = $this->model_catalog_refine_search->getOptionValues($option['id']);
				$data_op = array();
				foreach ($results as $result) {
					$data = array(
						'filter_list_option_id' => $result['option_value_id']	
					);
					$data = array_merge($dataFilter,$data);		
					$count_op = $this->model_catalog_refine_search->getTotalProducts($data);
					if($hide_op_empty){
						if($count_op>0){
							$data_op[] = array(
								'id'    		=> $result['option_value_id'], 
								'name'          => $result['name'],
								'image'          => $this->model_tool_image->resize($result['image'], 20, 12),
								'checked' 	  	=> $this->checkedSelect($result['option_value_id'],$listOptions ),
								'slug'          => $this->slug($result['name'],true),
								'count'         => $count_op,
							);	
						}
					}else{
						$data_op[] = array(
							'id'    		=> $result['option_value_id'], 
							'name'          => $result['name'],
							'image'          => $this->model_tool_image->resize($result['image'], 20, 12),
							'checked' 	  	=> $this->checkedSelect($result['option_value_id'],$listOptions ),
							'slug'          => $this->slug($result['name'],true),
							'count'         => $count_op,
						);	
					}	
				}
				if(!empty($data_op)){	
					$this->data['getoptions'][]= array(
						'id'     	=> $option['id'],
						'name'     => $option['name'],
						'slug'      => $this->slug($option['name'],true),
						'option' => $data_op,
					);
				}
			}
		}
		//Get Dimensions
		$size_status = '';//$this->config->get('size_status');
		$this->data['size_status'] = $size_status;
		if($size_status){
			foreach($products as $product){
				$arrLength[] 	= round($product['length'],0);//.'_'.$product['length_class'];//array('value' =>round($dimension['length'],0),'checked' => $checkLength);
				$arrWidth[] 	= round($product['width'],0);//.'_'.$product['length_class'];//array('value' =>round($dimension['width'],0),'checked' => $checkWidth);
				$arrHeight[] 	= round($product['height'],0);//.'_'.$product['length_class'];//array('value' =>round($dimension['height'],0),'checked' => $checkHeight);
				
			}
			if(!empty($arrLength)){
				$this->data['lengths'] 		= array_unique($arrLength);
			}else{
				$this->data['lengths'] 		= '';
			}
			if(!empty($arrWidth)){
				$this->data['widths'] 		= array_unique($arrWidth);
			}else{
				$this->data['widths'] 		= '';
			}
			if(!empty($arrHeight)){
				$this->data['heights'] 		= array_unique($arrHeight);
			}else{
				$this->data['heights'] 		= '';
			}
			$this->data['selectLength']	= $length;
			$this->data['selectWidth']	= $width;
			$this->data['selectHeight']	= $height;
			
		}
		$price_status = $this->config->get('price_status');
		$this->data['price_status'] = $price_status;
		if($price_status){
			
			$this->data['min'] = $min;
			$this->data['max'] = $max;
			$this->data['set_min'] = filter_var( $this->config->get('refine_search_min'), FILTER_SANITIZE_NUMBER_INT) ;
			
			$this->data['set_max'] = filter_var( $this->config->get('refine_search_max'), FILTER_SANITIZE_NUMBER_INT) ;
		}
		$this->data['filtergroups'] = $filterGroups;
		$this->data['optionList'] = $filterGroups;
		$this->data['colors'] = array();
		//if(!empty($this->data['options'])){
//			foreach($this->data['options'] as $options ){
//				if(!empty($options) && $options['option_id'] ==19 && !empty($options['option_value'])){
//					foreach ($options['option_value'] as $values){
//					$this->data['colors'][] = $values;
//					}
//				}
//			}
//		}
		//echo '<pre>';print_r($this->data['colors']);die;	

		/* Load Template */
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/refine_search.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/refine_search.tpl';
		} else {
			$this->template = 'default/template/module/refine_search.tpl';
		}

		$this->render();
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
	
	public function checkedSelect($value, $arrCheck) {
		if(is_array($arrCheck)){
			if (in_array($value, $arrCheck)) {
				$checked = 'checked';
			}else{
				$checked = '';	
			}
		}else{
			$checked = '';	
		}
	return $checked;
	}

}
?>