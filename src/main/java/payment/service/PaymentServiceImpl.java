package payment.service;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cart.bean.CartDTO;
import member.bean.MemberDTO;
import mypage.bean.MypageShipmentDTO;
import payment.bean.PaymentDTO;
import payment.dao.PaymentDAO;

@Service
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDAO paymentDAO;
	
	@Override
	public String cartInsert(CartDTO cartDTO) {
		return paymentDAO.cartInsert(cartDTO);
	}

	@Override
	public JSONObject getPayment(String[] cartCode, String memId) {
		List<CartDTO> cartList = paymentDAO.getPayment(cartCode);
		List<MemberDTO> memberList = paymentDAO.getMember(memId);
		List<MypageShipmentDTO> shipList = paymentDAO.getShipment(memId); 
		
		JSONObject json = new JSONObject();
		if(cartList != null) json.put("cartList", cartList);
		if(memberList != null) json.put("memberList", memberList);
		if(shipList != null) json.put("shipList", shipList);
		
		return json;
	}

	@Override
	public String payment(PaymentDTO paymentDTO, String[] cartCode) {
		paymentDAO.payment(paymentDTO);
		paymentDAO.payment1(cartCode);
		return paymentDAO.payment2();

	}

}
