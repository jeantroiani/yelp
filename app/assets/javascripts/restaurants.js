
$(document).ready(function(){
	$("#review_section #show_reviews").click(function(){
		$(this).siblings('.review').slideToggle(function(){
			if ($('.review').is(':visible')){
				$('#show_reviews').text('Hide Reviews');	
			}
			else{
				$('#show_reviews').text('Show Reviews');
			}
		});
	
	});
});

