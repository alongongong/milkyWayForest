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
		model.addAttribute("subject", "�޴� ����");
		model.addAttribute("display", "pAllMenu.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/memberList")
	public String memberLIst(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "ȸ������Ʈ");
		model.addAttribute("display", "pMemberList.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/gradeBenefit")
	public String gradeBenefit(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "��޺� ����");
		model.addAttribute("display", "pGradeBenefit.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/productList")
	public String productList(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "��ǰ ��ȸ, ����, ����");
		model.addAttribute("display", "pProductList.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/productInsert")
	public String productInsert(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "��ǰ ���");
		model.addAttribute("display", "pProductInsert.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/talk")
	public String talk(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "��� ����");
		model.addAttribute("display", "pTalk.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/dailyOrder")
	public String dailyOrder(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "���ں� �ֹ� ���� Ȯ��");
		model.addAttribute("display", "pDailyOrder.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/orderNShip")
	public String orderNShip(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "�ֹ� Ȯ�� / �߼� ����");
		model.addAttribute("display", "pOerderNShip");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/orderCancel")
	public String orderCancel(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "���, ��ȯ, ��ǰ ����");
		model.addAttribute("display", "pOrderCancel.jsp");
		return "/admin/adminIndex";
	}
	
	@GetMapping("/admin/qnaBoard")
	public String qnaBoard(String dataNum, Model model) {
		model.addAttribute("dataNum", dataNum);
		model.addAttribute("subject", "���� �Խ��� ����");
		model.addAttribute("display", "pQnaBoard.jsp");
		return "/admin/adminIndex";
	}
	
	//@GetMapping("")
}
