<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="header_div" style="width: 1260px; height: 100%; margin: 0 auto;">
	<div id="logo">
		<a href="/" class="logo">Party&amp;Game</a>
	</div>
	<div id="header_menu">
		<ul>
			<li class="menu_li"><a href="/#about" id="about_btn">ABOUT</a></li>
			<li class="menu_li"><a href="/#rooms" id="rooms_btn">ROOMS</a></li>
			<li class="menu_li"><a href="/#event" id="event_btn">EVENT</a></li>
			<li class="menu_li"><a href="/#service" id="service_btn">SERVICE</a></li>
		</ul>
	</div>
	<div id="member">
		<ul>
			<c:choose>
				<c:when test="${loginSession.m_Id == 'admin'}">
					<li><a href="${pageContext.request.contextPath}/logout"><button class="member_li" id="logout">Logout</button></a></li>
					<li><a href="${pageContext.request.contextPath}/admin/manage/booking/bookingFullList"><button class="member_li" id="go_adminPage">Admin</button></a></li>
				</c:when>
				<c:when test="${loginSession.m_Id != null and loginSession.m_Id != ''}">
					<li><a href="${pageContext.request.contextPath}/logout"><button class="member_li" id="logout">Logout</button></a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/myinfo"><button class="member_li" id="go_myPage">MyPage</button></a></li>
				</c:when>
				<c:when test="${loginSession.m_Id == null or loginSession.m_Id == ''}">
					<li><button class="member_li" id="open_register_modal">Register</button></li>
					<li><button class="member_li" id="open_login_modal">Login</button></li>
				</c:when>
			</c:choose>
		</ul>
		<input type="hidden" id="m_id_session" value="${loginSession.m_Id }">
	</div>
</div>
<!-- Login Modal -->
<div class="modal" id="login_modal" tabindex="-1" aria-labelledby="login_form" aria-hidden="true">
	<div class="modal_container">
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>
		<div class="modal_header">
			<h2>로그인</h2>
		</div>
		<div class="modal_body">
			<form id="loginForm">
				<div class="input_form">
					<input class="modal_input" type="text" id="m_id_login" name="m_Id" placeholder="아이디" autocomplete='off'>
				</div>
				<div class="input_form">
					<input class="modal_input" type="password" id="m_pw_login" name="m_Pw" placeholder="비밀번호" autocomplete="off">
				</div>

				<!--session에 따라 체크표시 활성화 -->
				<label class="form-label">
					<input class="modal_checkbox" type="checkbox" name="auto_login" data-type="use" value="ok" checked="checked">
					<span class="agree_tit">로그인 상태유지</span>
				</label>
				<div class="modal_btn">
					<button class="modal_main_btn" type="button" onclick="loginCheck()"  >로그인</button>						
				</div>	
				<div class="modal_link">
					<a href="javascript:;" id="open_register_modal_2" style="float: left; padding: 16px 0 18px 0;">회원가입</a>		
					<a href="javascript:;" id="open_search_id_pw_modal" style="float: right; padding: 16px 0 18px 0;">아이디 · 비밀번호 찾기</a>
				</div>
			</form>
		</div>
	</div> 
	<div class="modal_layer"></div>
</div> <!-- Login Modal end -->

<!-- Register Modal -->
<div class="modal" id="register_modal" tabindex="-1" aria-labelledby="register_form" aria-hidden="true">
	<div class="modal_container">
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>
		<div class="modal_header">
			<h2>회원가입</h2>
		</div>
		<div class="modal_body mb-3">
			<button class="modal_main_btn" id="open_terms_modal">ID/PW 회원가입</button>
		</div>

	</div>
	<div class="modal_layer"></div>
</div> <!-- Register Modal end -->
<!-- Register 이용 약관 동의 Modal -->
<div class="modal" id="terms_modal" tabindex="-1" aria-labelledby="terms_check_form" aria-hidden="true">
	<div class="modal_container">
		
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>

		<div class="modal_header">
			<h2>약관동의</h2>
		</div>

		<div class="modal_body mb-4 mx-2">
			<div class="terms_checkbox_group">

				<!-- 전체 체크  -->
				<div class="form-group mb-4">
					<input class="modal_checkbox" type="checkbox" id="check_all_terms" value="ok" onclick="">
					<label class="agree_tit" for="check_all_terms" ><strong>모두 동의합니다.</strong></label>
				</div>

				<!-- 이용약관 동의 체크 -->
				<div class="form-group mb-2">
					<input class="modal_checkbox terms_nomal" type="checkbox" value="ok" id="policy_agree_term">
					<label class="agree_tit" for="policy_agree_term">이용약관 동의 <strong class="emphasis">(필수)</strong></label>
				</div>
					<div tabindex="0" class="terms mb-4">
						제1조 목적<br>
						<br>
						본 이용약관은 “파티 앤 게임즈”(이하 "사이트")의 서비스의 이용조건과 운영에 관한 제반사항 규정을 목적으로 합니다.<br>
						<br>
						제2조 용어의 정의<br>
						<br>
						본 약관에서 사용되는 주요한 용어의 정의는 다음과 같습니다.<br>
						<br>
						① 회원 : 사이트의 약관에 동의하고 개인정보를 제공하여 회원등록을 한 자로서, 사이트와의 이용계약을 체결하고 사이트를 이용하는 이용자를 말합니다.<br>
						② 이용계약 : 사이트 이용과 관련하여 사이트와 회원간에 체결 하는 계약을 말합니다.<br>
						③ 회원 아이디(이하 "ID") : 회원의 식별과 회원의 서비스 이용을 위하여 회원별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.<br>
						④ 비밀번호 : 회원이 부여받은 ID와 일치된 회원임을 확인하고 회원의 권익보호를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다.<br>
						⑤ 운영자 : 서비스에 홈페이지를 개설하여 운영하는 운영자를 말합니다.<br>
						⑥ 해지 : 회원이 이용계약을 해약하는 것을 말합니다.<br>
						<br>
						제3조 약관외 준칙<br>
						<br>
						운영자는 필요한 경우 별도로 운영정책을 공지 안내할 수 있으며, 본 약관과 운영정책이 중첩될 경우 운영정책이 우선 적용됩니다.<br>
						<br>
						제4조 이용계약 체결<br>
						<br>
						① 이용계약은 회원으로 등록하여 사이트를 이용하려는 자의 본 약관 내용에 대한 동의와 가입신청에 대하여 운영자의 이용승낙으로 성립합니다.<br>
						② 회원으로 등록하여 서비스를 이용하려는 자는 사이트 가입신청시 본 약관을 읽고 아래에 있는 "동의합니다"를 선택하는 것으로 본 약관에 대한 동의 의사 표시를 합니다.<br>
						<br>
						제5조 서비스 이용 신청<br>
						<br>
						① 회원으로 등록하여 사이트를 이용하려는 이용자는 사이트에서 요청하는 제반정보(이용자ID,비밀번호, 닉네임 등)를 제공해야 합니다.<br>
						② 타인의 정보를 도용하거나 허위의 정보를 등록하는 등 본인의 진정한 정보를 등록하지 않은 회원은 사이트 이용과 관련하여 아무런 권리를 주장할 수 없으며, 관계 법령에 따라 처벌 받을 수 있습니다.<br>
						<br>
						제6조 개인정보처리방침<br>
						<br>
						사이트 및 운영자는 회원가입시 제공한 개인정보 중 비밀번호를 가지고 있지 않으며 이와 관련된 부분은 사이트의 개인정보처리방침을 따릅니다.<br>
						운영자는 관계법령이 정하는 바에 따라 회원등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력을 합니다.<br>
						<br>
						회원의 개인정보보호에 관하여 관계법령 및 사이트가 정하는 개인정보처리방침에 정한 바에 따릅니다.<br>
						<br>
						단, 회원의 귀책사유로 인해 노출된 정보에 대해 운영자는 일체의 책임을 지지 않습니다.<br>
						운영자는 회원이 미풍양속에 저해되거나 국가안보에 위배되는 게시물 등 위법한 게시물을 등록 · 배포할 경우 관련기관의 요청이 있을시 회원의 자료를 열람 및 해당 자료를 관련기관에 제출할 수 있습니다.<br>
						<br>
						제7조 운영자의 의무<br>
						<br>
						① 운영자는 이용회원으로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 가급적빨리 처리하여야 합니다. 다만, 개인적인 사정으로 신속한 처리가 곤란한 경우에는 사후에공지 또는 이용회원에게 쪽지, 전자우편 등을 보내는 등 최선을 다합니다.<br>
						② 운영자는 계속적이고 안정적인 사이트 제공을 위하여 설비에 장애가 생기거나 유실된 때에는 이를 지체 없이 수리 또는 복구할 수 있도록 사이트에 요구할 수 있습니다. 다만, 천재지변 또는 사이트나 운영자에 부득이한 사유가 있는 경우, 사이트 운영을 일시 정지할 수 있습니다.<br>
						<br>
						제8조 회원의 의무<br>
						<br>
						① 회원은 본 약관에서 규정하는 사항과 운영자가 정한 제반규정, 공지사항 및 운영정책 등 사이트가 공지하는 사항 및 관계법령을 준수하여야 하며, 기타 사이트의 업무에 방해가 되는 행위, 사이트의 명예를 손상시키는 행위를 해서는 안됩니다.<br>
						② 회원은 사이트의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.<br>
						③ 이용고객은 아이디 및 비밀번호 관리에 상당한 주의를 기울여야 하며, 운영자나 사이트의 동의 없이 제3자에게 아이디를 제공하여 이용하게 할 수 없습니다.<br>
						④ 회원은 운영자와 사이트 및 제3자의 지적 재산권을 침해해서는 안됩니다.<br>
						<br>
						제9조 서비스 이용시간<br>
						<br>
						① 서비스 이용시간은 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 단, 사이트는 시스템 정기점검, 증설 및 교체를 위해 사이트가 정한 날이나 시간에 서비스를 일시중단 할 수 있으며 예정된 작업으로 인한 서비스 일시 중단은 사이트의 홈페이지에 사전에 공지하오니 수시로 참고하시길 바랍니다.<br>
						② 단, 사이트는 다음 경우에 대하여 사전 공지나 예고없이 서비스를 일시적 혹은 영구적으로 중단할 수 있습니다.<br>
						- 긴급한 시스템 점검, 증설, 교체, 고장 혹은 오동작을 일으키는 경우<br>
						- 국가비상사태, 정전, 천재지변 등의 불가항력적인 사유가 있는 경우<br>
						- 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지한 경우<br>
						- 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우<br>
						③ 전항에 의한 서비스 중단의 경우 사이트는 사전에 공지사항 등을 통하여 회원에게 통지 합니다. 단, 사이트가 통제할 수 없는 사유로 발생한 서비스의 중단에 대하여 사전공지가 불가능한 경우에는 사후공지로 대신합니다.<br>
						<br>
						제10조 서비스 이용 해지<br>
						<br>
						① 회원이 사이트와의 이용계약을 해지하고자 하는 경우에는 회원 본인이 온라인을 통하여 등록해지신청을 하여야 합니다. 한편, 사이트 이용해지와 별개로 사이트에 대한 이용계약 해지는 별도로 하셔야 합니다.<br>
						② 해지신청과 동시에 사이트가 제공하는 사이트 관련 프로그램이 회원관리 화면에서 자동적으로 삭제됨으로 운영자는 더 이상 해지신청자의 정보를 볼 수 없습니다.<br>
						<br>
						제11조 서비스 이용 제한<br>
						<br>
						회원은 다음 각 호에 해당하는 행위를 하여서는 아니되며 해당 행위를 한 경우에 사이트는 회원의 서비스 이용 제한 및 적법한 조치를 취할 수 있으며 이용계약을 해지하거나 기간을 정하여 서비스를 중지할 수 있습니다.<br>
						① 회원 가입시 혹은 가입 후 정보 변경시 허위 내용을 등록하는 행위<br>
						② 타인의 사이트 이용을 방해하거나 정보를 도용하는 행위<br>
						③ 사이트의 운영진, 직원 또는 관계자를 사칭하는 행위<br>
						④ 사이트, 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위<br>
						⑤ 다른 회원의 ID를 부정하게 사용하는 행위<br>
						⑥ 다른 회원에 대한 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위<br>
						⑦ 범죄와 결부된다고 객관적으로 판단되는 행위<br>
						⑧ 기타 관련 법령에 위배되는 행위<br>
						<br>
						제12조 게시물의 관리<br>
						<br>
						① 사이트의 게시물과 자료의 관리 및 운영의 책임은 운영자에게 있습니다. 운영자는 항상 불량 게시물 및 자료에 대하여 모니터링을 하여야 하며, 불량 게시물 및 자료를 발견하거나 신고를 받으면 해당 게시물 및 자료를 삭제하고 이를 등록한 회원에게 주의를 주어야 합니다.<br>
						한편, 이용회원이 올린 게시물에 대해서는 게시자 본인에게 책임이 있으니 회원스스로 본 이용약관에서 위배되는 게시물은 게재해서된 안됩니다.<br>
						② 정보통신윤리위원회 등 공공기관의 시정요구가 있는 경우 운영자는 회원의 사전동의 없이 게시물을 삭제하거나 이동 할 수 있습니다.<br>
						③ 불량게시물의 판단기준은 다음과 같습니다.<br>
						- 다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우<br>
						- 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우<br>
						- 불법복제 또는 해킹을 조장하는 내용인 경우<br>
						- 영리를 목적으로 하는 광고일 경우<br>
						- 범죄와 결부된다고 객관적으로 인정되는 내용일 경우<br>
						- 다른 이용자 또는 제3자와 저작권 등 기타 권리를 침해하는 경우<br>
						- 기타 관계법령에 위배된다고 판단되는 경우<br>
						④ 사이트 및 운영자는 게시물 등에 대하여 제3자로부터 명예훼손, 지적재산권 등의 권리 침해를 이유로 게시중단 요청을 받은 경우 이를 임시로 게시중단(전송중단)할 수 있으며, 게시중단 요청자와 게시물 등록자 간에 소송, 합의 기타 이에 준하는 관련기관의 결정 등이 이루어져 사이트에 접수된 경우 이에 따릅니다.<br>
						<br>
						제13조 게시물의 보관<br>
						<br>
						사이트 운영자가 불가피한 사정으로 본 사이트를 중단하게 될 경우, 회원에게 사전 공지를 하고 게시물의 이전이 쉽도록 모든 조치를 취하기 위해 노력합니다.<br>
						<br>
						제14조 게시물에 대한 저작권<br>
						<br>
						① 회원이 사이트 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 또한 사이트는 게시자의 동의 없이 게시물을 상업적으로 이용할 수 없습니다. 다만 비영리 목적인 경우는 그러하지 아니하며, 또한 서비스 내의 게재권을 갖습니다.<br>
						② 회원은 서비스를 이용하여 취득한 정보를 임의 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.<br>
						③ 운영자는 회원이 게시하거나 등록하는 사이트 내의 내용물, 게시 내용에 대해 제12조 각 호에 해당된다고 판단되는 경우 사전통지 없이 삭제하거나 이동 또는 등록 거부할 수 있습니다.<br>
						<br>
						제15조 손해배상<br>
						<br>
						① 본 사이트의 발생한 모든 민,형법상 책임은 회원 본인에게 1차적으로 있습니다.<br>
						② 본 사이트로부터 회원이 받은 손해가 천재지변 등 불가항력적이거나 회원의 고의 또는 과실로 인하여 발생한 때에는 손해배상을 하지 하지 않습니다.<br>
						<br>
						제16조 면책<br>
						<br>
						① 운영자는 회원이 사이트의 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.<br>
						② 운영자는 본 사이트의 서비스 기반 및 타 통신업자가 제공하는 전기통신서비스의 장애로 인한 경우에는 책임이 면제되며 본 사이트의 서비스 기반과 관련되어 발생한 손해에 대해서는 사이트의 이용약관에 준합니다<br>
						③ 운영자는 회원이 저장, 게시 또는 전송한 자료와 관련하여 일체의 책임을 지지 않습니다.<br>
						④ 운영자는 회원의 귀책사유로 인하여 서비스 이용의 장애가 발생한 경우에는 책임지지 아니합니다.<br>
						⑤ 운영자는 회원 상호간 또는 회원과 제3자 상호간, 기타 회원의 본 서비스 내외를 불문한 일체의 활동(데이터 전송, 기타 커뮤니티 활동 포함)에 대하여 책임을 지지 않습니다.<br>
						⑥ 운영자는 회원이 게시 또는 전송한 자료 및 본 사이트로 회원이 제공받을 수 있는 모든 자료들의 진위, 신뢰도, 정확성 등 그 내용에 대해서는 책임지지 아니합니다.<br>
						⑦ 운영자는 회원 상호간 또는 회원과 제3자 상호간에 서비스를 매개로 하여 물품거래 등을 한 경우에 그로부터 발생하는 일체의 손해에 대하여 책임지지 아니합니다.<br>
						⑧ 운영자는 시삽의 귀책사유 없이 회원간 또는 회원과 제3자간에 발생한 일체의 분쟁에 대하여 책임지지 아니합니다.<br>
						⑨ 운영자는 서버 등 설비의 관리, 점검, 보수, 교체 과정 또는 소프트웨어의 운용 과정에서 고의 또는 고의에 준하는 중대한 과실 없이 발생할 수 있는 시스템의 장애, 제3자의 공격으로 인한 시스템의 장애, 국내외의 저명한 연구기관이나 보안관련 업체에 의해 대응방법이 개발되지 아니한 컴퓨터 바이러스 등의 유포나 기타 운영자가 통제할 수 없는 불가항력적 사유로 인한 회원의 손해에 대하여 책임지지 않습니다.<br>
						<br>
						부칙<br>
						<br>
						이 약관은 2021. 6. 10 부터 시행합니다.
					</div>
				<!-- 개인정보 수집 및 이용 동의 체크 -->
				<div class="form-group mb-2">				
					<input class="modal_checkbox terms_nomal" type="checkbox" value="ok" id="privacy_agree_privacy_term">
					<label class="agree_tit" for="privacy_agree_privacy_term" >개인정보 수집 및 이용 <strong class="emphasis">(필수)</strong></label>
				</div>
					<div tabindex="0" class="terms mb-4">
						<strong>1. 개인정보 수집목적 및 이용목적</strong><br>
						<br>
						(1) 홈페이지 회원 가입 및 관리<br>
						회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보 처리시 법정대리인의 동의여부 확인, 각종 고지․통지, 고충처리 등의 목적<br>
						<br>
						(2) 재화 또는 서비스 제공<br>
						물품배송, 서비스 제공, 안내 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 요금결제 및 정산 등의 목적<br>
						<br>
						(3) 고충처리<br>
						민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리결과 통보 등<br>
						<br>
						<strong>2. 수집하는 개인정보 항목</strong><br>
						ID, 성명, 비밀번호, 주소, 휴대폰번호, 이메일, 생년월일<br>
						<br>
						<strong>3. 개인정보 보유 및 이용기간</strong><br>
						<strong>회원탈퇴 시까지</strong> (단, 관계 법령에 보존 근거가 있는 경우 해당 기간 시까지 보유, 개인정보처리방침에서 확인 가능)
					</div>
				<!-- 마케팅 활용 동의 및 광고 수신 동의-->
				<div class="form-group">
					<span class="agree_tit">마케팅 활용 동의 및 광고 수신 동의</span>		
					<div tabindex="0" class="terms_other" style="font-size: 0.857em;">
						서비스와 관련된 소식, 이벤트 안내, 고객 혜택 등 다양한 정보를 제공합니다.	
					</div>
					<div class="form-label mb-2">
						<input class="modal_checkbox terms_nomal" type="checkbox" value='1'  id="m_email_margetring_register_term" name="m_Email_Marketing" value="ok">
						<label class="agree_tit" for="m_email_margetring_register_term" >E-Mail 수신 동의 (선택)</label>
					</div>
				</div>
				<button class="modal_main_btn" id="open_register_form_modal" type="button" onclick="termsCheck()" > 회원정보 입력하기 </button>
			</div>
		</div>
	</div>
	<div class="modal_layer"></div>
</div><!-- Register 이용 약관 동의 Modal end -->
<!-- Register inform Modal -->
<div class="modal" id="register_form_modal" tabindex="-1" aria-labelledby="register_inform_form" aria-hidden="true">
	<div class="modal_container">
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>
		<div class="modal_header">
			<h2>회원가입</h2>
		</div>
		<div class="modal_body mx-2">
			<form id="memberInsertForm">

				<!-- 아이디 / 비밀번호 -->
				<div class="form-group mb-3"> 아이디 / 비밀번호 <strong class="emphasis">(필수)</strong>
					<input class="modal_input mb-1" type="text" id="m_id_register" name="m_Id" placeholder="아이디, 영문자/숫자 (8-20자)	" autocomplete='off'>
					<input class="modal_input mb-1" type="password" id="m_pw_register" name="m_Pw" placeholder="비밀번호, 영문자/숫자/특수문자 (8-20자) " autocomplete='off'>
					<input class="modal_input" type="password" id="m_pw_check_register" placeholder="비밀번호 확인" autocomplete='off'>				
				</div>

				<!-- 이름 -->
				<div class="form-group mb-3">
					<label class="form-label" style="width: 100%"> 이름 <strong class="emphasis">(필수)</strong>
						<input class="modal_input mb-2" type="text" id="m_name_register" name="m_Name" placeholder="이름" autocomplete='off'>
					</label>
				</div>

				<!-- 성별 -->
				<div class="form-group mb-3"> 성별 <strong class="emphasis">(필수)</strong> <br>
					<label class="form-label">
						<input type="radio" id="m_gender_register" name="m_Gender" value="m">
						<span>남자</span>
					</label> &nbsp;
					<label class="form-label">
						<input type="radio" id="m_gender_register" name="m_Gender" value="f">
						<span>여자</span>
					</label>
				</div>

				<!-- 연락처 -->
				<div class="form-group mb-3">
					<label class="form-label" style="width: 100%"> 핸드폰 번호 <strong class="emphasis">(필수)</strong>
						<input class="modal_input" type="tel" id="m_phone_register" name="m_Phone" placeholder="핸드폰 번호" autocomplete='off'>
					</label>
				</div>

				<!-- 이메일 -->
				<div class="form-group mb-3">
					<label class="form-label" style="width: 100%"> E-mail <strong class="emphasis">(필수)</strong>
						<input class="modal_input" type="email" id="m_email_register" name="m_Email" placeholder="E-mail" autocomplete='off'>
						<input class="modal_input" type="hidden" value='0' id="m_email_margetring_register" name="m_Email_Marketing">
					</label>
				</div>

				<!-- 생년월일 -->
				<div class="form-group mb-3">
					<label class="form-label" style="width: 100%"> 생년월일 <strong class="emphasis">(필수)</strong>
						<input class="modal_input" type="date" id="m_birth_register" name="m_Birth">
					</label>
				</div>

				<button class="modal_main_btn" type="button" onclick="joinMember()"> 가입하기 </button>
			</form>
		</div>
	</div>
	<div class="modal_layer"></div>
</div> <!-- Register form Modal end -->

<!-- search id & pw Modal -->
<div class="modal" id="search_id_pw_modal" tabindex="-1" aria-labelledby="search_id_pw_form" aria-hidden="true">
	<div class="modal_container">
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>
		<div class="modal_header">
			<h3 class="findid">아이디 찾기 </h3>
			<h3 class="findpw none">비밀번호 찾기 </h3>
		</div>
		<div class="modal_body mx-2">
			<div class="wrap_tab mb-3" style="text-align: center;">
				<button type="button" class="btn btn_find active" onclick="changeNone('findid')" id="findid_tab" tabindex="0">아이디 찾기</button>
				<button type="button" class="btn btn_find" onclick="changeNone('findpw')" id="findpw_tab" tabindex="0">비밀번호 찾기</button>
			</div>	
			<form>
				<!-- 아이디 찾기 (이메일) -->
				<div class="form-group findid mb-2"> 
					<label class="form-label" style="width: 100%"> 이메일로 아이디 찾기
						<input class="modal_input" type="email" id="m_email_find" name="m_Email" placeholder="E-mail">
					</label>
				</div>	
				<!-- 비밀번호 찾기 (이메일) -->
				<div class="form-group findpw mb-2 none" > 
					<label class="form-label" style="width: 100%"> 아이디로 비밀번호 찾기
						<input class="modal_input" type="text" id="m_id_find" name="m_Id" placeholder="가입한 아이디">
					</label>	
				</div>		
				<div class="modal_btn">
					<button class="modal_main_btn findid" type="button" onclick="findIdPw('id')" > 아이디 찾기 </button>
					<button class="modal_main_btn findpw none" type="button" onclick="findIdPw('pw')" > 비밀번호 찾기 </button>
				</div>	
			</form>
		</div>
	</div>
	<div class="modal_layer"></div>
</div> <!-- search id & pw Modal end -->
<!-- 회원정보 수정을 위한 비밀번호 확인 -->
<div class="modal" id="update_form_modal" tabindex="-1" aria-labelledby="register_form" aria-hidden="true">
	<div class="modal_container">
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>

		<div class="modal_header">
			<h2>회원정보 수정</h2>
		</div>
		<div class="modal_body mb-3">
			<label class="form-label" style="width: 100%;"> 비밀번호를 입력 후 수정버튼을 눌러주세요.
					<input class="modal_input mb-1" type="password" id="m_pw_confirm" name="m_Pw" placeholder="비밀번호를 입력해주세요." autocomplete="off">	
			</label>		
			<div style="text-align: center">
				<button class="modal_main_btn" id="modal_confirm_password_update" style="width: 45%;">비밀번호 수정</button>
				<button class="modal_main_btn" id="modal_confirm_information_update" style="width: 45%;">개인정보 수정</button>
			</div>
		</div>
		
	</div>
	<div class="modal_layer"></div>
</div> <!-- 회원정보 수정을 위한 비밀번호 확인 end -->


<!-- 비밀번호 수정 -->
<div class="modal" id="update_pwform_modal" tabindex="-1" aria-labelledby="register_form" aria-hidden="true">
	<div class="modal_container">
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>

		<div class="modal_header">
			<h2>회원 비밀번호 수정</h2>
		</div>
		<div class="modal_body mb-3">
			<label class="form-label" style="width: 100%"> 기존의 비밀번호
				<input class="modal_input mb-1" type="password" id="m_pw_old_update" name="m_Pw_Old" placeholder="기존의 비밀번호" autocomplete="off"> 		
			</label>
			<br><br>
			<label class="form-label" style="width: 100%"> 수정할 비밀번호
				<input class="modal_input mb-1" type="password" id="m_pw_update" name="m_Pw" placeholder="변경할 비밀번호, 영문자/숫자/특수문자 (8-20자)" autocomplete="off">
				<input class="modal_input" type="password" id="m_pw_check_update" placeholder="비밀번호 확인">		
			</label>			
			<button class="modal_main_btn" id="modal_password_update">비밀번호 수정</button>
		</div>
		
	</div>
	<div class="modal_layer"></div>
</div> <!-- 비밀번호 수정 end -->

<!-- Member Information Update form Modal -->
<div class="modal" id="update_informationform_modal" tabindex="-1" aria-labelledby="register_inform_form" aria-hidden="true">
	<div class="modal_container">
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>
		<div class="modal_header">
			<h2>정보수정</h2>
		</div>
		<div class="modal_body mx-2">
			<form id="memberUpdateForm">
			
				<!-- 아이디  -->
			<div class="form-group mb-3"> 아이디 
				<input class="modal_input mb-1" type="text" id="m_id_update" name="m_Id" disabled>
			</div>

			<!-- 이름 -->
			<div class="form-group mb-3">
				<label class="form-label" style="width: 100%"> 이름 
					<input class="modal_input mb-2" type="text" id="m_name_update" name="m_Name" disabled>
				</label>
			</div>

			<!-- 성별 -->
			<div class="form-group mb-3"> 성별<br>			
				<label class="form-label">	
					<input type="radio" id="m_gender_update" name="m_Gender" value="m" disabled>
					<span>남성</span>
				</label> &nbsp;						
				<label class="form-label">
					<input type="radio" id="m_gender_update" name="m_Gender" value="f" disabled>
					<span>여성</span>
				</label>
			</div>

			<!-- 연락처 -->
			<div class="form-group mb-3">
				<label class="form-label" style="width: 100%"> 핸드폰 번호 <strong class="emphasis">(변경가능)</strong>
					<input class="modal_input" type="tel" id="m_phone_update" name="m_Phone" placeholder="핸드폰 번호 ('-' 제외)">
				</label>
			</div>

			<!-- 이메일 -->
			<div class="form-group mb-3">
				<label class="form-label" style="width: 100%"> E-mail <strong class="emphasis">(변경가능)</strong>
					<input class="modal_input" type="email" id="m_email_update" name="m_Email" placeholder="E-mail" autocomplete='off'>
				</label>
			</div>

			<!-- 생년월일 -->
			<div class="form-group mb-3">
				<label class="form-label" style="width: 100%"> 생년월일 
					<input class="modal_input" type="date" id="m_birth_update" name="m_Birth" disabled>
				</label>
			</div>
			<button class="modal_main_btn" type="button" id="member_information_update"> 회원정보 수정하기 </button>
			</form>
		</div>
	</div>
	<div class="modal_layer"></div>
</div> <!-- Member Information Update form Modal end -->
<!-- Delete Modal -->
<div class="modal" id="delete_form_modal" tabindex="-1" aria-labelledby="register_form" aria-hidden="true">
	<div class="modal_container">
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>

		<div class="modal_header">
			<h2>회원탈퇴</h2>
		</div>
		<p style="text-align: left; margin-left: 10px;">① 탈퇴하실 경우 모든 마일리지 포인트와 쿠폰은 <br>삭제되고 재가입 시 복구할 수 없습니다.</p>
		<p style="text-align: left; margin-left: 10px;">② 불·편법 행위 차단 등의 목적으로 탈퇴 후 3개월 <br>동안 회원님의 개인정보를 보관 후 파기합니다.</p>
		<p style="text-align: center; margin-top: 16px;">정말로 탈퇴하시겠습니까?</p>
		<div class="modal_body mb-3">
			<label class="form-label" style="width: 100%"> 비밀번호
					<input class="modal_input mb-1" type="password" id="m_pw_delete" name="m_Pw" placeholder="탈퇴하시려면 비밀번호를 입력해주세요." autocomplete="off">	
			</label>		
			<button class="modal_main_btn_yes" id="modal_delete" onclick="memberLeave()">예</button>
			<button class="modal_main_btn_no" id="modal_delete_cancle">아니요</button>
		</div>
		
	</div>
	<div class="modal_layer"></div>
</div> <!-- Delete Modal end -->
<!-- Reservation Modal -->
<div class="modal" id="reserv_form_modal" tabindex="-1" aria-labelledby="register_form" aria-hidden="true">
	<div class="modal_container">
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>

		<div class="modal_header">
			<h2>예약하기</h2>
		</div>
		<p style="text-align: left; margin-left: 10px;">① 회원 예약 시 총 결제금액에서 <span style="color:red;">10% 마일리지 적립 이벤트</span></p>
		<p style="text-align: left; margin-left: 10px;">② 회원 예약 시 총 결제금액에서 <span style="color:red;">5% 할인 이벤트</span></p>
		<div class="modal_body mb-3">
			<button class="modal_main_btn_yes" id="member_reserv_btn">회원예약</button>
			<button class="modal_main_btn_no" id="non_member_reserv_btn">비회원예약</button>
		</div>
		
	</div>
	<div class="modal_layer"></div>
</div> <!-- Reservation Modal end -->
<!-- footer 이용약관 Modal -->
<div class="modal" id="footer_terms" tabindex="-1" aria-labelledby="footer_terms_form" aria-hidden="true">
	<div class="modal_container" style="width: 450px;">
		
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>

		<div class="modal_header">
			<h2>이용약관</h2>
		</div>

		<div class="modal_body mb-4 mx-2">
			<div class="terms_checkbox_group">
				<div tabindex="0" class="terms mb-4" style="height: 600px;">
					제1조 목적<br>
					<br>
					본 이용약관은 “파티 앤 게임즈”(이하 "사이트")의 서비스의 이용조건과 운영에 관한 제반사항 규정을 목적으로 합니다.<br>
					<br>
					제2조 용어의 정의<br>
					<br>
					본 약관에서 사용되는 주요한 용어의 정의는 다음과 같습니다.<br>
					<br>
					① 회원 : 사이트의 약관에 동의하고 개인정보를 제공하여 회원등록을 한 자로서, 사이트와의 이용계약을 체결하고 사이트를 이용하는 이용자를 말합니다.<br>
					② 이용계약 : 사이트 이용과 관련하여 사이트와 회원간에 체결 하는 계약을 말합니다.<br>
					③ 회원 아이디(이하 "ID") : 회원의 식별과 회원의 서비스 이용을 위하여 회원별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.<br>
					④ 비밀번호 : 회원이 부여받은 ID와 일치된 회원임을 확인하고 회원의 권익보호를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다.<br>
					⑤ 운영자 : 서비스에 홈페이지를 개설하여 운영하는 운영자를 말합니다.<br>
					⑥ 해지 : 회원이 이용계약을 해약하는 것을 말합니다.<br>
					<br>
					제3조 약관외 준칙<br>
					<br>
					운영자는 필요한 경우 별도로 운영정책을 공지 안내할 수 있으며, 본 약관과 운영정책이 중첩될 경우 운영정책이 우선 적용됩니다.<br>
					<br>
					제4조 이용계약 체결<br>
					<br>
					① 이용계약은 회원으로 등록하여 사이트를 이용하려는 자의 본 약관 내용에 대한 동의와 가입신청에 대하여 운영자의 이용승낙으로 성립합니다.<br>
					② 회원으로 등록하여 서비스를 이용하려는 자는 사이트 가입신청시 본 약관을 읽고 아래에 있는 "동의합니다"를 선택하는 것으로 본 약관에 대한 동의 의사 표시를 합니다.<br>
					<br>
					제5조 서비스 이용 신청<br>
					<br>
					① 회원으로 등록하여 사이트를 이용하려는 이용자는 사이트에서 요청하는 제반정보(이용자ID,비밀번호, 닉네임 등)를 제공해야 합니다.<br>
					② 타인의 정보를 도용하거나 허위의 정보를 등록하는 등 본인의 진정한 정보를 등록하지 않은 회원은 사이트 이용과 관련하여 아무런 권리를 주장할 수 없으며, 관계 법령에 따라 처벌 받을 수 있습니다.<br>
					<br>
					제6조 개인정보처리방침<br>
					<br>
					사이트 및 운영자는 회원가입시 제공한 개인정보 중 비밀번호를 가지고 있지 않으며 이와 관련된 부분은 사이트의 개인정보처리방침을 따릅니다.<br>
					운영자는 관계법령이 정하는 바에 따라 회원등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력을 합니다.<br>
					<br>
					회원의 개인정보보호에 관하여 관계법령 및 사이트가 정하는 개인정보처리방침에 정한 바에 따릅니다.<br>
					<br>
					단, 회원의 귀책사유로 인해 노출된 정보에 대해 운영자는 일체의 책임을 지지 않습니다.<br>
					운영자는 회원이 미풍양속에 저해되거나 국가안보에 위배되는 게시물 등 위법한 게시물을 등록 · 배포할 경우 관련기관의 요청이 있을시 회원의 자료를 열람 및 해당 자료를 관련기관에 제출할 수 있습니다.<br>
					<br>
					제7조 운영자의 의무<br>
					<br>
					① 운영자는 이용회원으로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 가급적빨리 처리하여야 합니다. 다만, 개인적인 사정으로 신속한 처리가 곤란한 경우에는 사후에공지 또는 이용회원에게 쪽지, 전자우편 등을 보내는 등 최선을 다합니다.<br>
					② 운영자는 계속적이고 안정적인 사이트 제공을 위하여 설비에 장애가 생기거나 유실된 때에는 이를 지체 없이 수리 또는 복구할 수 있도록 사이트에 요구할 수 있습니다. 다만, 천재지변 또는 사이트나 운영자에 부득이한 사유가 있는 경우, 사이트 운영을 일시 정지할 수 있습니다.<br>
					<br>
					제8조 회원의 의무<br>
					<br>
					① 회원은 본 약관에서 규정하는 사항과 운영자가 정한 제반규정, 공지사항 및 운영정책 등 사이트가 공지하는 사항 및 관계법령을 준수하여야 하며, 기타 사이트의 업무에 방해가 되는 행위, 사이트의 명예를 손상시키는 행위를 해서는 안됩니다.<br>
					② 회원은 사이트의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.<br>
					③ 이용고객은 아이디 및 비밀번호 관리에 상당한 주의를 기울여야 하며, 운영자나 사이트의 동의 없이 제3자에게 아이디를 제공하여 이용하게 할 수 없습니다.<br>
					④ 회원은 운영자와 사이트 및 제3자의 지적 재산권을 침해해서는 안됩니다.<br>
					<br>
					제9조 서비스 이용시간<br>
					<br>
					① 서비스 이용시간은 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 단, 사이트는 시스템 정기점검, 증설 및 교체를 위해 사이트가 정한 날이나 시간에 서비스를 일시중단 할 수 있으며 예정된 작업으로 인한 서비스 일시 중단은 사이트의 홈페이지에 사전에 공지하오니 수시로 참고하시길 바랍니다.<br>
					② 단, 사이트는 다음 경우에 대하여 사전 공지나 예고없이 서비스를 일시적 혹은 영구적으로 중단할 수 있습니다.<br>
					- 긴급한 시스템 점검, 증설, 교체, 고장 혹은 오동작을 일으키는 경우<br>
					- 국가비상사태, 정전, 천재지변 등의 불가항력적인 사유가 있는 경우<br>
					- 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지한 경우<br>
					- 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우<br>
					③ 전항에 의한 서비스 중단의 경우 사이트는 사전에 공지사항 등을 통하여 회원에게 통지 합니다. 단, 사이트가 통제할 수 없는 사유로 발생한 서비스의 중단에 대하여 사전공지가 불가능한 경우에는 사후공지로 대신합니다.<br>
					<br>
					제10조 서비스 이용 해지<br>
					<br>
					① 회원이 사이트와의 이용계약을 해지하고자 하는 경우에는 회원 본인이 온라인을 통하여 등록해지신청을 하여야 합니다. 한편, 사이트 이용해지와 별개로 사이트에 대한 이용계약 해지는 별도로 하셔야 합니다.<br>
					② 해지신청과 동시에 사이트가 제공하는 사이트 관련 프로그램이 회원관리 화면에서 자동적으로 삭제됨으로 운영자는 더 이상 해지신청자의 정보를 볼 수 없습니다.<br>
					<br>
					제11조 서비스 이용 제한<br>
					<br>
					회원은 다음 각 호에 해당하는 행위를 하여서는 아니되며 해당 행위를 한 경우에 사이트는 회원의 서비스 이용 제한 및 적법한 조치를 취할 수 있으며 이용계약을 해지하거나 기간을 정하여 서비스를 중지할 수 있습니다.<br>
					① 회원 가입시 혹은 가입 후 정보 변경시 허위 내용을 등록하는 행위<br>
					② 타인의 사이트 이용을 방해하거나 정보를 도용하는 행위<br>
					③ 사이트의 운영진, 직원 또는 관계자를 사칭하는 행위<br>
					④ 사이트, 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위<br>
					⑤ 다른 회원의 ID를 부정하게 사용하는 행위<br>
					⑥ 다른 회원에 대한 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위<br>
					⑦ 범죄와 결부된다고 객관적으로 판단되는 행위<br>
					⑧ 기타 관련 법령에 위배되는 행위<br>
					<br>
					제12조 게시물의 관리<br>
					<br>
					① 사이트의 게시물과 자료의 관리 및 운영의 책임은 운영자에게 있습니다. 운영자는 항상 불량 게시물 및 자료에 대하여 모니터링을 하여야 하며, 불량 게시물 및 자료를 발견하거나 신고를 받으면 해당 게시물 및 자료를 삭제하고 이를 등록한 회원에게 주의를 주어야 합니다.<br>
					한편, 이용회원이 올린 게시물에 대해서는 게시자 본인에게 책임이 있으니 회원스스로 본 이용약관에서 위배되는 게시물은 게재해서된 안됩니다.<br>
					② 정보통신윤리위원회 등 공공기관의 시정요구가 있는 경우 운영자는 회원의 사전동의 없이 게시물을 삭제하거나 이동 할 수 있습니다.<br>
					③ 불량게시물의 판단기준은 다음과 같습니다.<br>
					- 다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우<br>
					- 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우<br>
					- 불법복제 또는 해킹을 조장하는 내용인 경우<br>
					- 영리를 목적으로 하는 광고일 경우<br>
					- 범죄와 결부된다고 객관적으로 인정되는 내용일 경우<br>
					- 다른 이용자 또는 제3자와 저작권 등 기타 권리를 침해하는 경우<br>
					- 기타 관계법령에 위배된다고 판단되는 경우<br>
					④ 사이트 및 운영자는 게시물 등에 대하여 제3자로부터 명예훼손, 지적재산권 등의 권리 침해를 이유로 게시중단 요청을 받은 경우 이를 임시로 게시중단(전송중단)할 수 있으며, 게시중단 요청자와 게시물 등록자 간에 소송, 합의 기타 이에 준하는 관련기관의 결정 등이 이루어져 사이트에 접수된 경우 이에 따릅니다.<br>
					<br>
					제13조 게시물의 보관<br>
					<br>
					사이트 운영자가 불가피한 사정으로 본 사이트를 중단하게 될 경우, 회원에게 사전 공지를 하고 게시물의 이전이 쉽도록 모든 조치를 취하기 위해 노력합니다.<br>
					<br>
					제14조 게시물에 대한 저작권<br>
					<br>
					① 회원이 사이트 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 또한 사이트는 게시자의 동의 없이 게시물을 상업적으로 이용할 수 없습니다. 다만 비영리 목적인 경우는 그러하지 아니하며, 또한 서비스 내의 게재권을 갖습니다.<br>
					② 회원은 서비스를 이용하여 취득한 정보를 임의 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.<br>
					③ 운영자는 회원이 게시하거나 등록하는 사이트 내의 내용물, 게시 내용에 대해 제12조 각 호에 해당된다고 판단되는 경우 사전통지 없이 삭제하거나 이동 또는 등록 거부할 수 있습니다.<br>
					<br>
					제15조 손해배상<br>
					<br>
					① 본 사이트의 발생한 모든 민,형법상 책임은 회원 본인에게 1차적으로 있습니다.<br>
					② 본 사이트로부터 회원이 받은 손해가 천재지변 등 불가항력적이거나 회원의 고의 또는 과실로 인하여 발생한 때에는 손해배상을 하지 하지 않습니다.<br>
					<br>
					제16조 면책<br>
					<br>
					① 운영자는 회원이 사이트의 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.<br>
					② 운영자는 본 사이트의 서비스 기반 및 타 통신업자가 제공하는 전기통신서비스의 장애로 인한 경우에는 책임이 면제되며 본 사이트의 서비스 기반과 관련되어 발생한 손해에 대해서는 사이트의 이용약관에 준합니다<br>
					③ 운영자는 회원이 저장, 게시 또는 전송한 자료와 관련하여 일체의 책임을 지지 않습니다.<br>
					④ 운영자는 회원의 귀책사유로 인하여 서비스 이용의 장애가 발생한 경우에는 책임지지 아니합니다.<br>
					⑤ 운영자는 회원 상호간 또는 회원과 제3자 상호간, 기타 회원의 본 서비스 내외를 불문한 일체의 활동(데이터 전송, 기타 커뮤니티 활동 포함)에 대하여 책임을 지지 않습니다.<br>
					⑥ 운영자는 회원이 게시 또는 전송한 자료 및 본 사이트로 회원이 제공받을 수 있는 모든 자료들의 진위, 신뢰도, 정확성 등 그 내용에 대해서는 책임지지 아니합니다.<br>
					⑦ 운영자는 회원 상호간 또는 회원과 제3자 상호간에 서비스를 매개로 하여 물품거래 등을 한 경우에 그로부터 발생하는 일체의 손해에 대하여 책임지지 아니합니다.<br>
					⑧ 운영자는 시삽의 귀책사유 없이 회원간 또는 회원과 제3자간에 발생한 일체의 분쟁에 대하여 책임지지 아니합니다.<br>
					⑨ 운영자는 서버 등 설비의 관리, 점검, 보수, 교체 과정 또는 소프트웨어의 운용 과정에서 고의 또는 고의에 준하는 중대한 과실 없이 발생할 수 있는 시스템의 장애, 제3자의 공격으로 인한 시스템의 장애, 국내외의 저명한 연구기관이나 보안관련 업체에 의해 대응방법이 개발되지 아니한 컴퓨터 바이러스 등의 유포나 기타 운영자가 통제할 수 없는 불가항력적 사유로 인한 회원의 손해에 대하여 책임지지 않습니다.<br>
					<br>
					부칙<br>
					<br>
					이 약관은 2021. 6. 10 부터 시행합니다.
				</div>
			</div>
		</div>
	</div>
	<div class="modal_layer"></div>
</div><!-- footer 이용약관 Modal end -->
<!-- footer 개인정보처리방침 Modal -->
<div class="modal" id="footer_privacy" tabindex="-1" aria-labelledby="footer_privacy_form" aria-hidden="true">
	<div class="modal_container" style="width: 450px;">
		
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>

		<div class="modal_header">
			<h2>개인정보처리방침</h2>
		</div>

		<div class="modal_body mb-4 mx-2">
			<div class="terms_checkbox_group">
				<div tabindex="0" class="terms mb-4" style="height: 600px;">
					파티 앤 게임즈 (이하 ‘회사’라 한다)<br>
					는 개인정보 보호법 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립․공개합니다.<br>
					<br>
					<strong>제1조 (개인정보의 처리목적)</strong><br>
					회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br>
					<br>
					1. 홈페이지 회원 가입 및 관리<br>
					회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․<br>
					관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보처리시 법정대리인의 동의여부 확인, 각종 고지․<br>
					통지, 고충처리 등을 목적으로 개인정보를 처리합니다.<br>
					<br>
					2. 재화 또는 서비스 제공<br>
					물품배송, 서비스 제공, 계약서․<br>
					청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금결제․<br>
					정산, 채권추심 등을 목적으로 개인정보를 처리합니다.<br>
					<br>
					3. 고충처리<br>
					민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․<br>
					통지, 처리결과 통보 등의 목적으로 개인정보를 처리합니다.<br>
					<br>
					<strong>제2조 (개인정보의 처리 및 보유기간)</strong><br>
					① 회사는 법령에 따른 개인정보 보유․<br>
					이용기간 또는 정보주체로부터 개인정보를 수집시에 동의받은 개인정보 보유․<br>
					이용기간 내에서 개인정보를 처리․보유합니다․<br>
					② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br>
					<br>
					1. 홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴시까지<br>
					다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료시까지<br>
					1) 관계 법령 위반에 따른 수사․조사 등이 진행중인 경우에는 해당 수사․조사 종료시까지<br>
					2) 홈페이지 이용에 따른 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지<br>
					<br>
					2. 재화 또는 서비스 제공 : 재화․서비스 공급완료 및 요금결제․정산 완료시까지<br>
					<br>
					다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료시까지<br>
					1) 「전자상거래 등에서의 소비자 보호에 관한 법률」에 따른 표시․<br>
					광고, 계약내용 및 이행 등 거래에 관한 기록<br>
					- 표시․광고에 관한 기록 : 6월<br>
					- 계약 또는 청약철회, 대금결제, 재화 등의 공급기록 : 5년<br>
					- 소비자 불만 또는 분쟁처리에 관한 기록 : 3년<br>
					2) 「통신비밀보호법」제41조에 따른 통신사실확인자료 보관<br>
					- 가입자 전기통신일시, 개시․종료시간, 상대방 가입자번호, 사용도수, 발신기지국 위치추적자료 : 1년<br>
					- 컴퓨터통신, 인터넷 로그기록자료, 접속지 추적자료 : 3개월<br>
					<br>
					<strong>제3조(이용자 및 법정대리인의 권리와 그 행사방법)</strong><br>
					<br>
					① 정보주체는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.<br>
					1. 개인정보 열람요구<br>
					2. 오류 등이 있을 경우 정정 요구<br>
					3. 삭제요구<br>
					4. 처리정지 요구<br>
					② 제1항에 따른 권리 행사는 회사에 대해 서면, 전화, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체없이 조치하겠습니다.<br>
					③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 회사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.<br>
					④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br>
					⑤ 정보주체는 개인정보 보호법 등 관계법령을 위반하여 회사가 처리하고 있는 정보주체 본인이나 타인의 개인정보 및 사생활을 침해하여서는 아니됩니다.<br>
					<br>
					<strong>제4조(처리하는 개인정보 항목)</strong><br>
					회사는 다음의 개인정보 항목을 처리하고 있습니다.<br>
					<br>
					1. 홈페이지 회원 가입 및 관리<br>
					필수항목 : 성명, 아이디, 비밀번호, 전화번호, 성별, 이메일주소<br>
					선택항목 : 생년월일<br>
					<br>
					2. 재화 또는 서비스 제공<br>
					필수항목 : 성명, 아이디, 전화번호, 이메일주소, 결제정보<br>
					선택항목 : 과거 구매내역<br>
					<br>
					3. 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.<br>
					IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등<br>
					<br>
					<strong>제5조(개인정보의 파기)</strong><br>
					① 회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.<br>
					② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.<br>
					③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.<br>
					1. 파기절차<br>
					회사는 파기 사유가 발생한 개인정보를 선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.<br>
					2. 파기방법<br>
					회사는 전자적 파일 형태로 기록․저장된 개인정보는 기록을 재생할 수 없도록 로우레밸포멧(Low Level Format) 등의 방법을 이용하여 파기하며, 종이 문서에 기록․저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.<br>
					<br>
					<strong>제6조(개인정보의 안전성 확보조치)</strong><br>
					회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.<br>
					1. 관리적 조치 : 내부관리계획 수립․시행, 정기적 직원 교육 등<br>
					2. 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보<br>
					등의 암호화, 보안프로그램 설치<br>
					3. 물리적 조치 : 전산실, 자료보관실 등의 접근통제<br>
					<br>
					<strong>제7조(개인정보 자동 수집 장치의 설치∙운영 및 거부에 관한 사항)</strong><br>
					① 회사는 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.<br>
					② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.<br>
					가. 쿠키의 사용목적: 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.<br>
					나. 쿠키의 설치∙운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.<br>
					다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.<br>
					<br>
					<strong>제8조(권익침해 구제방법)</strong><br>
					정보주체는 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다.<br>
					<br>
					▶ 개인정보 침해신고센터 (한국인터넷진흥원 운영)<br>
					- 소관업무 : 개인정보 침해사실 신고, 상담 신청<br>
					- 홈페이지 : privacy.kisa.or.kr<br>
					- 전화 : (국번없이) 118<br>
					- 주소 : (58324) 전남 나주시 진흥길 9(빛가람동 301-2) 3층 개인정보침해신고센터<br>
					<br>
					▶ 개인정보 분쟁조정위원회<br>
					- 소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)<br>
					- 홈페이지 : www.kopico.go.kr<br>
					- 전화 : (국번없이) 1833-6972<br>
					- 주소 : (03171)서울특별시 종로구 세종대로 209 정부서울청사 4층<br>
					<br>
					▶ 대검찰청 사이버범죄수사단 : 02-3480-3573 (www.spo.go.kr)<br>
					▶ 경찰청 사이버안전국 : 182 (http://cyberbureau.police.go.kr)<br>
					<br>
					<strong>제9조(개인정보 처리방침 시행 및 변경)</strong><br>
					이 개인정보 처리방침은 2020. 6. 10 부터 적용됩니다.
				</div>
			</div>
		</div>
	</div>
	<div class="modal_layer"></div>
</div><!-- footer 개인정보처리방침 Modal end -->
<!-- 리뷰작성 -->
<div class="modal" id="review_form_modal" tabindex="-1" aria-labelledby="review_form" aria-hidden="true">
	<div class="modal_container" style="width: 700px; height: 600px;">
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>
		
		<div class="modal_header">
			<h2>리뷰 작성</h2>
		</div>
		
		<div class="modal_body">
			<form id="reviewInsertForm">		
				<div>
					예약번호 : <span id="b_no_rv"></span><br>
					방ㅤ이름 : <span id="r_name_rv"></span><br>
					사용날짜 : <span id="b_date_rv"></span><br>
				</div>
				
				<div class="review_star_container" data-star="" data-text="최고">
					<span>점수를 남겨주세요.</span><br>
			        <span class="review_star_content">			        	
	                    <input class="review_modify_star_content_value review_modify_star_btn_nonactive" type="button" value="1" data-text="나쁨"></input>
	                    <input class="review_modify_star_content_value review_modify_star_btn_nonactive" type="button" value="2" data-text="별로"></input>
	                    <input class="review_modify_star_content_value review_modify_star_btn_nonactive" type="button" value="3" data-text="보통"></input>
	                    <input class="review_modify_star_content_value review_modify_star_btn_nonactive" type="button" value="4" data-text="좋음"></input>
	                    <input class="review_modify_star_content_value review_modify_star_btn_nonactive" type="button" value="5" data-text="최고"></input>	                    
					</span>
					<span class="review_modify_star_content_value_text"></span>
					<input type="hidden" id="rv_grade_insert" name="rv_Grade" >
			    </div>						
				<textarea class="rv_content_area" id="rv_content_insert" name="rv_Content" ></textarea> 										
			</form>
			
			<div class="form_bottom">
				<button class="common_btn" id="review_insert_btn" >등록</button>
			</div>			
		</div>
		
	</div> 
	<div class="modal_layer"></div>
	
	<script>
	$(document).ready(function() {
	    $('#rv_content_insert').summernote(setting_review);
	});
	</script>
	
</div> <!-- 리뷰작성 end -->



<!-- 리뷰수정 -->
<div class="modal" id="review_modify_form_modal" tabindex="-1" aria-labelledby="review_form" aria-hidden="true">
	<div class="modal_container" style="width: 700px; height: 600px;">
		<button type="button" id="close_login_modal" class="modal_close_btn_x" aria-label="Close" ><img class="x_button" src="/resources/image/x-button.png" alt="Close"></button>
		
		<div class="modal_header">
			<h2>리뷰 수정</h2>
		</div>
		
		<div class="modal_body">
			<form id="reviewUpdateForm">		
				<div>
					예약번호 : <span id="b_no_rv_update"></span><br>
					방ㅤ이름 : <span id="r_name_rv_update"></span><br>
					사용날짜 : <span id="b_date_rv_update"></span><br>
				</div>
				
				<div class="review_star_container" data-star="" data-text="최고">
					<span>점수를 남겨주세요.</span><br>
			        <span class="review_star_content">			        	
	                    <input class="review_modify_star_content_value review_modify_star_btn_nonactive" id="star_value_1" type="button" value="1" data-text="나쁨"></input>
	                    <input class="review_modify_star_content_value review_modify_star_btn_nonactive" id="star_value_2" type="button" value="2" data-text="별로"></input>
	                    <input class="review_modify_star_content_value review_modify_star_btn_nonactive" id="star_value_3" type="button" value="3" data-text="보통"></input>
	                    <input class="review_modify_star_content_value review_modify_star_btn_nonactive" id="star_value_4" type="button" value="4" data-text="좋음"></input>
	                    <input class="review_modify_star_content_value review_modify_star_btn_nonactive" id="star_value_5" type="button" value="5" data-text="최고"></input>	                    
					</span>
					<span class="review_modify_star_content_value_text"></span>
					<input type="hidden" id="rv_grade_update" name="rv_Grade" >
			    </div>						
				<textarea class="rv_content_area" id="rv_content_update" name="rv_Content" ></textarea> 										
			</form>
			
			<div class="form_bottom">
				<button class="common_btn" id="review_update_btn" >리뷰수정</button>
				<button class="common_btn" id="review_delete_btn" >리뷰삭제</button>
			</div>			
		</div>
		
	</div> 
	<div class="modal_layer"></div>
	
	<script>
		$(document).ready(function() {
			$('#rv_content_update').summernote(setting_review);
		});
	</script>
	
</div> <!-- 리뷰작성 end -->