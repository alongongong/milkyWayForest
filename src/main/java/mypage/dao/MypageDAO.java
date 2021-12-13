package mypage.dao;

import java.util.List;
import java.util.Map;

import comment.bean.CommentDTO;
import member.bean.MemberCouponDTO;
import member.bean.MemberDTO;
import mypage.bean.MemberRatingDTO;
import mypage.bean.MypageShipmentDTO;
import payment.bean.PaymentDTO;
import qnaBoard.bean.QnaBoardDTO;

public interface MypageDAO {

	public MemberDTO getMypageMyInfo(String id);

	public MemberDTO mypagePwdCheck(MemberDTO memberDTO);

	public void mypageMyInfoUpdate(MemberDTO memberDTO);

	public void mypageMyInfoDelete(MemberDTO memberDTO);

	public int getQnaTotalA(String id);

	public List<QnaBoardDTO> getMyQnaList(Map<String, String> map);

	public QnaBoardDTO getMyQnaView(String qnaCode);

	public void updateMyQnaView(QnaBoardDTO qnaBoardDTO);

	public List<CommentDTO> getMyQnaComment(int qnaCode);

	public void deleteMyQnaView(int qnaCode);

	public void mypageShpMngWrite(MypageShipmentDTO mypageShipmentDTO);

	public List<PaymentDTO> getMainPaymentInfo(String id);
	
	public List<PaymentDTO> getPaymentList(String id);
	
	public int countCoupon(String id);

	public int countPayment(String id);

	public int countPending(String id);

	public int countFinished(String id);

	public int countProcessing(String id);

	public int countShipping(String id);

	public int countShipped(String id);

	public int countCancel(String id);

	public int countExchange(String id);

	public int countReturn(String id);

	public int countRefund(String id);
	
	public int getOrderTotalA(String id);

	public List<PaymentDTO> getPaymentList2(Map<String, String> map);

	public List<PaymentDTO> getMyOrderInfo(String paymentCode);
	
	public int getCancelTotalA(String id);

	public int getShipmentTotalA(String id);
	
	public void mypageShpMngWrite1(MypageShipmentDTO mypageShipmentDTO);

	public List<MypageShipmentDTO> getShpMngList(String id);

	public MypageShipmentDTO getShpMngModify(String shipCode);

	public void updateShpMng(MypageShipmentDTO mypageShipmentDTO);

	public void deleteShpMng(String shipCode);

	public void updateMyOrderCancel(PaymentDTO paymentDTO);
	
	public MemberRatingDTO getMypageRating(String id);

	public MemberDTO getMemberdate(String id);

	public int getPointTotalA(String id);

	public List<PaymentDTO> getPaymentSaveMoneyList(Map<String, String> map);

	public List<MemberCouponDTO> getCouponList(String id);

	public void updateMyOrderExchange(PaymentDTO paymentDTO);
	
	public void updateMyOrderReturn(PaymentDTO paymentDTO);

	public PaymentDTO getMyOrderCancelInfo(String paymentCode);

}
