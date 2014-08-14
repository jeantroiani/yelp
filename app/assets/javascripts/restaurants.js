


$(document).ready(function(){
	$("#show_reviews").click(function(){
		$('.review').slideToggle(function(){
			if ($('.review').is(':visible')){
				$('#show_reviews').text('Hide Reviews');	
			}
			else{
				$('#show_reviews').text('Show Reviews');
			}
		
		});	
	});
});

