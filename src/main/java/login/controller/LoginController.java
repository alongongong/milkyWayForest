package login.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import login.service.LoginService;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping(value="/loginForm")
	public String loginForm() {
		return "/login/loginForm";
	}
	
//	@PostMapping(value="/login")
//	@ResponseBody
//	public void login(@ModelAttribute MemberDTO memberDTO) {
//		loginService.login(memberDTO);
//	}
	
	@GetMapping(value="/findId")
	public String findId() {
		return "/login/findId";
	}
	
	//이메일 인증
	@GetMapping(value = "/loginEmailCheck")
	@ResponseBody
    public String loginEmailCheck(String email) throws Exception{
		System.out.println(email);
		
		int checkNum = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		System.out.println("인증번호 : " + checkNum);
		
		/* 이메일 보내기 */
        String setFrom = "milkywayforest11@gmail.com";
        String toMail = email;
        String title = "아이디 찾기 인증 이메일 입니다.";
        String content = 
                "안녕하세요. 은하숲입니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {    
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = checkNum + "";
        
        return num;
    }

	
	@GetMapping(value="/findPwd")
	public String findPwd() {
		return "/login/findPwd";
	}
	
	
	
}
