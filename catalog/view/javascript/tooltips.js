/*___________________________________________________________________________________________________________________________________
 * 
 * Coastal Contacts Tab Styling starts 
 *  
 * All the tooltip initializations must be done in this file for better manageability and cleanliness of code. 
 * __________________________________________________________________________________________________________________________________
 */

function initProductCategoryTooltips() {

	lazyTooltipInit = function(elements, data) {
		if (elements == null || elements.length == 0) {
			return;
		}
        setTimeout(function() {
				jQuery(elements).tooltip(data);
				jQuery(elements).removeClass('tooltip-not-initialized');
				jQuery(elements).addClass('tooltip-initialized');
		}, 500);
	};
	
	init = function(elements, data) {
		
		// For tooltips on Contacts, Sunglasses and Accessories Category page. 
		var generic = jQuery('div[id*=browse-content-container] div span' + elements + '.tooltip-not-initialized');
		lazyTooltipInit(generic, data);
		
		// For tooltips on two tabs for Glasses.
		var classic = jQuery('div#content div span' + elements + '.tooltip-not-initialized');
		lazyTooltipInit(classic, data);
		
		var tryon = jQuery('div#browse-content-container-tryon div span' + elements + '.tooltip-not-initialized');
		lazyTooltipInit(tryon, data);
	};
	
	init(".favorite-removed",
		{ 
		   offset: [-18, -4],
		   effect: 'slide',
		   relative: true
		}
	);

	init(".favorite-added",
			{ 
		   offset: [-18, -4],
		   effect: 'slide',
		   relative: true
		}
	);

	init(".product-gender-male",
			{ 
		   offset: [-18, -4],
		   effect: 'slide',
		   relative: true
		}
	);

	init(".product-gender-female",
			{ 
		   offset: [-18,-4],
		   effect: 'slide',
		   relative: true
		}
	);

	init(".product-gender-male-and-female",
			{ 
		   offset: [-18, -4],
		   effect: 'slide',
		   relative: true
		}
	);
	jQuery(".product-review-stars").tooltip({
		offset: [-18, -4],
		   effect: 'slide',
		   relative: true
    });
}




