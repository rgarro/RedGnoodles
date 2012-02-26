
$(document).ready(function(){
	var move = false;
	var x = 17;
	var pacPadding = 25;
	
	$("#preloadImg").hide();
	
	$("#preloadImg").ajaxStart(function(){
		$(this).show();
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
			x = x - 1;
			pacPadding = pacPadding + 25;
			if(x==0){
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
		x=17;
		pacPadding = 25;
	}
		
});