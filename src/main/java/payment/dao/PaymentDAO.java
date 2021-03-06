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

	public void payment1(String[] cartCode);

	public String payment2();

	public void payment3(PaymentDTO paymentDTO, String[] cartCode);

	public void UpdateMemberGrade(String id);

	public PaymentDTO getPayInfo(String paymentCode);

	public void payment4(PaymentDTO paymentDTO, String[] paymentCode);

}
