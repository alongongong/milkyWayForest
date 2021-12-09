package mypage.dao;

import java.util.List;
import java.util.Map;

import comment.bean.CommentDTO;
import member.bean.MemberDTO;
import mypage.bean.MypageShipmentDTO;
import payment.bean.PaymentDTO;
import qnaBoard.bean.QnaBoardDTO;
import shopping.bean.ShoppingDTO;

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

	public List<PaymentDTO> getPaymentList(String id);
	
	public int countCoupon(String id);

	public int countPayment(String id);
	
	public int getOrderTotalA(String id);

	public List<PaymentDTO> getPaymentList2(Map<String, String> map);

	public PaymentDTO getMyOrderInfo(String paymentCode);
	
	public void mypageShpMngWrite1(MypageShipmentDTO mypageShipmentDTO);

	public List<MypageShipmentDTO> getShpMngList(String id);

	public MypageShipmentDTO getShpMngModify(String shipCode);

	public void updateShpMng(MypageShipmentDTO mypageShipmentDTO);

	public void deleteShpMng(String shipCode);

}
