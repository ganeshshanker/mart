<?php  
class ControllerModulemcatmod extends Controller {
	protected function index($setting) {
	static $module = 0;
	
		$this->language->load('module/category');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->load->model('catalog/category');
		
		$this->load->model('tool/image');
		
		$this->document->addStyle('catalog/view/theme/default/mcatmod/mcatmod.css');
		
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['category_id'] = $parts[0];
		} else {
			$this->data['category_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}
		if (isset($parts[2])) {
			$this->data['gchild_id'] = $parts[2];
		} else {
			$this->data['gchild_id'] = 0;
		}
		
		$this->data['categories'] = array();
		
		
		$results = $this->model_catalog_category->getCategories();
	
		foreach ($results as $result) {
			$children_data = array();
			
			$children = $this->model_catalog_category->getCategories($result['category_id']);
			
			foreach ($children as $child) {
			$gchildren_data = array();
			
			$gchildren = $this->model_catalog_category->getCategories($child['category_id']);
			foreach ($gchildren as $gchild) {
			$gchildren_data[] = array(
						'category_id' => $gchild['category_id'],
						'name'        => $gchild['name'],
						'href'        => $this->url->link('product/category', 'path=' . $result['category_id'] . '_' . $child['category_id'] . '_' . $gchild['category_id'])	
					);	
			}		
					$children_data[] = array(
						'category_id' => $child['category_id'],
						'name'        => $child['name'],
						'gchildren'   => $gchildren_data,
						'href'        => $this->url->link('product/category', 'path=' . $result['category_id'] . '_' . $child['category_id'])	
					);						
			}
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], 80, 80);
			} else {
				$image = false;
			}
			
			$this->data['categories'][] = array(
				'name' => $result['name'],
				'category_id' => $result['category_id'],
				'children'    => $children_data,
				'description' => utf8_substr(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'), 0, 600),
				'image' => $image,
				'href' => $this->url->link('product/category', 'path=' . $result['category_id'])
			);
		}
		$this->data['module'] = $module++; 
		
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/mcatmod.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/mcatmod.tpl';
			} else {
				$this->template = 'default/template/module/mcatmod.tpl';
			}
		
		$this->render();
  	}	
}
?>