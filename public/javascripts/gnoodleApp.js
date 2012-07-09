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


function gnoodleApp(){
		
		var router = new Route32({
			'automatic':false,
			'selector':'.steerpoint'
		});
		
		var methods = {
			init:function(){
				router.add("#/gingredients",function(){
					$("#deploySpace").html("ingredients");
				});
				router.add("#/gnoodlerecipes",function(){
					$("#deploySpace").html("recipes");
				});
				router.drive();
			},
		};
		
		//object constructor
		methods.init();
		
		return this;
}	

