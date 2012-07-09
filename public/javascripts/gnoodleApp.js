/**
 * Gnoodles Admin Client Side App Object 
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
 * @requires jquery, angular
 * @author Rolando Garro <rgarro@gmail.com>
 * @copyright emptyart 2012
 */
'use strict';

angular.module('gnoodles',[]).config(['$routeProvider',function($routeProvider){
	$routeProvider.
		when('/gingredients',{template:'/gkitchen/gingredients',controller: gIngredientsCtl}).
		when('/gnoodlerecipes',{template:'/gkitchen/gnoodlerecipes',controller: gNoodleRecipesCtl}).
		otherwise({redirectTo:'/gingredients'});
}]); 

/*(function($){


$.fn.gnoodleApp = function(options){
	var settings = $.extend(
		{
			'isHidden':true
		},options);
		
	return this;	
}	

})(jQuery);*/
