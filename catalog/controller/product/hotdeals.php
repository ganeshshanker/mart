<?php 
class ControllerProductHotdeals extends Controller {  
  public function index() { 
    $this->language->load('product/category');
    $this->load->model('catalog/category');
    $this->load->model('catalog/product');
    $this->load->model('tool/image'); 
    $this->data['breadcrumbs'] = array();
    $this->data['breadcrumbs'][] = array(
        'text'      => $this->language->get('text_home'),
        'href'      => $this->url->link('common/home'),
        'separator' => false
    ); 
   
    $hotdeals = $this->model_catalog_category->getCategories(0);
        
    foreach ($hotdeals as $category){
      $products_data = array();
   
      $data = array(
         'filter_category_id' => $category['category_id'], 
         'start'              => 0,
         'limit'              => 3
       );
    
       $product_total = $this->model_catalog_product->getTotalProducts($data); 
       $results = $this->model_catalog_product->getProducts($data);
   
       foreach ($results as $result) {
         if ($result['image']) {
           $image = $this->model_tool_image->resize(
                       $result['image'], 
                       $this->config->get('config_image_product_width'), 
                       $this->config->get('config_image_product_height'));
          } else {
            $image = false;
          }
    
          if (($this->config->get('config_customer_price') && 
               $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
             $price = $this->currency->format(
                              $this->tax->calculate($result['price'], 
                              $result['tax_class_id'], $this->config->get('config_tax')));
          } else {
             $price = false;
          }
    
          if ((float)$result['special']) {
            $special = $this->currency->format(
                            $this->tax->calculate($result['special'], 
                            $result['tax_class_id'], 
                            $this->config->get('config_tax')));
           } else{
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
        
            $products_data[] = array(
                     'product_id'  => $result['product_id'],
                     'thumb'       => $image,
                     'name'        => $result['name'],
                     'href'        => $this->url->link(
                                        'product/product', 
                                        'path=' . $category['category_id'] . '&product_id=' . $result['product_id'])
            );
       }
            
       $this->data['hotdeals'][] = array(
                         'category_id' => $category['category_id'],
                         'name'        => $category['name'] . ' (' . $product_total . ')',
                         'products'    => $products_data,
                         'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
       );            
    }

     if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/hotdeals.tpl')) {
       $this->template = $this->config->get('config_template') . '/template/product/hotdeals.tpl';
     } else {
       $this->template = 'default/template/product/hotdeals.tpl';
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
}
?>