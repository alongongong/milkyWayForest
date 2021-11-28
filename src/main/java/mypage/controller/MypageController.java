package mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//회원정보 불러오기
	@PostMapping(value="/getMypageMyInfo")
	@ResponseBody
	public Map<String, String> getMypageMyInfo(HttpSession session) {
		//System.out.println(id);
		String id = (String) session.getAttribute("memId");
		return mypageService.getMypageMyInfo(id);
	}
	

}
