$(function(){
	$('#info_btn').click(function() {
		$('#info_btn').addClass("menu_selected");
		$('#booking_btn').removeClass("menu_selected");
		$('#question_btn').removeClass("menu_selected");
		$('#modify_btn').removeClass("menu_selected");
		$('#secede_btn').removeClass("menu_selected");

		$("#info_div").css("display","block");
		$("#booking_table_div").css("display","none");
		$("#question_table_div").css("display","none");
	});
	$('#booking_btn').click(function() {
		$('#info_btn').removeClass("menu_selected");
		$('#booking_btn').addClass("menu_selected");
		$('#question_btn').removeClass("menu_selected");
		$('#modify_btn').removeClass("menu_selected");
		$('#secede_btn').removeClass("menu_selected");

		$("#info_div").css("display","none");
		$("#booking_table_div").css("display","block");
		$("#question_table_div").css("display","none");
	});
	$('#question_btn').click(function() {
		$('#info_btn').removeClass("menu_selected");
		$('#booking_btn').removeClass("menu_selected");
		$('#question_btn').addClass("menu_selected");
		$('#modify_btn').removeClass("menu_selected");
		$('#secede_btn').removeClass("menu_selected");

		$("#info_div").css("display","none");
		$("#booking_table_div").css("display","none");
		$("#question_table_div").css("display","block");
	});
	$('#modify_btn').click(function() {
		$('#info_btn').removeClass("menu_selected");
		$('#booking_btn').removeClass("menu_selected");
		$('#question_btn').removeClass("menu_selected");
		$('#modify_btn').addClass("menu_selected");
		$('#secede_btn').removeClass("menu_selected");

		$("#info_div").css("display","none");
		$("#booking_table_div").css("display","none");
		$("#question_table_div").css("display","none");
	});
	$('#secede_btn').click(function() {
		$('#info_btn').removeClass("menu_selected");
		$('#booking_btn').removeClass("menu_selected");
		$('#question_btn').removeClass("menu_selected");
		$('#modify_btn').removeClass("menu_selected");
		$('#secede_btn').addClass("menu_selected");

		$("#info_div").css("display","none");
		$("#booking_table_div").css("display","none");
		$("#question_table_div").css("display","none");
	});
});