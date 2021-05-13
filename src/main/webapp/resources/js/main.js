$(function(){
	var rollHeader = 100;
	$(window).scroll(function() {
		var scroll = getCurrentScroll();
		if ( scroll >= rollHeader ) {
			$('#header').addClass('roll');
			$('.logo').addClass('roll');
			$('.menu_li').addClass('roll');
			$('.member_li').addClass('roll');
			$('#move_top_btn').fadeIn();
		}
		else {
			$('#header').removeClass('roll');
			$('.logo').removeClass('roll');
			$('.menu_li').removeClass('roll');
			$('.member_li').removeClass('roll');
			$('#move_top_btn').fadeOut();
		}
	});
	$("#about_btn").click(function() {
		$('html, body').animate({
			scrollTop : 850
		}, 400);
		return false;
	});
	$("#rooms_btn").click(function() {
		$('html, body').animate({
			scrollTop : 1400
		}, 400);
		return false;
	});
	$("#event_btn").click(function() {
		$('html, body').animate({
			scrollTop : 2240
		}, 400);
		return false;
	});
	$("#service_btn").click(function() {
		$('html, body').animate({
			scrollTop : 2980
		}, 400);
		return false;
	});
	$("#move_top_btn").click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return false;
	});
	function getCurrentScroll() {
		return window.pageYOffset || document.documentElement.scrollTop;
	}
});