package member.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import member.bean.MemberDTO;
import member.service.MemberWriteService;

@Controller
@RequestMapping(value="/write")
public class MemberWriteController {
	
	@Autowired
	private MemberWriteService memberWriteService;
	@Autowired
	private JavaMailSender mailSender;

	@GetMapping(value="/memberAgree")
	public String writeAgreeForm(Model model) {
		model.addAttribute("display", "write/writeAgreeForm.jsp");
		return "/index";
	}
	@GetMapping(value="memberWrite")
	public String memberWrite(Model model) {
		model.addAttribute("display", "write/memberWrite.jsp");
		return "/index";
	}
	
	@PostMapping("/writeEmailCheck")
	@ResponseBody
	public String writeEmailCheck(@ModelAttribute MemberDTO memberDTO) {
		MemberDTO memberDTO2 = memberWriteService.writeEmailCheck(memberDTO);
		
		if(memberDTO2 == null)
			return "writeEmailCheck_non_exist";
		else
			return memberDTO2.getId();
	}
	
	//이메일 발송
	@GetMapping(value="/writeEmailSend")
	@ResponseBody
	public String writeEmailSend(String email) throws Exception{
		System.out.println("MemberWriteController 인증 이메일 : " + email);
		
		int checkNum = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		System.out.println("MemberWriteController 인증번호 : " + checkNum);
		
		//이메일 보내기
		String setFrom = "milkywayforeset11@gmail.com";
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
			helper.setText(content, true);
			mailSender.send(message);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		String num = checkNum + "";
		
		return num;
	}
	
	@PostMapping("/writeIdCheck")
	@ResponseBody
	public String writeIdCheck(String id) {
		MemberDTO memberDTO2 = memberWriteService.writeIdCheck(id);
		
		if(memberDTO2 == null)
			return "writeIdCheck_non_exist";
		else
			return memberDTO2.getId();
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	@ResponseBody
	public void write(@ModelAttribute MemberDTO memberDTO) {
		memberWriteService.write(memberDTO);
	}
}
