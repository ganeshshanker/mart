<div id="lnav-container" class="span-4 last">
    <?php if($price_status){ ?>
<script type="text/javascript">
   
    function format(value){

        var suymbol_left = "<?php echo $symbol_left ?>";

        if(suymbol_left){
            var returns = value+suymbol_left;
            

        }else{
            var returns = value+"<?php echo $symbol_right ?>";
        }
      return returns;

    }
    function initializeSlider(selectedMin, selectedMax, slideMin, slideMax) {
       // alert(selectedMin+'--'+selectedMax+'--'+lowBound+'--'+highBound);
        jQuery("#slider-range").slider({
            animate: true,
            range: true,
            min: slideMin,
            max: slideMax,
            step: <?php echo $step ?>,
            values: [selectedMin, selectedMax],
            slide: function(event, ui) {
                if (ui) {
                     jQuery("#amount").html(format(ui.values[0]) + ' - ' + format(ui.values[1]) );
                    jQuery("#priceMin").val(ui.values[0]);
                    jQuery("#priceMax").val(ui.values[1]);
                }
            },
            stop: function(event, ui) {
                filterChanged('price');
            }
        });

        jQuery("#amount").html(format(jQuery("#slider-range").slider("values", 0) )  + ' - ' + format(jQuery("#slider-range").slider("values", 1)));

        jQuery("#priceMin").val(selectedMin);
        jQuery("#priceMax").val(selectedMax);

        jQuery("table.color-tbl td input:checkbox").each(
            function() {
                (this.checked) ? jQuery("table.color-tbl td rel[this.id]").addClass('fakechecked') : jQuery("table.color-tbl td rel[this.id]").removeClass('fakechecked');
            }
        );
    }

    jQuery(document).ready(
        function() {
            jQuery("#slider-range").slider('destroy');
                initializeSlider(<?php echo $min ?>, <?php echo $max ?>, <?php echo $set_min ?>, <?php echo $set_max ?>);
            }
    );
</script>
<?php } ?>
    <form id="refinedSearchForm" name="refinedSearchForm" action="">
        <input id="attributeGroups"  name="attributeGroups" value="<?php echo $filtergroups ; ?>" type="hidden"  />
        <input id="category_root"  name="category_root" value="<?php echo $category_id ?>" type="hidden"  />
        <div id="lnav-content-container" class="span-4">
            <div id="lnav-inner-container">
                <h2>
                <?php echo $refine_search_title;?>
                    
                </h2>
                <div class="lnav-horizontal-divider"></div>
                
                <?php if($cat_status): ?>
                <div class="lnav-category-container" id="lnav-categories-container" rel="<?php if($cat_expand){echo 'show';} ?>">
                    <div class="lnav-banner">
                        <h3 style="display: block;"><?php echo $text_cat; ?></h3>
                        <div class="expand-collapse-container lnav-collapse"></div>
                        <div class="expand-collapse-container lnav-expand"></div>
                    </div><!--lnav-banner-->
                    <div class="lnav-link-container">
                        <ul class="root">
                            <?php foreach ($categories as $category) {?>
                              <li>
                                <?php if($category['count'] == 0){ ?>
                                    <input id="<?php echo $category['category_id']; ?>" name="category" disabled="true"value="<?php echo $category['category_id']; ?>" type="checkbox" onclick="filterChanged('category');" displayname="<?php echo $category['name']; ?>">
                                    <span class="disabled-refined" > <?php echo $category['name']; ?></span>
                                    <span class="disabled-refined"> (0)</span>
                                    <?php if ($category['children']) { ?>
                                      <ul class="childen">
                                        <?php foreach ($category['children'] as $child) { ?>
                                        <li>
                                          <?php if($child['count'] == 0){ ?>
                                            <input id="<?php echo $child['category_id']; ?>" name="category" disabled="true"value="<?php echo $child['category_id']; ?>" type="checkbox" onclick="filterChanged('category');" displayname="<?php echo $child['name']; ?>">
                                            <span class="disabled-refined" > <?php echo $child['name']; ?></span>
                                            <span class="disabled-refined"> (0)</span>
                                            <?php if ($child['child']) { ?>
                                                  <ul class="childen">
                                                    <?php foreach ($child['child'] as $child2) { ?>
                                                    <li>
                                                      <?php if($child2['count'] == 0){ ?>
                                                        <input id="<?php echo $child2['category_id']; ?>" name="category" disabled="true"value="<?php echo $child2['category_id']; ?>" type="checkbox" onclick="filterChanged('category');" displayname="<?php echo $child2['name']; ?>">
                                                        <span class="disabled-refined" > <?php echo $child2['name']; ?></span>
                                                        <span class="disabled-refined"> (0)</span>

                                                   <?php }else{ ?>
                                                        <input id="<?php echo $child2['category_id']; ?>" name="category" value="<?php echo $child2['category_id']; ?>" type="checkbox"   <?php echo $child2['checked']; ?>  onclick="filterChanged('category');" displayname="<?php echo $child2['name']; ?>">
                                                        <span > <?php echo $child2['name']; ?></span>
                                                        <span > (<?php echo $child2['count']; ?>)</span>
                                                        <?php } ?>
                                                    </li>
                                                    <?php } ?>
                                                  </ul>
                                                  <?php } ?>
                                       <?php }else{ ?>
                                            <input id="<?php echo $child['category_id']; ?>" name="category" value="<?php echo $child['category_id']; ?>" type="checkbox"   <?php echo $child['checked']; ?>  onclick="filterChanged('category');" displayname="<?php echo $child['name']; ?>">
                                            <span > <?php echo $child['name']; ?></span>
                                            <span > (<?php echo $child['count']; ?>)</span>
                                            <?php if ($child['child']) { ?>
                                                  <ul class="childen">
                                                    <?php foreach ($child['child'] as $child2) { ?>
                                                    <li>
                                                      <?php if($child2['count'] == 0){ ?>
                                                        <input id="<?php echo $child2['category_id']; ?>" name="category" disabled="true"value="<?php echo $child2['category_id']; ?>" type="checkbox" onclick="filterChanged('category');" displayname="<?php echo $child2['name']; ?>">
                                                        <span class="disabled-refined" > <?php echo $child2['name']; ?></span>
                                                        <span class="disabled-refined"> (0)</span>

                                                   <?php }else{ ?>
                                                        <input id="<?php echo $child2['category_id']; ?>" name="category" value="<?php echo $child2['category_id']; ?>" type="checkbox"   <?php echo $child2['checked']; ?>  onclick="filterChanged('category');" displayname="<?php echo $child2['name']; ?>">
                                                        <span > <?php echo $child2['name']; ?></span>
                                                        <span > (<?php echo $child2['count']; ?>)</span>
                                                        <?php } ?>
                                                    </li>
                                                    <?php } ?>
                                                  </ul><!-- End level 3-->
                                                  <?php } ?>
                                            <?php } ?>
                                        </li>
                                        <?php } ?>
                                      </ul><!-- End level 2-->
                                    <?php } ?>
                               <?php }else{ ?>
                                    <input id="<?php echo $category['category_id']; ?>" name="category" value="<?php echo $category['category_id']; ?>" type="checkbox"   <?php echo $category['checked']; ?>  onclick="filterChanged('category');" displayname="<?php echo $category['name']; ?>">
                                    <span > <?php echo $category['name']; ?></span>
                                    <span > (<?php echo $category['count']; ?>)</span>
                                    <?php if ($category['children']) { ?>
                                      <ul class="childen">
                                        <?php foreach ($category['children'] as $child) { ?>
                                        <li>
                                          <?php if($child['count'] == 0){ ?>
                                            <input id="<?php echo $child['category_id']; ?>" name="category" disabled="true"value="<?php echo $child['category_id']; ?>" type="checkbox" onclick="filterChanged('category');" displayname="<?php echo $child['name']; ?>">
                                            <span class="disabled-refined" > <?php echo $child['name']; ?></span>
                                            <span class="disabled-refined"> (0)</span>
                                            <?php if ($child['child']) { ?>
                                                  <ul calss="childen">
                                                    <?php foreach ($child['child'] as $child2) { ?>
                                                    <li>
                                                      <?php if($child2['count'] == 0){ ?>
                                                        <input id="<?php echo $child2['category_id']; ?>" name="category" disabled="true"value="<?php echo $child2['category_id']; ?>" type="checkbox" onclick="filterChanged('category');" displayname="<?php echo $child2['name']; ?>">
                                                        <span class="disabled-refined" > <?php echo $child2['name']; ?></span>
                                                        <span class="disabled-refined"> (0)</span>

                                                   <?php }else{ ?>
                                                        <input id="<?php echo $child2['category_id']; ?>" name="category" value="<?php echo $child2['category_id']; ?>" type="checkbox"   <?php echo $child2['checked']; ?>  onclick="filterChanged('category');" displayname="<?php echo $child2['name']; ?>">
                                                        <span > <?php echo $child2['name']; ?></span>
                                                        <span > (<?php echo $child2['count']; ?>)</span>
                                                        <?php } ?>
                                                    </li>
                                                    <?php } ?>
                                                  </ul>
                                                  <?php } ?>
                                       <?php }else{ ?>
                                            <input id="<?php echo $child['category_id']; ?>" name="category" value="<?php echo $child['category_id']; ?>" type="checkbox"   <?php echo $child['checked']; ?>  onclick="filterChanged('category');" displayname="<?php echo $child['name']; ?>">
                                            <span > <?php echo $child['name']; ?></span>
                                            <span > (<?php echo $child['count']; ?>)</span>
                                            <?php if ($child['child']) { ?>
                                                  <ul class="childen">
                                                    <?php foreach ($child['child'] as $child2) { ?>
                                                    <li>
                                                      <?php if($child2['count'] == 0){ ?>
                                                        <input id="<?php echo $child2['category_id']; ?>" name="category" disabled="true"value="<?php echo $child2['category_id']; ?>" type="checkbox" onclick="filterChanged('category');" displayname="<?php echo $child2['name']; ?>">
                                                        <span class="disabled-refined" > <?php echo $child2['name']; ?></span>
                                                        <span class="disabled-refined"> (0)</span>

                                                   <?php }else{ ?>
                                                        <input id="<?php echo $child2['category_id']; ?>" name="category" value="<?php echo $child2['category_id']; ?>" type="checkbox"   <?php echo $child2['checked']; ?>  onclick="filterChanged('category');" displayname="<?php echo $child2['name']; ?>">
                                                        <span > <?php echo $child2['name']; ?></span>
                                                        <span > (<?php echo $child2['count']; ?>)</span>
                                                        <?php } ?>
                                                    </li><!-- End level 3-->
                                                    <?php } ?>
                                                  </ul>
                                                  <?php } ?>
                                            <?php } ?>
                                        </li><!-- End level 2-->
                                        <?php } ?>
                                      </ul>
                                    <?php } ?>
                               <?php } ?>
                              </li><!-- End level 1-->
                            <?php } ?>
    
                      </ul>
                        <div id="lnav-bottom-link-container">
                            <a href="javascript:;" class="plain" onclick="javascript: onClearClick('category');" ><?php echo $text_clear ; ?></a>
                        </div>
                    </div><!--lnav-link-container-->
                </div><!--End Category-->
                <div class="lnav-horizontal-divider"></div>
                <?php endif; ?>
                
                <?php if($brand_status): ?>
                <div class="lnav-category-container" id="lnav-top-brands-container" rel="<?php if($brand_expand){echo 'show';} ?>">
                    <div class="lnav-banner">
                        <h3><?php echo $text_brand; ?></h3>
                        <div class="expand-collapse-container lnav-collapse" ></div>
                        <div class="expand-collapse-container lnav-expand"></div>
                    </div><!--lnav-banner-->
                    <div class="lnav-link-container">
                        <div id="lnav-brand-container">
                          <div id="lnav-alphabet-container">
                            <?php 
                                foreach(range('a','z') as $i) {
                                $aphabet = strtoupper($i);
                            ?>
                            <div id="<?php echo $aphabet ?>"class="lnav-letter-available" ><?php echo $aphabet ?></div>
                            <?php } ?>
                            
                            <div id="0-9" class="lnav-letter-available">0-9</div>
                          </div>
                            <div id="lnav-brand-name-container">
                                <ul>
                                <?php foreach ($brands as $brand ){ ?>
                                    <?php if($brand['total'] > 0){ ?>
                                    <li name="<?php echo $brand['name'] ?>">
                                        <input id="<?php echo $brand['slug'] ?>" name="brand"  <?php echo $brand['checked']; ?> value="<?php echo $brand['id'] ?>" type="checkbox" onclick="filterChanged('brand');" displayname="<?php echo $brand['name'] ?>">
                                        <span><?php echo $brand['name'] ?></span>
                                        <span class="facet-count">(<?php echo $brand['total'] ?>)</span>
                                    </li>
                                    <?php } ?>
                                    <div class="clear"></div>
                                <?php } ?>
                              </ul>
                            </div>
    
                            <div id="lnav-bottom-link-container">
                                    <a href="javascript:;" class="plain" onclick="javascript: onBrandCheckboxesCleanClick('brand');">
                            <?php echo $text_clear ; ?></a>
                            </div>
                        </div>
                    </div><!--lnav-link-container-->
                </div><!--End Brand-->
                <div class="lnav-horizontal-divider"></div>
                <?php endif; ?>

                <?php if($attr_status): ?>
                    <?php foreach($groups_attribute as $group_attribute){?>  
                    
                    <div class="lnav-category-container" id="lnav-<?php echo $group_attribute['slug']; ?>-container" rel="<?php if($attr_expand){echo 'show';} ?>">
                        <div class="lnav-banner">
                            <h3 style="display: block;"><?php echo $group_attribute['group']; ?></h3>
                            <div class="expand-collapse-container lnav-collapse" ></div>
                            <div class="expand-collapse-container lnav-expand active"></div>
                        </div>
                        <div class="lnav-link-container">
                            <ul>
                            <?php foreach($group_attribute['attribute'] as $atribute) { ?>
                                <li>
                                    <?php if ($atribute['count']==0){ ?>
                                    <input id="<?php echo $atribute['slug'] ?>" name="attr_group_<?php echo $group_attribute['slug']; ?>" value="<?php echo $atribute['id'] ?>" type="checkbox"  disabled="true" displayname="<?php echo $atribute['name'] ?>">
                                    <?php }else{ ?>
                                    <input id="<?php echo $atribute['slug'] ?>" name="attr_group_<?php echo $group_attribute['slug']; ?>"  value="<?php echo $atribute['id'] ?>" <?php echo $atribute['checked'] ?> type="checkbox" onclick="filterChanged('attr_group_<?php echo $group_attribute['slug']; ?>');" displayname="<?php echo $atribute['name'] ?>">
                                    <?php } ?>
                                    <span><?php echo $atribute['name'] ?></span>
                                    <span class="disabled-refined"> (<?php echo $atribute['count'] ?>) </span>
                                </li>
                            <?php }?>
                            </ul>
                            <div id="lnav-bottom-link-container">
                                    <a href="javascript:;" class="plain" onclick="javascript: onClearClick('attr_group_<?php echo $group_attribute['slug']; ?>');" >
                                <?php echo $text_clear ; ?></a>
                            </div>
                        </div>
                    </div>
                    <div class="lnav-horizontal-divider"></div>
                    <?php }?><!--End Attribute-->
                <?php endif; ?>
                
                <?php if($op_status): ?>
                    <?php foreach($getoptions as $option){?>
                        <?php if ($op_display): ?> <!-- show with images -->
                        <div class="lnav-category-container" id="lnav-<?php echo $option['slug']; ?>-type-container" rel="<?php if($op_expand){echo 'show';} ?>">
                            <div class="lnav-banner">
                                <h3><?php echo $option['name']; ?></h3>
                                <div class="expand-collapse-container lnav-collapse" ></div>
                                <div class="expand-collapse-container lnav-expand"></div>
                            </div>
                            <div class="lnav-link-container">
                                <div id="lnav-color-container">
                                <?php if(!empty($option['option'])): ?>
                                    <?php foreach($option['option'] as $suboption){ ?>
                                    <?php if ($suboption['count']!=0){ ?>
                                        <?php if (isset($suboption['checked']) && !empty($suboption['checked'])){ ?>
                                        <div class="color-swatch color-swatch-refine lnav-color-on" style="background: url(<?php echo  $suboption['image'] ?>); display:block; float: left;">
                                            <input id="option_<?php echo $option['slug'].'_'.$suboption['id']; ?>" name="option_<?php echo $option['slug']; ?>" type="checkbox" value="<?php echo $suboption['id'] ?>" style="display:none;" checked="checked" onclick="parentNodeClick('<?php echo $suboption['slug'] ?>');" displayname="<?php echo $suboption['name'] ?>">
                                        </div>
                                        <?php }else{ ?>
                                        <div class="color-swatch color-swatch-refine" style="background: url(<?php echo  $suboption['image'] ?>); display:block; float: left;">
                                            <input id="option_<?php echo $option['slug'].'_'.$suboption['id']; ?>" name="option_<?php echo $option['slug']; ?>" type="checkbox" value="<?php echo $suboption['id'] ?>" style="display:none;" onclick="parentNodeClick('option_<?php echo $suboption['slug'] ?>');" displayname="<?php echo $suboption['name'] ?>">
                                        </div>
                                        <?php } ?>
                                    <?php } ?>
                                  <?php } ?>
                                 <?php endif;?>
                                </div>
                                <div id="lnav-bottom-link-container">
                                        <a href="javascript:;" class="plain" onclick="javascript: onClearClick('option_<?php echo $option['slug']; ?>');">
                                <?php echo $text_clear ; ?></a>
                                </div>
                            </div>
                        </div><!--End Options -->
                        <?php else: ?> <!-- Show without image -->
                        <div class="lnav-category-container" id="lnav-<?php echo $option['slug']; ?>-container" rel="<?php if($cat_expand){echo 'show';} ?>">
                            <div class="lnav-banner">
                                <h3 style="display: block;"><?php echo $option['name']; ?></h3>
                                <div class="expand-collapse-container lnav-collapse"></div>
                                <div class="expand-collapse-container lnav-expand active"></div>
                            </div>
                            <div class="lnav-link-container">
                                <ul>
                                <?php foreach($option['option'] as $option_l) { ?>
                                    <li>
                                        <?php if ($option_l['count']==0){ ?>
                                        <input id="<?php echo $option_l['slug'] ?>" name="option_<?php echo $option['slug']; ?>" value="<?php echo $option_l['id'] ?>" type="checkbox" disabled="true" displayname="<?php echo $option_l['name'] ?>">
                                        <?php }else{ ?>
                                        <input id="<?php echo $option_l['slug'] ?>" name="option_<?php echo $option['slug']; ?>"  value="<?php echo $option_l['id'] ?>"  type="checkbox" onclick="filterChanged('option_<?php echo $option['slug']; ?>');" displayname="<?php echo $option_l['name'] ?>" <?php echo $option_l['checked'] ;?>>
                                        <?php } ?>
                                        <span><?php echo $option_l['name'] ?></span>
                                        <span class="disabled-refined"> (<?php echo $option_l['count'] ?>) </span>
                                    </li>
                                <?php }?>
                                </ul>
                                <div id="lnav-bottom-link-container">
                                    <a href="javascript:;" class="plain" onclick="javascript: onClearClick('option_<?php echo $option['slug']; ?>');" >
                                    <?php echo $text_clear ; ?></a>
                                </div>
                            </div>
                        </div><!--End Options-->
                        <?php endif; ?>
                        <div class="lnav-horizontal-divider"></div>
                    <?php } ?>
                <?php endif; ?>
                
                <?php if($size_status): ?>
               <div class="lnav-category-container" id="lnav-size-container">
                    <div class="lnav-banner">
                        <h3>Size</h3>
                        <div class="expand-collapse-container lnav-collapse">
                        </div>
                        <div class="expand-collapse-container lnav-expand">
                        </div>
                    </div><!--lnav-banner-->
                    <div class="lnav-link-container">
                        <div id="lnav-size-container">
                            <div class="lnav-size-sub-container">
                                Length <select id="size_Length" name="size_Length" onchange="filterChanged('size')">
                                    <option value=""></option>
                                    <?php foreach($lengths as $length){?>
                                        <?php if ($length === $selectLength){?>
                                            <option selected="selected" value="<?php echo $length ?>"><?php echo $length ?></option>
                                        <?php }else{ ?>
                                            <option value="<?php echo $length ?>"><?php echo $length ?></option>
                                        <?php } ?>
                                    <?php }?>
                                </select>
                            </div>
                            <div class="lnav-size-sub-container">
                               Width <select id="size_Width" name="size_Width" onchange="filterChanged('size')">
                                    <option value=""></option>
                                    <?php foreach($widths as $width){?>
                                        <?php if ($width === $selectWidth){?>
                                            <option selected="selected" value="<?php echo $width ?>"><?php echo $width ?></option>
                                        <?php }else{ ?>
                                            <option value="<?php echo $width ?>"><?php echo $width ?></option>
                                        <?php } ?>
                                    <?php }?>
                                </select>
                             
                            </div>
                            <div class="lnav-size-sub-container">
                               Height <select id="size_Height" name="size_Height" onchange="filterChanged('size')">
                                    <option value=""></option>
                                    <?php foreach($heights as $height){?>
                                        <?php if ($height === $selectHeight){?>
                                            <option selected="selected" value="<?php echo $height ?>"><?php echo $height ?></option>
                                        <?php }else{ ?>
                                            <option value="<?php echo $height ?>"><?php echo $height ?></option>
                                        <?php } ?>
                                    <?php }?>
                                </select>
                            </div>
    
                            
                            <div id="lnav-bottom-link-container">
                                    <a href="javascript:;" class="plain" onclick="javascript: cleanDropDown('size', 'sizeFilter');">
                            <?php echo $text_clear ; ?></a>
                            </div>
                        </div><!--lnav-size-container-->
                    </div><!--lnav-link-container-->
                </div><!--End Size-->
                <div class="lnav-horizontal-divider"></div> 
                <?php endif; ?>
                
                <?php if($price_status): ?>
                <div class="lnav-category-container" id="lnav-price-container" rel="show">
                    <div class="lnav-banner">
                        <h3><?php echo $text_price; ?></h3>
                        <div class="expand-collapse-container lnav-collapse">
                        </div>
                        <div class="expand-collapse-container lnav-expand">
                        </div>
                    </div><!--lnav-banner-->
                    <div class="lnav-link-container">
                        <div id="slider-range"></div>
                        
                        <div class="clear-both"></div>
                        <div class="price-range" id="amount"></div>
                        <input id="priceMin"  name="price" type="hidden" value="<?php echo $min ?>"/>
                        <input id="priceMax"  name="price" type="hidden" value="<?php echo $max ?>"/>
                        <input id="priceLowBound" type="hidden" value="<?php echo $min ?>"/>
                        <input id="priceHighBound" type="hidden" value="<?php echo $max ?>"/>
                        <div id="lnav-bottom-link-container">
                            <a id="clearMoneyRange" class="plain" href="javascript:;" onclick="onClearMoneyRange(<?php echo $set_min ?>, <?php echo $set_max ?>, <?php echo $set_min ?>, <?php echo $set_max ?>);">
                               <?php echo $text_clear; ?></a>
                        </div>
                    </div><!--lnav-link-container-->
                </div><!--Price-container-->
                <?php endif; ?>
            </div><!--End-inner-container-->
        </div><!--End-content-container-->
    </form>
</div>
<script type="text/javascript"><!--
 var versionOC = "<?php echo $versionOC; ?>";
  //--></script> 