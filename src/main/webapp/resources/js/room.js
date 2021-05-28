$(function(){

	$('#button1').click(function() {
		$('#button1').addClass("menu_selected");
		$('#button2').removeClass("menu_selected");
		$('#button3').removeClass("menu_selected");

		$("#button_1_contents").css("display","block");
		$("#button_2_contents").css("display","none");
		$("#button_3_contents").css("display","none");
	});
	$('#button2').click(function() {
		$('#button1').removeClass("menu_selected");
		$('#button2').addClass("menu_selected");
		$('#button3').removeClass("menu_selected");


		$("#button_1_contents").css("display","none");
		$("#button_2_contents").css("display","block");
		$("#button_3_contents").css("display","none");
	});
	$('#button3').click(function() {
		$('#button1').removeClass("menu_selected");
		$('#button2').removeClass("menu_selected");
		$('#button3').addClass("menu_selected");

		$("#button_1_contents").css("display","none");
		$("#button_2_contents").css("display","none");
		$("#button_3_contents").css("display","block");
	});
});