package com.pag.client.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.login.dao.LoginDao;
import com.pag.client.login.vo.LoginVO;
import com.pag.client.mail.service.MailService;
import com.pag.client.mail.vo.MailVO;
import com.pag.client.member.dao.MemberDao;
import com.pag.client.member.vo.MemberVO;
import com.pag.common.util.Util;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao loginDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private MailService mailService;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// 로그인 비즈니스 로직
	@Override
	public LoginVO loginSelect(LoginVO lvo) {

		LoginVO nulLoginVO = new LoginVO(); // 로그인 실패시 반환용 더미 객체
		
		// 로그인 조회(암호화된 비밀번호, 아이디, 이름, 이메일, 탈퇴여부 리턴)
		LoginVO loginResult = loginDao.loginSelect(lvo.getM_Id());		
		
		// 탈퇴여부 확인, 비밀번호 일치여부 확인, 확인결과에 따라 pw에 결과를 담아서 리턴
		if (loginResult != null) { 
			if (loginResult.getM_Availabled() == 0) { // 탈퇴한 회원
				nulLoginVO.setM_Pw("leave");
			} else if (loginResult.getM_Availabled() == -1) { // 비활성화된 회원
					nulLoginVO.setM_Pw("disable");
			} else if (loginResult.getM_Availabled() == 1){
				if (pwEncoder.matches(lvo.getM_Pw(), loginResult.getM_Pw())) { // 비밀번호 확인, 로그인 성공
					loginResult.setM_Pw("success");
					return loginResult;
				} else
					nulLoginVO.setM_Pw("fail");		
				}
			
		} else {
			nulLoginVO.setM_Pw("fail");
		}
		return nulLoginVO;
	}
	
	// 아이디 찾기 비즈니스 로직
	@Override
	public String idSelect(String m_Email) {

		// 이메일로 아이디 조회 (아이디, 탈퇴여부 리턴)
		LoginVO vo = loginDao.idSelect(m_Email);

		String result;

		if (vo != null) {
			if (vo.getM_Availabled() == 0) {
				result = "leave";
			} else {
				result = vo.getM_Id();
			}
		} else {
			result = "fail";
		}

		// null 값이면 fail, 탈퇴한 아이디면 leave, 정상적으로 아이디가 조회되면 아이디명 리턴
		return result;
	}

	// 비밀번호 찾기 비즈니스 로직
	@Override
	public String pwSelect(LoginVO lvo) {

		String result = "fail";

		// 아이디가 유효한지 조회
		// 패스워드, 이름, 이메일 리턴
		LoginVO vo = loginDao.loginSelect(lvo.getM_Id());

		// 리턴값이 있으면 비밀번호를 재생성하고 이메일 송부
		if (vo != null) {
			if (vo.getM_Availabled() == 0) { // 탈퇴한 계정
				result = "leave";

			} else if (vo.getM_Availabled() == 1) { // 탈퇴하지 않은 일반 계정
				try {
					/* == 랜덤 패스워드 생성 == */
					String newPw;
					do { // 랜덤 패스워드가 기존의 비밀번호와 동일하면 다시 생성
						newPw = Util.getNewPw(); // 랜덤 패스워드
						System.out.println("랜덤 패스워드 : " + newPw);
					} while (newPw == vo.getM_Pw());
					String newEncoedPw = pwEncoder.encode(newPw); // 랜덤 패스워드 암호화

					/* == 랜덤 패스워드 업데이트 == */
					MemberVO mvo = new MemberVO(); // 패스워드 업데이트용 Member 객체
					mvo.setM_Id(lvo.getM_Id());
					mvo.setM_Pw(newEncoedPw);

					// 랜덤 패스워드 업데이트에 성공시 1반환, 실패시 0 반환
					if (memberDao.memberUpdate(mvo) == 1) {

						/* == 랜덤 임시 패스워드 이메일 송부 == */
						System.out.println("임시비밀번호 발급 성공, 이메일 송부");
						MailVO mail = new MailVO();

						mail.setFrom("progtest.future@gmail.com"); // 보내는 사람
						mail.setTo(vo.getM_Email()); // 받는 사람
						mail.setSubject("[P&G] 임시 비밀번호 발급 안내"); // 이메일 제목

						// 이메일 내용
						String msg = 
								// 백그라운드
								"<div style='max-width:740px; margin:0 auto;padding:9px;background:#f8f8f8;border:1px solid #f0f0f0;letter-spacing:-1px'>"
										+ "<div style='margin:0 auto;background:#fff'>"
										+ "<div style='text-align:center; padding:15px 15px'>"

										// contents
										+ "<div style='text-align:center'>"

										// contents - h2
										+ "<h2 style='margin-bottom:15px;font-size:30px;color:#222;font-weight:600'>임시 비밀번호 발급안내.</h2>"

										// contents - 인사
										+ "<p style='font-size:18px;color:#666;line-height:160%'>안녕하세요. <b style='color:#000'>"
										+ vo.getM_Name() + "</b>님" + "<br>고객님의 임시 비밀번호를 발송드립니다."
										+ "<br>로그인 후, 비밀번호 변경을 부탁드립니다.</p>"

										// contents - 임시 비밀번호
										+ "<p style='margin-bottom:15px;font-size:20px;'>임시 비밀번호 : <strong>" + newPw
										+ "</strong></p>"

										// contents - 홈페이지 바로가기
										+ "<div style='overflow:hidden;padding:20px 0;text-align:center'>"
										+ "<a href='http://localhost:8080/' style='padding:15px; display:inline-block; background:#db0436;text-align:center;font-size:19px;color:#fff;text-decoration:none' target='_blank'>P&G 웹사이트 바로가기</a>"
										+ "</div>"

										+ "</div>" // contents 끝

										// footer
										+ "<div style='text-align:left; padding:10px;background:#efefef;font-size:12px;font-weight:500;color:#222'>"
										+ "	<p>본 메일은 발신전용 입니다. 문의는 온라인 고객센터로 해주십시오.<br><br>"
										+ "		<span style='color:#666'> 서울특별시 성동구 왕십리도선동 무학로2길 54  <br>"
										+ "			T. 02-6666-5555<br><br>"
										+ "		<small>Copyright© PartyAndGame. All rights reserved.</small>"
										+ "		</span>" + "<div>"

										// 백그라운드 end
										+ "</div></div></div>";

						mail.setContents(msg);
						mailService.mailSender(mail);

						result = "success";
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} else {
			result = "fail";
		}

		return result;
	}

	

}
