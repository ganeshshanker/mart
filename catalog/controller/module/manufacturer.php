<?php  
class ControllerModuleManufacturer extends Controller {
	protected function index($setting) {
		$this->language->load('module/manufacturer');
		
	    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$this->data['manufacturer_id'] = $parts[0];
		} else {
			$this->data['manufacturer_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}
							
		$this->load->model('catalog/manufacturer');
		$this->load->model('catalog/product');

		$this->data['manufacturers'] = array();
					
		//$whatvar = explode('_', $_GET['path']);
		$manufacturerexists = false;

		$geturl = '';
		
		foreach($_GET as $key => $value)
		{
			if(!($key == "_route_" || $key == "manufacturer_id")){
				$geturl .= '&' . $key . '=' . $value;
			}
		}

	//	echo $geturl; 

		if(isset($parts[0])){
			$manufacturers = $this->model_catalog_manufacturer->getCatManufacturers($parts[0]);
			foreach($manufacturers as $manufacturer)
			{
				$manufacturerexists = true;
				$this->data['manufacturers'][] = array(
					'manufacturer_id' => $manufacturer['manufacturer_id'],
					'name'        => $manufacturer['name'] ,
					'href'        => $this->url->link('product/category', 'path=' . $parts[0] . '&manufacturer_id=' . $manufacturer['manufacturer_id'] . $geturl)
				);
			}
		} else {
			$manufacturers = $this->model_catalog_manufacturer->getCatManufacturers(0);
			foreach($manufacturers as $manufacturer)
			{
				$manufacturerexists = true;
				$this->data['manufacturers'][] = array(
					'manufacturer_id' => $manufacturer['manufacturer_id'],
					'name'        => $manufacturer['name'] ,
					'href'        => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id'] . $geturl)
				);
			}
		}

		if(!$manufacturerexists){
			$this->data['manufacturers'][] = array(
				'manufacturer_id' => 0,
				'name'        => 'No Brand' ,
				'href'        => $this->url->link('javascript:void(0)')
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/manufacturer.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/manufacturer.tpl';
		} else {
			$this->template = 'default/template/module/manufacturer.tpl';
		}
		
		$this->render();
  	}
}
?>