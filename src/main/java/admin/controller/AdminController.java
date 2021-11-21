package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/admin")
	public String admin() {
		return "/admin/adminIndex";
	}
	
	@RequestMapping(value="/admin/pAllMenu", method=RequestMethod.GET)
	public String pAllMenu(String dataNum, Model model) { 
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "메뉴 관리");
		model.addAttribute("display", "pAllMenu.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/memberList")
	public String memberLIst(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "회원리스트");
		model.addAttribute("display", "pMemberList.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/gradeBenefit")
	public String gradeBenefit(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "등급별 혜택");
		model.addAttribute("display", "pGradeBenefit.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/productList")
	public String productList(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "상품 조회, 수정, 삭제");
		model.addAttribute("display", "pProductList.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/productInsert")
	public String productInsert(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "상품 등록");
		model.addAttribute("display", "pProductInsert.jsp");
		return "/admin/adminIndex";
	}
	
}
