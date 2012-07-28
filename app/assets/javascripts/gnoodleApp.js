/**
 * Gnoodles Experimental javascript mvc app 
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
 * @requires jQuery,jsrender,Route32,mastertray 
 * @author Rolando Garro <rgarro@gmail.com>
 * @copyright emptyart 2012
 */


function gnoodleApp(options){
		
		var settings = $.extend(
		{
			'masterTraySelector':'#deploySpace'
		},options);
		
		var router = new Route32({
			'automatic':false,
			'selector':'.steerpoint'
		});
		
		var methods = {
			init:function(){
				router.add("#/gingredients",function(){
					showIngredients();
				});
				router.add("#/gnoodlerecipes",function(){
					showRecipes();
				});
				router.drive();
			},
		};
		
		
		function showIngredients(){
			$(settings.masterTraySelector).html("ingredients");
			$(settings.masterTraySelector).masterTray(
				{
					'listDataUrl':'/gkitchen/services/ingredientslist',
					'labelField':'api_name',
					'parentSelector':'#deploySpace',
					'title':'gIngredients jijij'
				});
		}
		
		function showRecipes(){
			$(settings.masterTraySelector).html("recipes");
		}
		
		//object constructor
		methods.init();
		
		return this;
}	

