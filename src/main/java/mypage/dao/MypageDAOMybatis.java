package mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import comment.bean.CommentDTO;
import member.bean.MemberCouponDTO;
import member.bean.MemberDTO;
import mypage.bean.MemberRatingDTO;
import mypage.bean.MypageShipmentDTO;
import mypage.bean.WishListDTO;
import payment.bean.PaymentDTO;
import qnaBoard.bean.QnaBoardDTO;

@Repository 
@Transactional
public class MypageDAOMybatis implements MypageDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO getMypageMyInfo(String id) {
		return sqlSession.selectOne("mypageSQL.getMypageMyInfo", id);
	}

	@Override
	public MemberDTO mypagePwdCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne("mypageSQL.mypagePwdCheck", memberDTO);
	}

	@Override
	public void mypageMyInfoUpdate(MemberDTO memberDTO) {
		sqlSession.update("mypageSQL.mypageMyInfoUpdate", memberDTO);
	}

	@Override
	public void mypageMyInfoDelete(MemberDTO memberDTO) {
		sqlSession.delete("mypageSQL.mypageMyInfoDelete", memberDTO);
	}

	@Override
	public int getQnaTotalA(String id) {
		return sqlSession.selectOne("mypageSQL.getQnaTotalA", id);
	}

	@Override
	public List<QnaBoardDTO> getMyQnaList(Map<String, String> map) {
		return sqlSession.selectList("mypageSQL.getMyQnaList", map);
	}

	@Override
	public QnaBoardDTO getMyQnaView(String qnaCode) {
		return sqlSession.selectOne("mypageSQL.getMyQnaView", qnaCode);
	}

	@Override
	public void updateMyQnaView(QnaBoardDTO qnaBoardDTO) {
		sqlSession.update("mypageSQL.updateMyQnaView", qnaBoardDTO);
	}

	@Override
	public List<CommentDTO> getMyQnaComment(int qnaCode) {
		return sqlSession.selectList("mypageSQL.getMyQnaComment", qnaCode);
	}

	@Override
	public void deleteMyQnaView(int qnaCode) {
		sqlSession.delete("mypageSQL.deleteMyQnaView", qnaCode);
	}

	@Override
	public void mypageShpMngWrite(MypageShipmentDTO mypageShipmentDTO) {
		sqlSession.insert("mypageSQL.mypageShpMngWrite",mypageShipmentDTO);
	}
	
	@Override
	public List<PaymentDTO> getMainPaymentInfo(String id) {
		return sqlSession.selectList("mypageSQL.getMainPaymentInfo", id);
	}
	
	@Override
	public List<PaymentDTO> getPaymentList(String id) {
		return sqlSession.selectList("mypageSQL.getPaymentList", id);
	}

	@Override
	public int countCoupon(String id) {
		return sqlSession.selectOne("mypageSQL.countCoupon", id);
	}

	@Override
	public int countPayment(String id) {
		return sqlSession.selectOne("mypageSQL.countPayment", id);
	}

	@Override
	public int countPending(String id) {
		return sqlSession.selectOne("mypageSQL.countPending", id);
	}

	@Override
	public int countFinished(String id) {
		return sqlSession.selectOne("mypageSQL.countFinished", id);
	}

	@Override
	public int countProcessing(String id) {
		return sqlSession.selectOne("mypageSQL.countProcessing", id);
	}

	@Override
	public int countShipping(String id) {
		return sqlSession.selectOne("mypageSQL.countShipping", id);
	}

	@Override
	public int countShipped(String id) {
		return sqlSession.selectOne("mypageSQL.countShipped", id);
	}

	@Override
	public int countCancel(String id) {
		return sqlSession.selectOne("mypageSQL.countCancel", id);
	}

	@Override
	public int countExchange(String id) {
		return sqlSession.selectOne("mypageSQL.countExchange", id);
	}

	@Override
	public int countReturn(String id) {
		return sqlSession.selectOne("mypageSQL.countReturn", id);
	}

	@Override
	public int countRefund(String id) {
		return sqlSession.selectOne("mypageSQL.countRefund", id);
	}
	
	@Override
	public int getOrderTotalA(String id) {
		return sqlSession.selectOne("mypageSQL.getOrderTotalA", id);
	}
	
	@Override
	public List<PaymentDTO> getPaymentList2(Map<String, String> map) {
		return sqlSession.selectList("mypageSQL.getPaymentList2", map);
	}
	
	@Override
	public List<PaymentDTO> getMyOrderInfo(String paymentCode) {
		return sqlSession.selectList("mypageSQL.getMyOrderInfo", paymentCode);
	}

	@Override
	public int getCancelTotalA(String id) {
		return sqlSession.selectOne("mypageSQL.getCancelTotalA", id);
	}
	
	@Override
	public int getShipmentTotalA(String id) {
		return sqlSession.selectOne("mypageSQL.getShipmentTotalA", id);
	}

	@Override
	public void mypageShpMngWrite1(MypageShipmentDTO mypageShipmentDTO) {
		sqlSession.insert("mypageSQL.mypageShpMngWrite1",mypageShipmentDTO);
	}

	@Override
	public List<MypageShipmentDTO> getShpMngList(String id) {
		return sqlSession.selectList("mypageSQL.getShpMngList", id);
	}

	@Override
	public MypageShipmentDTO getShpMngModify(String shipCode) {
		return sqlSession.selectOne("mypageSQL.getShpMngModify", shipCode);
	}

	@Override
	public void updateShpMng(MypageShipmentDTO mypageShipmentDTO) {
		sqlSession.update("mypageSQL.updateShpMng", mypageShipmentDTO);
	}

	@Override
	public void deleteShpMng(String shipCode) {
		sqlSession.delete("mypageSQL.deleteShpMng", shipCode);
	}

	@Override
	public void updateMyOrderCancel(PaymentDTO paymentDTO) {
		sqlSession.update("mypageSQL.updateMyOrderCancel", paymentDTO);
	}
	
	@Override
	public void updateMyOrderExchange(PaymentDTO paymentDTO) {
		sqlSession.update("mypageSQL.updateMyOrderExchange", paymentDTO);
	}
	
	@Override
	public void updateMyOrderReturn(PaymentDTO paymentDTO) {
		sqlSession.update("mypageSQL.updateMyOrderReturn", paymentDTO);
	}
	
	@Override
	public MemberRatingDTO getMypageRating(String id) {
		return sqlSession.selectOne("mypageSQL.getMypageRating", id);
	}

	@Override
	public MemberDTO getMemberdate(String id) {
		return sqlSession.selectOne("mypageSQL.getMemberdate", id);
	}

	@Override
	public int getPointTotalA(String id) {
		return sqlSession.selectOne("mypageSQL.getPointTotalA", id);
	}

	@Override
	public List<PaymentDTO> getPaymentSaveMoneyList(Map<String, String> map) {
		return sqlSession.selectList("mypageSQL.getPaymentSaveMoneyList", map);
	}

	@Override
	public List<MemberCouponDTO> getCouponList(String id) {
		return sqlSession.selectList("mypageSQL.getCouponList", id);
	}

	@Override
	public PaymentDTO getMyOrderCancelInfo(String paymentCode) {
		PaymentDTO paymentDTO = sqlSession.selectOne("mypageSQL.getMyOrderCancelInfo", paymentCode);
		
		if(paymentDTO == null) {
			PaymentDTO paymentDTO2 = new PaymentDTO();
			paymentDTO2.setDeliveryInfo("false");
			
			return paymentDTO2;
		}

		return paymentDTO;	
	}

	@Override
	public List<WishListDTO> getWishList(Map<String, Object> map) {
		return sqlSession.selectList("mypageSQL.getWishList", map);
	}

	@Override
	public int getWishListTotalA(String id) {
		return sqlSession.selectOne("mypageSQL.getWishListTotalA", id);
	}

	@Override
	public void wishAllDelete(String id) {
		sqlSession.delete("mypageSQL.wishAllDelete", id);
	}

}
