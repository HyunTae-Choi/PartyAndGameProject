$(function(){
	$('#modify_btn').click(function() {
		$('#modify_btn').addClass("menu_selected");
		$('#secede_btn').removeClass("menu_selected");
	});
	
	$('#secede_btn').click(function() {
		$('#modify_btn').removeClass("menu_selected");
		$('#secede_btn').addClass("menu_selected");
	});
});