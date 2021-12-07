package payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {
	//결제페이지
	@GetMapping("/payment")
	public String payment(Model model) {
		model.addAttribute("display", "payment/payment.jsp");
		return "/index";
	}
	
	//결제 성공 페이지
	@GetMapping("/payment/paySuccess")
	public String paySuccess(Model model) {
		model.addAttribute("display", "payment/paySuccess.jsp");
		return "/index";
	}
	
	//결제 실패 페이지
	@GetMapping("/payment/payFail")
	public String payFail(Model model) {
		model.addAttribute("display", "payment/payFail.jsp");
		return "/index";
	}
}
