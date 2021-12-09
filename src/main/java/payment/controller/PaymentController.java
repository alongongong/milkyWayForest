package payment.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cart.bean.CartDTO;
import payment.bean.PaymentDTO;
import payment.service.PaymentService;

@Controller
public class PaymentController {
	@Autowired
	private PaymentService paymentService;
	
	//결제페이지
	@GetMapping("/payment")
	public String payment(@RequestParam String[] cartCode, Model model) {
		
		model.addAttribute("cartCode", cartCode);
		model.addAttribute("display", "payment/payment.jsp");
		return "/index";
	}

	//결제 성공 페이지
	@GetMapping("/payment/paySuccess")
	public String paySuccess(Model model) {
		model.addAttribute("display", "payment/paySuccess.jsp");
		return "/index";
	}

	@PostMapping("/payment/cartInsert")
	@ResponseBody
	public String cartInsert(@ModelAttribute CartDTO cartDTO, HttpSession session) {
		cartDTO.setId(session.getAttribute("memId")+"");
		return paymentService.cartInsert(cartDTO);
	}
	
	@PostMapping("/payment/getPayment")
	@ResponseBody
	public JSONObject getPayment(@RequestParam String[] cartCode, HttpSession session) {
		return paymentService.getPayment(cartCode, session.getAttribute("memId")+"");
	}
	
	@PostMapping("/payment/payment")
	@ResponseBody
	public String payment(@ModelAttribute PaymentDTO paymentDTO, @RequestParam String[] cartCode, HttpSession session) {
		System.out.println(cartCode);
		paymentDTO.setId(session.getAttribute("memId")+"");
		return paymentService.payment(paymentDTO, cartCode);
	}
	
}
