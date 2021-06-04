/* === admin 회원 테이블 뷰 체인지(전체회원, 유효회원, 탈퇴/비활성회원) === */
function memberTableChange(e) {
	const value = e.value;
	window.location.href = '/admin/manage/member?category='+value;
}

/* === 회원 비활성화 === */
function memberDisable(m_Number, m_Id) {
	if(confirm('해당 회원을 비활성화 하시겠습니까?\n회원번호 : ' + m_Number +'\n회원 ID : ' + m_Id)){
		$.ajax({
 			url : "/admin/manage/member/disable",  
 			type : "post",
 			data : "m_Number="+m_Number+"&m_Id="+m_Id,
 			error : function(){  
 				alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
 			},
 			success : function(resultData){ 
 				if (resultData != '1') { 
	 				alert('회원 비활성화에 실패했습니다.\n다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
	 			} else if (resultData=='1') { 
	 				alert('회원을 비활성화했습니다.');
 					window.location.reload();
 				} 
 			}
 		});			
	}
}

/* === 탈퇴/비활성 회원 복구 === */
function memberEnable(m_Number, m_Id, status) {
	if(confirm('해당 회원을 복구 하시겠습니까?\n회원번호 : ' + m_Number +'\n회원 ID : ' + m_Id+'\n회원상태 : '+status)){
		$.ajax({
 			url : "/admin/manage/member/enable",  
 			type : "post",
 			data : "m_Number="+m_Number+"&m_Id="+m_Id,
 			error : function(){  
 				alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
 			},
 			success : function(resultData){ 
 				if (resultData!='1') { 
	 				alert('회원 복구에 실패했습니다.\n다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
	 			} else if (resultData=='1') { 
 					alert('회원을 복구했습니다.');
 					window.location.reload();
 				} 
 			}
 		});			
	}
}