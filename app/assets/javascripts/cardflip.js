$(function(){

	$("#definition").bind("click",function(e){
		e.preventDefault();
	
		$("#card").flippy({
			verso:$("#card-definition"),
			direction:"TOP",
			depth:"0.95",
			duration:"750"
		});
	
	});

	
	$("#hint").bind("click",function(e){
		e.preventDefault();
	
		$("#card").flippy({
			verso:$("#card-hint"),
			direction:"RIGHT",
			depth:"0.95",
			duration:"750"
		});
	
	});
	
	
	$("#revert").bind("click",function(e){
		e.preventDefault();
		$("#card").flippyReverse();
	
	});

});