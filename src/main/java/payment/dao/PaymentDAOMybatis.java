package payment.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cart.bean.CartDTO;
import member.bean.MemberDTO;
import mypage.bean.MypageShipmentDTO;
import payment.bean.PaymentDTO;

@Transactional
@Repository
public class PaymentDAOMybatis implements PaymentDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String cartInsert(CartDTO cartDTO) {
		sqlSession.insert("paymentSQL.cartInsert", cartDTO);
		return sqlSession.selectOne("paymentSQL.getCartCode", cartDTO);
	}

	@Override
	public List<CartDTO> getPayment(String[] cartCode) {
		List<CartDTO> list = new ArrayList<CartDTO>();
		for(String cartCode1: cartCode) {
			CartDTO cartDTO = sqlSession.selectOne("paymentSQL.getPayment", cartCode1);
			list.add(cartDTO);
		}
		return list;
	}

	@Override
	public List<MemberDTO> getMember(String memId) {
		return sqlSession.selectList("paymentSQL.getMember", memId);
	}

	@Override
	public List<MypageShipmentDTO> getShipment(String memId) {
		return sqlSession.selectList("paymentSQL.getShipment", memId);
	}

	@Override
	public void payment(PaymentDTO paymentDTO) {
		sqlSession.insert("paymentSQL.payment", paymentDTO);
		sqlSession.update("paymentSQL.updateSavedMoney", paymentDTO);
	}

	@Override
	public void payment1(String[] cartCode) {
		for(String cartCode1 : cartCode) {
			sqlSession.delete("paymentSQL.payCartDelete", cartCode1);
		}
	}

	@Override
	public String payment2() {
		return sqlSession.selectOne("paymentSQL.getPaymentCode");
	}

	@Override
	public void payment3(PaymentDTO paymentDTO, String[] cartCode) {
		for(int i=0; i<cartCode.length; i++) {
			CartDTO cartDTO = sqlSession.selectOne("paymentSQL.getProductInfo", cartCode[i]);

			paymentDTO.setProductCode(cartDTO.getProductCode());
			paymentDTO.setProductOption(cartDTO.getCartOption());
			paymentDTO.setPayQty(cartDTO.getCartQty());
			paymentDTO.setPayPrice(cartDTO.getProductUnit());
			paymentDTO.setPayRate(cartDTO.getProductRate());
			
			sqlSession.insert("paymentSQL.payment2", paymentDTO);
		}
	}
}
