/* ====== common.js ===== */		

/* 유효성 검사 패턴 배열저장 
0 - 아이디(영문자/숫자 (8-20자)), 
1 - 비밀번호 (영문자/숫자/특수문자 (8-20자))
2 - 이름 (한글이름 2-6자)
3 - 핸드폰
4 - 이메일 (조금 에러 있음, 수정 필요함)
5 - 년, 월, 일 - 잘못된 날짜를 입력여부 확인, (예시: 6월 31일 같이 없는 날짜) */
var pattern = [
"^[A-Za-z0-9]{8,20}$",
"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&-_]{8,20}$",
"^[가-힣]{2,6}$", 
"^\\d{3}\\d{3,4}\\d{4}",
"^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+",
"/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/"
];

/* 유효성 검사
@param index  유효성 검사 패턴의 배열 번호 (예시: 0, 1, 2)
@param data   유효성 검사를 할 데이터의 주소 - 제이쿼리로 데이터 호출 (예시: #m_pw_register)
@param msg    정규식이 일치하지 않을 경우, 출력할 메시지 */
function inputVerify(index, data, msg) {
	// RegExp 생성자는 패턴을 사용해 텍스트를 판별할 때 사용.
	// 유효성 검사 패턴을 RegExp 생성자에 대입
	var data_regExp = new RegExp(pattern[index]);

	// .exec() - 정규표현식과 일치하는 문자열들을 배열에 담아서 리턴, 일치하는 값이 없을 경우 null을 리턴
	var match = data_regExp.exec($(data).val());

	if (match == null) {
		alert(msg + " 입력값이 형식에 맞지 않습니다. 다시 입력해 주세요.");
		$(data).val("");
		$(data).focus();
		return false;
	} else {
		return true;
	}
}

/* 비밀번호와 비밀번호 확인 일치 여부 확인
@param register      비밀번호 input id 주소 - 제이쿼리로 데이터 호출 (예시: "#m_pw_register") 
@param rgisterCheck  비밀번호 확인 input id 주소 (예시: "#m_pw_check_register") */
function passwordCheck(register, registerCheck) {
	if ($(register).val() != $(registerCheck).val()) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
		$(registerCheck).focus();
		$(registerCheck).val("");
		return false;
	} else {
		return true;
	}
}

/* radio 타입 체크 확인
@param inputName  확인할 radio 요소의 주소(name or id) - 제이쿼리로 데이터 호출 
(예시: "input:radio[name='m_Gender']") - id도 가능
@param msg  출력 메시지 (예시: '성별을') */
function radioBlankCheck(inputName, msg){
	if(!$(inputName).is(":checked")){
		alert(msg + " 선택해 주세요.");
		return false;
	}else{		
		return true;
	}
}

/* checkBox 타입 체크 확인
@param inputName  확인할 checkbox 요소의 주소(name or id) - 제이쿼리로 데이터 호출 
(예시: "input:checkbox[name='m_Gender']") - id도 가능
@param msg  출력 메시지 (예시: '이용약관을') */
function checkboxBlankCheck(inputName, msg) {
	if (!$(inputName).is(":checked")) {
		alert(msg + " 동의해 주세요.");
		return false;
	} else {
		return true;
	}
}

/* 공백확인
@param data 공백을 확인할 데이터 - 이미 제이쿼리로 호출된 데이터
@param msg 출력 메시지 */ 
function formBlankCheck(data, msg){
	if(data.val().replace(/\s/g,"")==""){
		alert(msg+" 입력해 주세요");
		data.val("");
		data.focus();
		return false;
	}else{
		return true;
	}
}				





/* ====== member.js (로그인, 회원가입, 찾기, 수정) ===== */
/* 로그인 체크 */
function loginCheck(){
	if (!formBlankCheck($('#m_id_login'), '아이디를')) return;
	else if (!formBlankCheck($('#m_pw_login'), "비밀번호를")) return;
	else {
		$("#loginForm").attr({
			"method" : "post",
			"action" : "/login/login"
		});
		
		$("#loginForm").submit();
	}
}

/* 아이디, 비밀번호 찾기 
@param find 이메일로 아이디 찾기 or 아이디로 비밀번호 찾기를 판정하기 위한 단어	*/
function findIdPw(find){			 			 
	 if(find == 'id'){ 	// 이메일로 아이디 찾기		
	 	if (!formBlankCheck($('#m_email_find'), 'E-mail을')) {return;}
	 	else {
	 		$.ajax({
	 			url : "/login/find",  
	 			type : "post",                
	 			data : "m_Email=" + $('#m_email_find').val(),
	 			error : function(){  
	 				alert('성공');
	 			},
	 			success : function(resultData){ 
	 				alert('실패');
	 			}
	 		});
	 	}
	 } else if(find == 'pw'){ // 아이디로 비밀번호 찾기
	 	if (!formBlankCheck($('#m_id_find'), '아이디를')) {return;}
	 	else {
	 		$.ajax({
	 			url : "/login/find",  
	 			type : "post",                
	 			data : "m_Id=" + $('#m_id_find').val(),
	 			error : function(){  
	 				alert('성공');
	 			},
	 			success : function(resultData){ 
	 				alert('실패');
	 			}
	 		});
	 	}
	 }
	}

	/* 이용약관 체크 확인 */
	function termsCheck(){
		if (!checkboxBlankCheck("input:checkbox[id='policy_agree_term']", '이용약관에')) return;
		else if (!checkboxBlankCheck("input:checkbox[id='privacy_agree_privacy_term']", '개인정보 수집 및 이용에')) return;
		else {
			/*회원 가입- 약관동의 - 회원정보 입력폼 modal 열기*/
			$('#terms_modal').attr("style", "display:none");
			$('#register_form_modal').attr("style", "display:block");
			
			if($('input:checkbox[id="m_email_margetring_register_term"]').is(":checked")){
				$("#m_email_margetring_register").val('1');	
			} 
			

		}			
	}	

	/* 회원 가입 체크 (공백, 유효성 검사) */
	function joinMember() {
	//입력값 체크 // 아이디 중복 체크도 넣어야함.
	if (!formBlankCheck($('#m_id_register'), '아이디를')) return;
	else if (!inputVerify(0, '#m_id_register', '아이디')) return;
	else if (!formBlankCheck($('#m_pw_register'), "비밀번호를")) return;
	else if (!inputVerify(1, '#m_pw_register', "비밀번호")) return;
	else if (!formBlankCheck($('#m_pw_check_register'), "비밀번호 확인을")) return;
	else if (!passwordCheck("#m_pw_register", "#m_pw_check_register")) return;
	else if (!formBlankCheck($('#m_name_register'), "이름을")) return;
	else if (!inputVerify(2, '#m_name_register', "이름")) return;
	else if (!radioBlankCheck("input:radio[id='m_gender_register']", "성별을")) return;
	else if (!formBlankCheck($('#m_phone_register'), "핸드폰 번호를")) return;
	else if (!inputVerify(3, '#m_phone_register', "핸드폰 번호")) return;
	else if (!formBlankCheck($('#m_email_register'), "E-mail을")) return;
	else if (!inputVerify(4, '#m_email_register', "E-mail")) return;
	else if (!formBlankCheck($('#m_birth_register'), "생년월일을")) return;
	else {
		// 이메일 광고 수신 동의 여부에 체크되어 있으면 1(true)로 변경 (기본값은 0)
		
		
		$("#memberInsertForm").attr({
			"method" : "post",
			"action" : "/member/join"
		});
		$("#memberInsertForm").submit();
	}
}

/* 아이디 찾기, 비밀번호 찾기 창 전환 함수 
class 변경을 통해 display none을 변경	*/
function changeNone(find) {
	/*class 변경*/
	if(find == 'findid'){
		$('.findpw').addClass('none')
		$('.findid').removeClass('none')
		$('#findid_tab').addClass('active')
		$('#findpw_tab').removeClass('active')
	} else if(find == 'findpw'){
		$('.findid').addClass('none')
		$('.findpw').removeClass('none')
		$('#findpw_tab').addClass('active')
		$('#findid_tab').removeClass('active')
	}
}


/* 회원 정보 수정 (공백, 유효성 검사) */
function updateMember() {
	//입력값 체크 // 아이디 중복 체크도 넣어야함.
	if (!formBlankCheck($('#m_pw_update'), "비밀번호를")) return;
	else if (!inputVerify(1, '#m_pw_update', "비밀번호")) return;
	else if (!formBlankCheck($('#m_pw_check_update'), "비밀번호 확인을")) return;
	else if (!passwordCheck("#m_pw_update", "#m_pw_check_update")) return;
	else if (!formBlankCheck($('#m_phone_update'), "핸드폰 번호를")) return;
	else if (!inputVerify(3, '#m_phone_update', "핸드폰 번호")) return;
	else if (!formBlankCheck($('#m_email_update'), "E-mail을")) return;
	else if (!inputVerify(4, '#m_email_update', "E-mail")) return;
	else {
		$("#memberUpdateForm").attr({
			"method" : "post",
			"action" : "/member/update"
		});
		$("#memberUpdateForm").submit();
	}
}
/* ====== member.js (로그인, 회원가입, 찾기, 수정) end ===== */

/* 회원탈퇴 */
function secede(){
	if (!formBlankCheck($('#m_id_login'), '아이디를')) return;
	else if (!formBlankCheck($('#m_pw_login'), "비밀번호를")) return;
	else {
		$("#loginForm").attr({
			"method" : "post",
			"action" : "/login/login"
		});
		
		$("#loginForm").submit();
	}
}
/* ====== member.js (회원탈퇴) end ===== */




/*================= 자동 실행 함수 =====================*/
$(function(){
	/* 이용약관 전체 체크 */ 
	$(".terms_checkbox_group").on("click", "#check_all_terms", function () {
		var checked = $(this).is(":checked");

		if(checked){
			$(this).parents(".terms_checkbox_group").find('input').prop("checked", true);
		} else {
			$(this).parents(".terms_checkbox_group").find('input').prop("checked", false);
		}
	});
	
	/* 체크박스 개별 체크에 따른, 이용약관 전체 체크 변경 */
	$(".terms_checkbox_group").on("click", ".terms_nomal", function() {
		var is_checked = true;

		$(".terms_checkbox_group .terms_nomal").each(function(){
			is_checked = is_checked && $(this).is(":checked");
		});

		$("#check_all_terms").prop("checked", is_checked);
	});




	/* login modal 열기*/
	$("#open_login_modal").click(function(){
		$('#login_modal').attr("style", "display:block");
	});

	/*아이디, 비밀번호 찾기 modal 열기*/
	$("#open_search_id_pw_modal").click(function(){	
		$('#login_modal').attr("style", "display:none");
		$('#search_id_pw_modal').attr("style", "display:block");
	});

	/* 회원 가입창 modal 열기*/
	$("#open_register_modal").click(function(){
		$('#register_modal').attr("style", "display:block");
	});

	/* 로그인창에서 회원 가입창 modal 열기*/
	$("#open_register_modal_2").click(function(){	
		$('#login_modal').attr("style", "display:none");
		$('#register_modal').attr("style", "display:block");
	});

	/*회원 가입- 약관동의 modal 열기*/
	$("#open_terms_modal").click(function(){
		$('#register_modal').attr("style", "display:none");
		$('#terms_modal').attr("style", "display:block");				
	});


	/*회원정보 수정 폼  modal 열기*/
	$("#modify_btn").click(function(){
		$('#update_form_modal').attr("style", "display:block");
	});

	/*회원탈퇴 폼  modal 열기*/
	$("#secede_btn").click(function(){
		$('#delete_form_modal').attr("style", "display:block");
	});
	
	/*회원탈퇴 폼 아니요 버튼 modal닫기*/
	$("#modal_delete_cancle").click(function(){
		$('.modal').attr("style", "display:none");
	});
	
	/*modal 창의 우상단 버튼을 누를 때 모달창 닫기*/
	$(".modal_close_btn_x").click(function(){
		$('.modal').attr("style", "display:none");
	});  

	/*modal 창 밖을 누를 때 모달 창 닫기*/
	$(".modal_layer").click(function(){
		$('.modal').attr("style", "display:none");
	});  



});
/*================= 자동 실행 함수 end=====================*/