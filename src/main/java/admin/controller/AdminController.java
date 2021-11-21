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
	
	@GetMapping("/admin/talk")
	public String talk(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "상담 관리");
		model.addAttribute("display", "pTalk.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/dailyOrder")
	public String dailyOrder(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "일자별 주문 내역 확인");
		model.addAttribute("display", "pDailyOrder.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/orderNShip")
	public String orderNShip(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "주문 확인 / 발송 관리");
		model.addAttribute("display", "pOerderNShip");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/orderCancel")
	public String orderCancel(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "취소, 교환, 반품 관리");
		model.addAttribute("display", "pOrderCancel.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/qnaBoard")
	public String qnaBoard(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "문의 게시판 관리");
		model.addAttribute("display", "pQnaBoard.jsp");
		return "/admin/adminIndex";
	}
	
	//@GetMapping("")
}
