package admin.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.service.AdminService;
import grade.bean.GradeDTO;
import product.bean.ProductDTO;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/admin")
	public String admin() {
		return "/admin/adminIndex";
	}
	
	@RequestMapping(value="/admin/pAllMenu", method=RequestMethod.GET)
	public String pAllMenu(@RequestParam String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "메뉴 관리");
		model.addAttribute("display", "pAllMenu.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/memberList")
	public String memberLIst(@RequestParam String dataNum, @RequestParam int pg, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "회원리스트");
		model.addAttribute("pg", pg);
		model.addAttribute("display", "pMemberList.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/gradeBenefit")
	public String gradeBenefit(@RequestParam String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "등급별 혜택");
		model.addAttribute("display", "pGradeBenefit.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/productList")
	public String productList(@RequestParam String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "상품 조회, 수정, 삭제");
		model.addAttribute("display", "pProductList.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/productInsert")
	public String productInsert(@RequestParam String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "상품 등록");
		model.addAttribute("display", "pProductInsert.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/talk")
	public String talk(@RequestParam String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "상담 관리");
		model.addAttribute("display", "pTalk.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/dailyOrder")
	public String dailyOrder(@RequestParam String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "일자별 주문 내역 확인");
		model.addAttribute("display", "pDailyOrder.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/orderNShip")
	public String orderNShip(@RequestParam String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "주문 확인 / 발송 관리");
		model.addAttribute("display", "pOerderNShip");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/orderCancel")
	public String orderCancel(@RequestParam String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "취소, 교환, 반품 관리");
		model.addAttribute("display", "pOrderCancel.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/qnaBoard")
	public String qnaBoard(@RequestParam String dataNum, @RequestParam int pg, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "문의 게시판 관리");
		model.addAttribute("pg", pg);
		model.addAttribute("display", "pQnaBoard.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/reviewBoard")
	public String reviewBoard(@RequestParam String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "상품 리뷰 관리");
		model.addAttribute("display", "pReviewBoard.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/stock")
	public String stock(@RequestParam String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "물류 관리");
		model.addAttribute("display", "pStock.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/memberStatics")
	public String memberStatics(@RequestParam String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "접속자수 통계");
		model.addAttribute("display", "pMemberStatics.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/payStatics")
	public String payStatics(@RequestParam String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "판매 통계");
		model.addAttribute("display", "pPayStatics.jsp");
		return "/admin/adminIndex";
	}
	
	//------------------------------------------------------
	@PostMapping("/admin/pProductInsert")
	@ResponseBody
	public void pProductInsert(@ModelAttribute ProductDTO productDTO) {
		adminService.pProductInsert(productDTO);
	} // 상품입력
	
	@PostMapping("/admin/getProductList")
	@ResponseBody
	public List<ProductDTO> getProductList(){
		return adminService.getProductList();
	}
	
	@PostMapping("/admin/productUpdate")
	@ResponseBody
	public void productUpdate(@ModelAttribute ProductDTO productDTO) {
		adminService.productUpdate(productDTO);
	}
	
	@PostMapping("/admin/productDelete") 
	@ResponseBody
	public void productDelete(@RequestParam String productCode) {
		adminService.productDelete(productCode);
	}
	
	@PostMapping("/admin/getStock")
	@ResponseBody
	public List<ProductDTO> getStock(){
		return adminService.getStock();
	}
	
	@PostMapping("/admin/stockUpdate")
	@ResponseBody
	public void stockUpdate(@RequestParam String productCode, @RequestParam int enterCount) {
		adminService.stockUpdate(productCode, enterCount);
	}
	
	@PostMapping("/admin/getGradeBenefit")
	@ResponseBody
	public List<GradeDTO> getGradeBenefit(){
		return adminService.getGradeBenefit();
	}
	
	@PostMapping("/admin/updateGradeBenefit")
	@ResponseBody
	public void updateGradeBenefit(@RequestParam String welcome, @RequestParam String green, @RequestParam String gold) {
		adminService.updateGradeBenefit(welcome, green, gold);
	}
	
	@PostMapping("/admin/getQnaBoard")
	@ResponseBody
	public JSONObject getQnaBoard(@RequestParam int pg) {
		return adminService.getQnaBoard(pg);
	}
	
	@PostMapping("/admin/getMemberList")
	@ResponseBody
	public JSONObject getMemberList(@RequestParam int pg) {
		return adminService.getMemberList(pg);
	}
	
}
