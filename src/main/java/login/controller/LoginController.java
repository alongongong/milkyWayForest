package login.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import login.service.LoginService;
import member.bean.MemberDTO;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
    BCryptPasswordEncoder passwordEncoder;
	
	//로그인창
	@GetMapping(value="/loginForm")
	public String loginForm(Model model) {
		model.addAttribute("display", "login/loginForm.jsp");
		return "/index";
	}
	
	//아이디 로그인 https://nahosung.tistory.com/75 비밀번호 암호화 참고
	@PostMapping(value="/login")
	@ResponseBody
	public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {	
		MemberDTO memberDTO2 = loginService.login(memberDTO);
		
		//비밀번호 복호화
		String inputPwd = memberDTO.getPwd();
		String dbPwd = null;
		if(memberDTO2 != null) dbPwd = memberDTO2.getPwd();
		
		if(! passwordEncoder.matches(inputPwd, dbPwd)) {
			return "";
			
		}else {
			session.setAttribute("memId", memberDTO2.getId());
			System.out.println("LoginController 세션아이디 저장 "+session.getAttribute("memId"));
			
			loginService.loginTime(memberDTO2.getId());
			return memberDTO2.getId();			
		}	
	}

	//카카오 로그인 세션 저장
	@PostMapping(value="/kakaoLogin")
	@ResponseBody
	public void kakaoLogin(@ModelAttribute MemberDTO memberDTO, HttpSession session) {	
		//아이디 있는지 확인
		MemberDTO memberDTO2 = loginService.loginIdCheck(memberDTO.getId());

		if(memberDTO2 == null) {
			//아이디 없으면 회원가입
			loginService.kakaoWrite(memberDTO); 
		}


		session.setAttribute("memId", memberDTO.getId());
		session.setAttribute("memNickname", memberDTO.getNickname());
		session.setAttribute("memWritePath", memberDTO.getWritePath());
		System.out.println("LoginController 세션카카오아이디 저장 "+session.getAttribute("memId")+session.getAttribute("memWritePath"));	
		
		loginService.loginTime(memberDTO.getId());
	}
	
	//아이디 찾기창
	@GetMapping(value="/findId")
	public String findId(Model model) {
		model.addAttribute("display", "login/findIdForm.jsp");
		return "/index";
	}
	
	//질문으로 찾기
	@PostMapping(value="/findIdQna")
	@ResponseBody
	public String findIdQna(@ModelAttribute MemberDTO memberDTO) {
		MemberDTO memberDTO2 = loginService.findIdQna(memberDTO);

		if(memberDTO2 == null)
			return "findIdQna_non_exist"; //아이디 없음
		else
			return memberDTO2.getId(); //아이디 있음
	}
	
	//이메일 확인
	@PostMapping("/loginEmailCheck")
	@ResponseBody
	public String loginEmailCheck(@ModelAttribute MemberDTO memberDTO) {
		MemberDTO memberDTO2 = loginService.loginEmailCheck(memberDTO);

		if(memberDTO2 == null)
			return "loginEmailCheck_non_exist"; //이메일 발송 불가능
		else
			return memberDTO2.getId(); //이메일 발송 가능
		
	}
	
	//이메일 발송
	@GetMapping(value = "/loginEmailSend")
	@ResponseBody
    public String loginEmailSend(String email) throws Exception{
		System.out.println("LoginController 인증 이메일 : "+email);
		
		int checkNum = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		System.out.println("LoginController 인증번호 : " + checkNum);
		
		//이메일 보내기
        String setFrom = "milkywayforest11@gmail.com";
        String toMail = email;
        String title = "이메일 인증번호가 발급되었습니다.";
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
	
	//아이디 찾기 결과 창
	@GetMapping(value="/findIdResult")
	public String findIdResult(String id, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("display", "login/findIdResult.jsp");
		return "/index";
	}
	
	//비밀번호 찾기 창 1
	@GetMapping(value="/findPwd")
	public String findPwd(Model model) {
		model.addAttribute("display", "login/findPwdForm1.jsp");
		return "/index";
	}
	
	//아이디 확인
	@PostMapping("/loginIdCheck")
	@ResponseBody
	public String loginIdCheck(String id) {
		MemberDTO memberDTO2 = loginService.loginIdCheck(id);

		if(memberDTO2 == null)
			return "loginIdCheck_non_exist"; //아이디 없음
		else
			return memberDTO2.getId(); //아이디 있음
		
	}
	 
	//비밀번호 찾기 창 2
	@GetMapping(value="/findPwd2")
	public String findPwd2(String id, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("display", "login/findPwdForm2.jsp");
		return "/index";
	}
	
	//비밀번호 찾기 창 3
	@GetMapping(value="/findPwd3")
	public String findPwd3(String id, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("display", "login/findPwdForm3.jsp");
		return "/index";
	}
	
	//비밀번호 재설정
	@PostMapping(value="/findPwdUpdate")
	@ResponseBody
	public void findPwdUpdate(@ModelAttribute MemberDTO memberDTO, Model model) {
		//비밀번호 암호화
		memberDTO.setPwd(passwordEncoder.encode(memberDTO.getPwd()));
		
		loginService.findPwdUpdate(memberDTO);
	}
	
	//로그아웃
	@GetMapping(value="/logout")
	public String logout(HttpSession session) {	
		//모든 세션 제거
		session.invalidate();
		return "/index";
	}
	
}
