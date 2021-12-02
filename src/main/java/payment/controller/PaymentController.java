package payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {

	@GetMapping("/payment")
	public String payment(Model model) {
		model.addAttribute("display", "payment/payment.jsp");
		return "/index";
	}
}
