package payment.service;

import org.json.simple.JSONObject;

import cart.bean.CartDTO;
import payment.bean.PaymentDTO;

public interface PaymentService {

	public String cartInsert(CartDTO cartDTO);

	public JSONObject getPayment(String[] cartCode, String memId);

	public void payment(PaymentDTO paymentDTO);

}
