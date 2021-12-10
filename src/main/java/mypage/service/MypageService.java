package mypage.service;

import java.util.List;

import comment.bean.CommentDTO;
import member.bean.MemberDTO;
import mypage.bean.MypageShipmentDTO;
import net.sf.json.JSONObject;
import payment.bean.PaymentDTO;
import qnaBoard.bean.QnaBoardDTO;

public interface MypageService {

	public MemberDTO getMypageMyInfo(String id);

	public MemberDTO mypagePwdCheck(MemberDTO memberDTO);

	public void mypageMyInfoUpdate(MemberDTO memberDTO);

	public void mypageMyInfoDelete(MemberDTO memberDTO);

	public JSONObject getMyQnaList(String id, int pg);

	public QnaBoardDTO getMyQnaView(String qnaCode);

	public void updateMyQnaView(QnaBoardDTO qnaBoardDTO);

	public List<CommentDTO> getMyQnaComment(int qnaCode);

	public void deleteMyQnaView(int qnaCode);

	public void mypageShpMngWrite(MypageShipmentDTO mypageShipmentDTO);

	public JSONObject getPaymentInfo(String id);

	public JSONObject getOrderList(String id, int pg);

	public PaymentDTO getMyOrderInfo(String paymentCode);
	
	public JSONObject getCancelList(String id, int pg);

	public JSONObject getShipmentList(String id, int pg);
	
	public void mypageShpMngWrite1(MypageShipmentDTO mypageShipmentDTO);

	public List<MypageShipmentDTO> getShpMngList(String id);

	public MypageShipmentDTO getShpMngModify(String shipCode);

	public void updateShpMng(MypageShipmentDTO mypageShipmentDTO);

	public void deleteShpMng(String shipCode);

	public void updateMyOrderCancel(String paymentCode);


}
