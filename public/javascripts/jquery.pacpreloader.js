/**
 * PacPreloader  
 *       .-.   .-.     .--.                             
 *     | OO| | OO|   / _.-' .-.   .-.  .-.   .''.      
 *     |   | |   |   \  '-. '-'   '-'  '-'   '..'     
 *     '^^^' '^^^'    '--'                         

 * displays a walking pacman on ajax activity
 * 
 * Licensed under the MIT license.
 * 
 * @author Rolando Garro <rgarro@gmail.com>
 * @requires jQuery
 */
(function($){
	$.fn.PacPreloader = function(options){
		 //Settings
        var settings = $.extend({
                           'automatic':true
                       },options);
		var move = false;
		var totalSteps=17;
		var step = 0;
		var pacPadding = 0;
		var pacPaddingValue = 25;
		var preloaderID = '#preloadImg';
		
		var methods = {
			init:function(obj){				
				preloaderID = "#"+$(obj).attr("id");				
				$(preloaderID).hide();
				
			},
		};
		
		methods.init(this);
		
		$(preloaderID).ajaxStart(function(){
			$(preloaderID).show();
			setOrigin();
			move=true;
			walk();
		});
		
		$(preloaderID).ajaxStop(function(){
			move = false;
			$(preloaderID).hide();
		});
		
		function walk(){
			$("#pacFace").css('margin-left',pacPadding+'px');
			$(preloaderID).css('width','500px');
			$(preloaderID).css('background-position',(pacPadding + 15)+'px 0px');
			if(move){
				step = step - 1;
				pacPadding = pacPadding + pacPaddingValue;
				if(step==0){
					setOrigin();		
				}
				setTimeout(walk,200);
			}else{
				setOrigin();
				$("#pacFace").css('margin-left','5px');
				$(preloaderID).css('width','500px');
				$(preloaderID).css('background-position','10px 0px');
			}
		}
	
		function setOrigin(){
			step=totalSteps;
			pacPadding = pacPaddingValue;
		}
		
		return this;
	}
})(jQuery);

