package mypage.controller;

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

import member.bean.MemberDTO;
import mypage.service.MypageService;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	@Autowired
	private MypageService mypageService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
    BCryptPasswordEncoder passwordEncoder;
	
	//마이페이지 메인 창
	@GetMapping(value="/mypageMain")
	public String mypageMain(Model model) {
		model.addAttribute("display", "mypage/mypageMain.jsp");
		return "/index";
	}
	
	//비밀번호 확인 창
	@GetMapping(value="/mypagePwdForm")
	public String mypagePwdForm(Model model) {
		model.addAttribute("display", "mypage/mypagePwdForm.jsp");
		return "/index";
	}
	
	//비밀번호 확인 
	@PostMapping(value="/mypagePwdCheck")
	@ResponseBody
	public String mypagePwdCheck(@ModelAttribute MemberDTO memberDTO) {
		MemberDTO memberDTO2 = mypageService.mypagePwdCheck(memberDTO);
		
		String inputPwd = memberDTO.getPwd();
		String dbPwd = memberDTO2.getPwd();
		
		if(! passwordEncoder.matches(inputPwd, dbPwd)) {
			return "";
			
		}else {
			return memberDTO2.getId();
		}
	}
	
	//회원정보 변경/탈퇴 창
	@GetMapping(value="/mypageMyInfo")
	public String mypageMyInfo(Model model) {
		model.addAttribute("display", "mypage/mypageMyInfo.jsp");
		return "/index";
	}
	
	//회원정보 불러오기
	@PostMapping(value="/getMypageMyInfo")
	@ResponseBody
	public MemberDTO getMypageMyInfo(String id) {
		return mypageService.getMypageMyInfo(id);
	}
	
	//이메일 발송
	@GetMapping(value = "/mypageEmailSend")
	@ResponseBody
    public String mypageEmailSend(String email) throws Exception{
		System.out.println("MypageController 인증 이메일 : "+email);
		
		int checkNum = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		System.out.println("MypageController 인증번호 : " + checkNum);
		
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
	
	//회원정보 수정
	@PostMapping(value="/mypageMyInfoUpdate")
	@ResponseBody
	public void mypageMyInfoUpdate(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
		//비밀번호 암호화
		memberDTO.setPwd(passwordEncoder.encode(memberDTO.getPwd()));
		
		//선택정보 값
		if(memberDTO.getIdPwdQuestion() != "false" && memberDTO.getIdPwdAnswer() != "") {
			
		}else {	
			memberDTO.setIdPwdQuestion("false");
			memberDTO.setIdPwdAnswer("false");
//		}else if(memberDTO.getIdPwdAnswer()=="") {
//			memberDTO.setIdPwdQuestion("false");
//			memberDTO.setIdPwdAnswer("false");
		}
		
//		System.out.println(memberDTO.getId()); //세션 아이디값 null로 들어오는 거 ??
//		System.out.println(memberDTO.getNickname());
//		System.out.println(memberDTO.getPwd());
//		System.out.println(memberDTO.getTel1());
//		System.out.println(memberDTO.getEmail1());
		System.out.println(memberDTO.getIdPwdQuestion());
		System.out.println(memberDTO.getIdPwdAnswer());
//		System.out.println(session.getAttribute("memId"));
		
//		memberDTO.setId((String) session.getAttribute("memId"));
		
		mypageService.mypageMyInfoUpdate(memberDTO);
	}
	

}
