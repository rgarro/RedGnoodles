/**
 * Gnoodles Handy Tray to Manage Data 
 *
 *          .-""-.
 *         /[] _ _\
 *        _|_o_LII|_
 *       / | ==== | \
 *       |_| ==== |_|
 *        ||" ||  ||
 *        ||LI  o ||
 *        ||'----'||
 *      /__|    |__\
 * 
 * @requires jQuery,jsrender 
 * @author Rolando Garro <rgarro@gmail.com>
 * @copyright emptyart 2012
 */


(function($){


$.fn.masterTray = function(options){
	var dlist=new Array();
	var dataIsGet = false;
	
	var settings = $.extend(
		{
			'listDataUrl':'/gkitchen/services/ingredientslist',
			'labelField':'api_name',
			'parentSelector':'#deploySpace',
			'templateID':'#masterTrayRowTemplate',
			'headerTemplate':'#masterTrayHeaderTemplate',
			'title':'gIngredients'
		},options);
		
	var methods = {
		init:function(){
			model.getAll();
		},
		getData:function(data){
			var x =0;
			$.each(data,function(i,v){
				var obj = new Object();
				obj.id = v.id;
				eval("obj.label = v."+settings.labelField+";");
				dlist[x] = obj;
				x++;
			});
			var head = {
				title:settings.title
			};
			var cont = $(settings.headerTemplate).render(head);
			cont += $(settings.templateID).render(dlist);
			$(settings.parentSelector).html(cont);
		}
	};	
		var model = {
			getAll:function(){
				$.getJSON(settings.listDataUrl,function(data){
					methods.getData(data);
				});
			}
		};
	methods.init();
		
	return this;	
}	

})(jQuery);