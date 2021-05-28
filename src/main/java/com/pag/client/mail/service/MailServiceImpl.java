package com.pag.client.mail.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.mail.vo.MailVO;

@Service
@Transactional
public class MailServiceImpl implements MailService {

	// MimeMessage 보낼때 사용
	/*
	 * MIME 타입은 HTTP가 웹에서 전송되는 객체 각각에 붙이는 데이터 포맷 라벨로써, Multipurpose Internet Mail
	 * Extensions의 약자
	 */
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	// SimpleMailMessage 보낼때 사용
	//private MailSender mailSender; 
	
	public void mailSender(MailVO vo) {
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				
				helper.setFrom(vo.getFrom());
				helper.setTo(vo.getTo());
				helper.setSubject(vo.getSubject());
				helper.setText(vo.getContents(), true); // 여기서 true는 html을 사용하겠다는 의미
			}
		};
		mailSender.send(preparator);
	}



	
}
