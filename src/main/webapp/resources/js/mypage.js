$(function(){
	/*회원정보 수정 클릭*/
	$('#modify_btn').click(function() {
		$('#modify_btn').addClass("menu_selected");
		$('#secede_btn').removeClass("menu_selected");
	});
	
	/*회원정보 삭제 클릭*/
	$('#secede_btn').click(function() {
		$('#modify_btn').removeClass("menu_selected");
		$('#secede_btn').addClass("menu_selected");
	});
});