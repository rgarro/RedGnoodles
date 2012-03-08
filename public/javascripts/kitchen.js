
$(document).ready(function(){
	var move = false;
	var totalSteps=17;
	var step = 0;
	var pacPadding = 0;
	var pacPaddingValue = 25;
	
	$("#preloadImg").hide();
	
	$("#preloadImg").ajaxStart(function(){
		$(this).show();
		setOrigin();
		move=true;
		walk();
	});
	
	$("#preloadImg").ajaxStop(function(){
		move = false;
		$(this).hide();
	});
	
	
	function walk(){
		$("#pacFace").css('margin-left',pacPadding+'px');
		$("#preloadImg").css('width','500px');
		$("#preloadImg").css('background-position',(pacPadding + 15)+'px 0px');
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
			$("#preloadImg").css('width','500px');
			$("#preloadImg").css('background-position','10px 0px');
		}
	}
	
	function setOrigin(){
		step=totalSteps;
		pacPadding = pacPaddingValue;
	}
		
});