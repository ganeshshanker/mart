jQuery(document).ready(initLNav)

function initLNav() {
	jQuery('.color-swatch-static').click(function() {
		window.location.href=jQuery(this).attr('rel');
	});
	jQuery('ul#lnav-link-shapes-list li div').click(function() {
		window.location.href=jQuery(this).attr('rel');
	});
	
	jQuery('#lnav-inner-container').find('.lnav-category-container').each(function() {     // perform function for each element
		var id = jQuery(this).attr('id');
		if (versionOC >= '1.5.5') {
	      var rel = jQuery.totalStorage(id);
	    } else{
	      var rel = jQuery.cookie(id);
	    };
	    if (rel) {
	    	var status = rel;
	    }else{
	    	var status = jQuery(this).attr('rel');
	    };
		
		if (status =='show') {//show
	   		var expandCollapseContainer = jQuery(this).find('.lnav-expand'); // find the element with class matching the id

   			expandCollapseContainer.toggleClass('active').parent().next().slideDown();
   			expandCollapseContainer.css({'display':'none'});
   			expandCollapseContainer.siblings().css({'display':'block'});

   		} else {//hidden
   			var expandCollapseContainer = jQuery(this).find('.lnav-collapse'); // find the element with class matching the id
   			
   			expandCollapseContainer.removeClass('active').parent().next().slideUp();
   		  	
   			// Add timeout on changing the state of the slider to give it time to go up. 
		   	setTimeout(function(){
			   	expandCollapseContainer.css({'display':'none'});
			   	expandCollapseContainer.siblings().css({'display':'block'});
		   	}, 'fast');

   		}
	});
		
	
	// On Click open the closed container, and close the open container.
   	jQuery('.expand-collapse-container').click(function() {
   		
   		var expandCollapseContainer = jQuery(this); 

   		// Need to add timeout because of the sequence of events when dblClicking may get out of synch. 
   		if (expandCollapseContainer.parent().next().is(':hidden')) {
   			expandCollapseContainer.toggleClass('active').parent().next().slideDown();
   			expandCollapseContainer.css({'display':'none'});
   			var id_parent = expandCollapseContainer.parent().parent().attr('id');
   			if (versionOC >= '1.5.5') {
		      jQuery.totalStorage(id_parent, 'show'); 
		    } else{
		      jQuery.cookie(id_parent, 'show'); 
		    };
   			expandCollapseContainer.siblings().css({'display':'block'});
   		} else {
   			expandCollapseContainer.removeClass('active').parent().next().slideUp();
   		  	
   			// Add timeout on changing the state of the slider to give it time to go up. 
		   	setTimeout(function(){
			   	expandCollapseContainer.css({'display':'none'});
			   	var id_parent = expandCollapseContainer.parent().parent().attr('id');
   			if (versionOC >= '1.5.5') {
		      jQuery.totalStorage(id_parent, 'hidden'); 
		    } else{
		      jQuery.cookie(id_parent, 'hidden'); 
		    };
			   	expandCollapseContainer.siblings().css({'display':'block'});
		   	}, 400);
   		}
   		return false; // Prevent the browser jump to the link anchor
   	});

   	jQuery('.lnav-collapse-txt').click(function() {
   		if (jQuery(this).parent().next().is(':hidden')) {
   			jQuery(this).toggleClass('active').parent().next().slideDown();
   			// Scroll to the product container user clicked on.
   			jQuery(this).html("[ - ]");
   		} else {
   			jQuery(this).removeClass('active').parent().next().slideUp();
   			jQuery(this).html("[ + ]");
   		}
   		return false; // Prevent the browser jump to the link anchor
   	});

   	jQuery('.lnav-show-more-less-txt').click(function() {
   		var thisObject = jQuery(this);
   		var moreText = thisObject.attr('rel1');
   		var lessText = thisObject.attr('rel2');
   		var collapsable = thisObject.parent().parent().prev();
   		if (collapsable.is(':hidden')) {
   			thisObject.toggleClass('active').parent().parent().prev().slideDown();
   			thisObject.html(lessText + " [ - ]");
   		} else {
   			thisObject.removeClass('active').parent().parent().prev().slideUp();
   			thisObject.html(moreText + " [ + ]");
   		}
   		return false; // Prevent the browser jump to the link anchor
   	});
   	
   	jQuery('#lnav-alphabet-container').children().each(function() {
		var letter  = this;
		var element = jQuery('#lnav-brand-name-container li[name]').filter(function() {
			var name = jQuery(this).attr('name');
			if (letter.id === "0-9") {
				for (var index = 0; index < 10; index++) {
					if (name.indexOf(index.toString()) == 0) {
						return true;
					}
				}
			}
			return name.toUpperCase().indexOf(letter.id.toUpperCase()) == 0;
		});
		if (0 == element.length) {
			jQuery(this).addClass('lnav-letter-off');
   			jQuery(this).removeClass('lnav-letter-available');
		}
	});

   	jQuery('#lnav-alphabet-container').children().click(function() {
		var letter  = this;
		var element = jQuery('#lnav-brand-name-container li[name]').filter(function() {
			var name = jQuery(this).attr('name');
			if (letter.id === "0-9") {
				for (var index = 0; index < 10; index++) {
					if (name.indexOf(index.toString()) == 0) {
						return true;
					}
				}
			}
			return name.toUpperCase().indexOf(letter.id.toUpperCase()) == 0;
		});
		if (0 == element.length) {
			return;
		}
		clearAlphabetPicker();
		jQuery(this).addClass('lnav-letter-on');
		var offsetTop = getTopBrandElementOffset(element[0]);
		restoreOffset('lnav-brand-name-container', offsetTop);
   	});

   	jQuery('.color-swatch-refine').click(function() {
   		if (0 != jQuery(this).children('input:disabled').length) {
   			return;
   		}
   		if (jQuery(this).is('.lnav-color-on')) {
   			jQuery(this).removeClass('lnav-color-on');
   		} else {
   			jQuery(this).addClass('lnav-color-on');
   		}
		callFilterChanged(this);
   	});

	repackBrandsFilters();
	repackColorFilters();
	//initToolTip();
}

function repackBrandsFilters() {
	var brands = jQuery('#lnav-brand-name-container li a,#lnav-brand-name-container input:checkbox').length;
	if (0 == brands) {
		jQuery('#lnav-top-brands-container').hide();
		return;
	}
	var height = jQuery('#lnav-brand-name-container li:first').height() * brands;
	if (height < jQuery('#lnav-brand-name-container').height()) {
		jQuery('#lnav-brand-name-container').height(height);
	}
}

function repackColorFilters() {
	var colors = jQuery("#lnav-color-container input:checkbox,.color-swatch").length;
	if (0 == colors) {
		jQuery('#no-colors-avail').show(); 
		jQuery('#clearIDsearchColors').hide();
		return;
	}
}

function callFilterChanged(element) {
	var childrenElement = jQuery(element).children();
	var childrenId = childrenElement.prop('id');
	childrenElement.attr('checked', !childrenElement.prop('checked'));
	filterChanged(childrenId.substring(0, childrenId.search(childrenElement.val()) - 1));
}

function initToolTip() {
	jQuery(".lnav-collapse").tooltip({
        // each trashcan image works as a trigger
        tip: '#collapse-tooltip',

        // custom positioning
        position: 'center right',

        // move tooltip a little bit to the right
        offset: [4, -90],

        // there is no delay when the mouse is moved away from the trigger
        delay: 0
    });
	jQuery(".lnav-expand").tooltip({

        // each trashcan image works as a trigger
        tip: '#expand-tooltip',

        // custom positioning
        position: 'center right',

        // move tooltip a little bit to the right
        offset: [4, -90],

        // there is no delay when the mouse is moved away from the trigger
        delay: 0
    });
}

function clearCheckboxes(checkboxNamePrefix) {
    var cleaned = false;
     for (var i = 0; i < document.refinedSearchForm.elements.length; i++) {
       	if (document.refinedSearchForm.elements[i].name.match(checkboxNamePrefix) != null && document.refinedSearchForm.elements[i].checked) {
			document.refinedSearchForm.elements[i].checked = false;
            cleaned = true;
		}
	}
    return cleaned;
}

function onBrandCheckboxesCleanClick(checkboxNamePrefix) {
	clearAlphabetPicker();
    onClearClick(checkboxNamePrefix);
}

function cleanDropDown(selectNamePrefix){
    var elements = jQuery('select[name^='+selectNamePrefix+']');
    if(elements.size() > 0){
		var cleaned = false;
		for (var i = 0; i < document.refinedSearchForm.elements.length; i++) {
			if (document.refinedSearchForm.elements[i].name.match(selectNamePrefix) != null) {
				document.refinedSearchForm.elements[i].value = "";
				cleaned = true;
			}
		}
        filterChanged(selectNamePrefix);
    }
}

function clearAlphabetPicker(){
	jQuery('#lnav-alphabet-container').children().removeClass('lnav-letter-on');
}

function ColorClean(checkboxNamePrefix){
    jQuery('#lnav-color-container').children().removeClass('lnav-color-on');
    onClearClick(checkboxNamePrefix);
}

function onClearClick(currentFilterGroup) {
    if (clearCheckboxes(currentFilterGroup)) {
        filterChanged(currentFilterGroup);
    }
}

function onClearMoneyRange(min, max, selectedMin, selectedMax) {
	var currencySignJS = "$"; 
   
    jQuery("#priceMin").val(min);
    jQuery("#priceMax").val(max);
	jQuery("#amount").html(currencySignJS + min + ' - ' + currencySignJS + max);
	jQuery("#slider-range").slider('destroy');
	initializeSlider(min, max, selectedMin, selectedMax);
    filterChanged('price');
}

// Scroll top of option Brand 

function getTopBrandElementOffset(brandElement) {
	var scrollTop = document.getElementById('lnav-brand-name-container').scrollTop;
	var elementOffsetTop = Math.abs(getOffsetTop(brandElement) - getOffsetTop(document.getElementById('lnav-brand-name-container')));
	if (elementOffsetTop < scrollTop) {
		return scrollTop - Math.abs(elementOffsetTop - scrollTop);
	}
	return elementOffsetTop;
}

function getBrandElementOffset(brandElement) {
	var scrollTop = document.getElementById('lnav-brand-name-container').scrollTop;
	var scrollHeight = document.getElementById('lnav-brand-name-container').offsetHeight;
	var elementOffsetTop = Math.abs(getOffsetTop(brandElement) - getOffsetTop(document.getElementById('lnav-brand-name-container')));
	if (elementOffsetTop < scrollTop) {
		return scrollTop - Math.abs(elementOffsetTop - scrollTop);
	}
	if (elementOffsetTop + brandElement.offsetHeight > scrollTop + scrollHeight) {
		return elementOffsetTop + brandElement.offsetHeight - scrollHeight;
	}
	return scrollTop;
}

function getOffsetTop(element) {
	if (null == element) {
		return 0;
	}
	if (!jQuery.browser.msie) {
		return element.offsetTop;
	}
	var offsetTop = 0;
	if (element.offsetParent) {
		do {
			offsetTop += element.offsetTop;
		} while (element = element.offsetParent)
	} else {
		offsetTop = element.offsetTop;
	}
	return offsetTop;
}
function restoreOffset(controlId, position) {
	var element = document.getElementById(controlId);
	if (null == element) {
		return;
	}
	element.scrollTop = position;
}

// Onclick tag parent
function parentNodeClick(elementId) {
    jQuery("#"+elementId).parent().click();
}

/*
	Process Search...................................................................................
*/
var OrderList = [];

function filterChanged(attributeGroup) {
	var attr_Group = document.getElementById("attributeGroups").value;
	if(attr_Group){
		var check = attr_Group.match(attributeGroup);
		if(!check){
			document.getElementById("attributeGroups").value = attr_Group +"|"+attributeGroup;
		}
	}else{
		document.getElementById("attributeGroups").value = attributeGroup;
	}
	var requestHash = createRequest();
	var url = $('base').attr('href');
	window.location.href = url + "index.php?route=product/results&" + requestHash;
	return false;
	// Ajax
	 $.ajax({
		 	url: url + "index.php?route=product/results&" + requestHash ,
			dataType:"html",
			type:"GET",
			data:"",
			beforeSend: function(){
				},
			success: function(html){
				$('#content').html(html);
			}
		 });
		}
function escapeAmpersand(str) {
	return str.replace(/&/g, "%amp%");
}

function unescapeAmpersand(str) {
	return str.replace(/%amp%/g, "&");
}


// Phan tich yeu cau 
function createRequest() {
	var requestArray = new Array();
	var root = document.getElementById("category_root").value;
	// Atribute and Options
	requestArray[0] = createAttributeRequestParameters();
	// Dimensions
	requestArray[1] = createSizeRequestParameters();
	// Price
	requestArray[2] = createRequestParameter("priceMin", "minPrice", false);
	requestArray[3] = createRequestParameter("priceMax", "maxPrice", false);
	
	var result = buildRequestHash(requestArray);
	return result+"&path="+root + "&filterProduct=1";
}
function buildRequestHash(requestArray) {
	var requestHash = requestArray[0];
	var length = requestArray.length
	for (var index = 1; index < length; index++) {
		if (requestHash === "") {
			requestHash += requestArray[index];
			continue;
		}
		if (requestArray[index] !== "") {
			requestHash += "&" + requestArray[index];
		}
	}
	return requestHash;
}

// Create atribute
function createAttributeRequestParameters() {
	var attributeFieldNames = createAttributeGroup();
	var result = "";
	var attributeFields;

	var k = 0;
	for (var i = 0; i < attributeFieldNames.length; i++) {
		
		attributeFields = document.getElementsByName(attributeFieldNames[i]);
		var subResult = attributeFieldNames[i] + "=[";
		for (var j = 0; j < attributeFields.length; j++) {
			if (attributeFields[j].checked) {
				subResult = subResult + escapeAmpersand(attributeFields[j].value) + "|";
                OrderList.push(attributeFields[j].id);
			}
		}
		if (subResult.search(/\[$/) != -1) {
			continue;
		}
		if (result === "") {
			result += subResult.replace(/\|$/, "") + "]"
		} else {
			result += "&" + subResult.replace(/\|$/, "") + "]"
		}
	}
	return result;
}

// Create vlalue dimensions
function createSizeRequestParameters() {
	var result = "";
	var selectFields = document.getElementsByTagName("select");
	for (i = 0; i < selectFields.length; i++) {
		var fieldName = selectFields[i].name;
		if (fieldName.search(/^size_.+/) != 0) {
			continue;
		}
        if (0 <= selectFields[i].selectedIndex) {
            var fieldValue = selectFields[i].options[selectFields[i].selectedIndex].text;
            if (fieldValue === "") {
                continue;
            }
            if (result === "") {
                result += fieldName + "=" + fieldValue;
            } else {
                result += "&" + fieldName + "=" + fieldValue;
            }
        }
	}
	return result;
}

// Create price value
function createRequestParameter(fieldId, requestField, isEscapeAmpersand) {
	var result = "";
	var field = document.getElementById(fieldId);
	if (field != null) {
		result = requestField + "=" + (isEscapeAmpersand ? escapeAmpersand(field.value) : field.value);
	}
	return result;
}

// Create array attribute group
function createAttributeGroup() {
	var attributeFieldNames = new Array();
	var filterList = document.getElementById("attributeGroups").value;
	var attrValues = stringToArray(filterList);
	for (var j = 0; j < attrValues.length; j++) {
		attributeFieldNames[j] = attrValues[j];
	}
	return attributeFieldNames;
	
}
function stringToArray(str) {
	if (str.charAt(0) == "[") {
		str = str.substr(1);
	}
	if (str.charAt(str.length - 1) == "]") {
		str = str.substr(0, str.length - 1);
	}
	return str.split("|");
}
