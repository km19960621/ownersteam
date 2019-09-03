/*
 * Unique Select
 *   Accepts a selector to any selectboxes, and only allows unique selections
 *
 * Version: 1.1
 *
 * Copyright (c) 2009 Corey Downie 
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 * Requires: jQuery 1.2+
 *          jquery option disable plugin (jquery.optional)
 *
 * Usage:   $.uSelect([selector]);
 *          [selector] - selector to the select lists
 *
 * Examples 
 *
 */
(function($){
	$.extend({
		uSelect: function(selector){
			$(selector).each(function(){
				sel = $(this)
                opt_text = sel.find('option:selected').text();
                if (opt_text!=''){
                    $.data(this, 'selected', opt_text);
                    $(selector).not(this).optional('disable', '[text=' + opt_text + ']');
                }
			});
			
			$(selector).change(function(){
                opt_text = $(this).find('option:selected').text()
				$(selector).not(this).optional('enable', '[text=' + $.data(this,'selected') + ']');
                if (opt_text!=''){
                    $.data(this, 'selected', opt_text);
                    $(selector).not(this).optional('disable', '[text='+opt_text+']');
                }
			});
		}
	});
})(jQuery);