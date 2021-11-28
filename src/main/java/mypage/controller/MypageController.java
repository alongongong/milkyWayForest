package mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import mypage.service.MypageService;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
	//마이페이지 메인 창
	@GetMapping(value="/mypageMain")
	public String mypageMain(Model model) {
		model.addAttribute("display", "mypage/mypageMain.jsp");
		return "/index";
	}
	
	//회원정보 변경/탈퇴 창
	@GetMapping(value="/mypageMyInfo")
	public String mypageMyInfo(Model model) {
		model.addAttribute("display", "mypage/mypageMyInfo.jsp");
		return "/index";
	}

}
