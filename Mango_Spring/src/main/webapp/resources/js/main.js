
	
	function scrollEvent() { 
			var scrollValue = $(document).scrollTop();
			if(scrollValue <= 400) {
				$('#HeaderId').attr('class','Header').css("transition-duration","0.5s");
				$('#logo').attr('class','mango-logo')
				$('#MangoPick-Btn').attr('class','Header-Btn-MangoPick');
				$('#TopList-Btn').attr('class','Header-Btn-TopList');
				$('#Profile-Btn').attr('class','Header-Btn-Profile');
				$('#SearchBoxId').attr('class','Header-SearchBox-Hidden');
			}else {
				$('#HeaderId').attr('class','Header-White').css("transition-duration","0.1s");
				$('#logo').attr('class','mango-logo-White')
				$('#MangoPick-Btn').attr('class','Header-White-Btn-MangoPick');
				$('#TopList-Btn').attr('class','Header-White-Btn-TopList');
				$('#Profile-Btn').attr('class','Header-White-Btn-Profile');
				$('#SearchBoxId').attr('class','Header-SearchBox');
			}
	}