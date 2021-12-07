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
	
	//결제
//	@PostMapping(value="/payment/payComplete")
//	@ResponseBody
//	public void payComplete(@RequestBody String imp_uid, @RequestBody String merchant_uid) {
//		String imp_uid = extract_POST_value_from_url("imp_uid"); //post ajax request로부터 imp_uid확인
//
//		payment_result = rest_api_to_find_payment(imp_uid); //imp_uid로 아임포트로부터 결제정보 조회
//		amount_to_be_paid = query_amount_to_be_paid(payment_result.merchant_uid); //결제되었어야 하는 금액 조회. 가맹점에서는 merchant_uid기준으로 관리
//
//		IF payment_result.status == "paid" AND payment_result.amount == amount_to_be_paid;
//			success_post_process(payment_result); //결제까지 성공적으로 완료
//		ELSE IF payment_result.status == "ready" AND payment.pay_method == "vbank";
//			vbank_number_assigned(payment_result); //가상계좌 발급성공
//		ELSE
//			fail_post_process(payment_result); //결제실패 처리
//
//
//	}
	
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
	
	@PostMapping("/payment/cartInsert")
	@ResponseBody
	public String cartInsert(@ModelAttribute CartDTO cartDTO) {
		return paymentService.cartInsert(cartDTO);
	}
	
	@PostMapping("/payment/getPayment")
	@ResponseBody
	public JSONObject getPayment(@RequestParam String[] cartCode, HttpSession session) {
		return paymentService.getPayment(cartCode, session.getAttribute("memId")+"");
	}
	
	@PostMapping("/payment/payment")
	@ResponseBody
	public void payment(@ModelAttribute PaymentDTO paymentDTO, HttpSession session) {
		paymentDTO.setId(session.getAttribute("memId")+"");
		paymentService.payment(paymentDTO);
	}
	
}
