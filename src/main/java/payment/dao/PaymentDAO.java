package payment.dao;

import java.util.List;

import cart.bean.CartDTO;
import member.bean.MemberDTO;
import mypage.bean.MypageShipmentDTO;
import payment.bean.PaymentDTO;

public interface PaymentDAO {

	public String cartInsert(CartDTO cartDTO);

	public List<CartDTO> getPayment(String[] cartCode);

	public List<MemberDTO> getMember(String memId);

	public List<MypageShipmentDTO> getShipment(String memId);

	public void payment(PaymentDTO paymentDTO);

	public void payment1(PaymentDTO paymentDTO);

	public String payment2(String cartCode);

}
