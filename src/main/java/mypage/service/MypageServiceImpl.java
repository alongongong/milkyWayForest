package mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comment.bean.CommentDTO;
import member.bean.MemberDTO;
import mypage.bean.MemberRatingDTO;
import mypage.bean.MypageShipmentDTO;
import mypage.dao.MypageDAO;
import net.sf.json.JSONObject;
import paging.BoardPaging;
import payment.bean.PaymentDTO;
import qnaBoard.bean.QnaBoardDTO;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;
	@Autowired
	private BoardPaging boardPaging;

	@Override
	public MemberDTO getMypageMyInfo(String id) {
		return mypageDAO.getMypageMyInfo(id);
	}

	@Override
	public MemberDTO mypagePwdCheck(MemberDTO memberDTO) {
		return mypageDAO.mypagePwdCheck(memberDTO);
	}

	@Override
	public void mypageMyInfoUpdate(MemberDTO memberDTO) {
		mypageDAO.mypageMyInfoUpdate(memberDTO);
	}

	@Override
	public void mypageMyInfoDelete(MemberDTO memberDTO) {
		mypageDAO.mypageMyInfoDelete(memberDTO);
		
	}

	@Override
	public JSONObject getMyQnaList(String id, int pg) {
		int endNum = pg * 10;
		int startNum = endNum - 9;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		int totalA = mypageDAO.getQnaTotalA(id);
		int totalP = (totalA - 1) / 10 + 1;
		
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(10);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();		
		
		List<QnaBoardDTO> list =  mypageDAO.getMyQnaList(map);
		
		JSONObject json = new JSONObject();
		
		if(list != null) {
			json.put("list", list);
			json.put("boardPaging", boardPaging.getPagingHTML().toString());
			json.put("pg", pg);
		}
		
		return json;
	}

	@Override
	public QnaBoardDTO getMyQnaView(String qnaCode) {
		QnaBoardDTO qnaBoardDTO = mypageDAO.getMyQnaView(qnaCode);
		
		if(qnaBoardDTO.getQnaContent() != null) {
			qnaBoardDTO.setQnaContent(qnaBoardDTO.getQnaContent().replace("\n", "<br>"));
		}
		
		return qnaBoardDTO;
	}

	@Override
	public void updateMyQnaView(QnaBoardDTO qnaBoardDTO) {
		mypageDAO.updateMyQnaView(qnaBoardDTO);
	}

	@Override
	public List<CommentDTO> getMyQnaComment(int qnaCode) {
		return mypageDAO.getMyQnaComment(qnaCode);
	}

	@Override
	public void deleteMyQnaView(int qnaCode) {
		mypageDAO.deleteMyQnaView(qnaCode);
	}

	@Override
	public void mypageShpMngWrite(MypageShipmentDTO mypageShipmentDTO) {
		mypageDAO.mypageShpMngWrite(mypageShipmentDTO);
	}

	@Override
	public JSONObject getMainPaymentInfo(String id) {
		List<PaymentDTO> paymentList = mypageDAO.getMainPaymentInfo(id);
		int countCoupon = mypageDAO.countCoupon(id);
		int countPayment = mypageDAO.countPayment(id);
		
		int countPending = mypageDAO.countPending(id);
		int countFinished = mypageDAO.countFinished(id);
		int countProcessing = mypageDAO.countProcessing(id);
		int countShipping = mypageDAO.countShipping(id);
		int countShipped = mypageDAO.countShipped(id);
		int countCancel = mypageDAO.countCancel(id);
		int countExchange = mypageDAO.countExchange(id);
		int countReturn = mypageDAO.countReturn(id);
		int countRefund = mypageDAO.countRefund(id);
		
		JSONObject json = new JSONObject();
		json.put("paymentList", paymentList);
		json.put("countCoupon", countCoupon);
		json.put("countPayment", countPayment);
		
		json.put("countPending", countPending);
		json.put("countFinished", countFinished);
		json.put("countProcessing", countProcessing);
		json.put("countShipping", countShipping);
		json.put("countShipped", countShipped);
		json.put("countCancel", countCancel);
		json.put("countExchange", countExchange);
		json.put("countReturn", countReturn);
		json.put("countRefund", countRefund);
		
		return json;
	}
	
	@Override
	public JSONObject getPaymentInfo(String id) {
		List<PaymentDTO> paymentList = mypageDAO.getPaymentList(id);
		int countCoupon = mypageDAO.countCoupon(id);
		int countPayment = mypageDAO.countPayment(id);
		
		int countPending = mypageDAO.countPending(id);
		int countFinished = mypageDAO.countFinished(id);
		int countProcessing = mypageDAO.countProcessing(id);
		int countShipping = mypageDAO.countShipping(id);
		int countShipped = mypageDAO.countShipped(id);
		int countCancel = mypageDAO.countCancel(id);
		int countExchange = mypageDAO.countExchange(id);
		int countReturn = mypageDAO.countReturn(id);
		int countRefund = mypageDAO.countRefund(id);
		
		JSONObject json = new JSONObject();
		json.put("paymentList", paymentList);
		json.put("countCoupon", countCoupon);
		json.put("countPayment", countPayment);
		
		json.put("countPending", countPending);
		json.put("countFinished", countFinished);
		json.put("countProcessing", countProcessing);
		json.put("countShipping", countShipping);
		json.put("countShipped", countShipped);
		json.put("countCancel", countCancel);
		json.put("countExchange", countExchange);
		json.put("countReturn", countReturn);
		json.put("countRefund", countRefund);
		
		return json;
	}
	
	@Override
	public JSONObject getOrderList(String id, int pg) {
		int endNum = pg * 10;
		int startNum = endNum - 9;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		int totalA = mypageDAO.getOrderTotalA(id);
		int totalP = (totalA - 1) / 10 + 1;
		
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(10);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();

		List<PaymentDTO> paymentList = mypageDAO.getPaymentList2(map);
		int countCoupon = mypageDAO.countCoupon(id);
		int countPayment = mypageDAO.countPayment(id);
		
		JSONObject json = new JSONObject();
		json.put("paymentList", paymentList);
		json.put("countCoupon", countCoupon);
		json.put("countPayment", countPayment);
		json.put("boardPaging", boardPaging.getPagingHTML().toString());
		json.put("pg", pg);
		
		return json;
	}

	@Override
	public JSONObject getMyOrderInfo(String paymentCode) {
		List<PaymentDTO> paymentList = mypageDAO.getMyOrderInfo(paymentCode);

		JSONObject json = new JSONObject();
		json.put("paymentList", paymentList);

		return json;
	}
	
	@Override
	public JSONObject getCancelList(String id, int pg) {
		int endNum = pg * 10;
		int startNum = endNum - 9;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		int totalA = mypageDAO.getCancelTotalA(id);
		int totalP = (totalA - 1) / 10 + 1;
		
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(10);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();

		List<PaymentDTO> paymentList = mypageDAO.getPaymentList2(map);
		int countCoupon = mypageDAO.countCoupon(id);
		int countPayment = mypageDAO.countPayment(id);
		
		JSONObject json = new JSONObject();
		json.put("paymentList", paymentList);
		json.put("countCoupon", countCoupon);
		json.put("countPayment", countPayment);
		json.put("boardPaging", boardPaging.getPagingHTML().toString());
		json.put("pg", pg);
		
		return json;
	}
	
	@Override
	public JSONObject getShipmentList(String id, int pg) {
		int endNum = pg * 10;
		int startNum = endNum - 9;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		int totalA = mypageDAO.getShipmentTotalA(id);
		int totalP = (totalA - 1) / 10 + 1;
		
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(10);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();

		List<PaymentDTO> paymentList = mypageDAO.getPaymentList2(map);
		int countCoupon = mypageDAO.countCoupon(id);
		int countPayment = mypageDAO.countPayment(id);
		
		JSONObject json = new JSONObject();
		json.put("paymentList", paymentList);
		json.put("countCoupon", countCoupon);
		json.put("countPayment", countPayment);
		json.put("boardPaging", boardPaging.getPagingHTML().toString());
		json.put("pg", pg);
		
		return json;
	}
	
	@Override
	public void mypageShpMngWrite1(MypageShipmentDTO mypageShipmentDTO) {
		mypageDAO.mypageShpMngWrite1(mypageShipmentDTO);
	}

	@Override
	public List<MypageShipmentDTO> getShpMngList(String id) {
		return mypageDAO.getShpMngList(id);
	}

	@Override
	public MypageShipmentDTO getShpMngModify(String shipCode) {
		return mypageDAO.getShpMngModify(shipCode);
	}

	@Override
	public void updateShpMng(MypageShipmentDTO mypageShipmentDTO) {
		mypageDAO.updateShpMng(mypageShipmentDTO);
	}

	@Override
	public void deleteShpMng(String shipCode) {
		mypageDAO.deleteShpMng(shipCode);
		
	}

	@Override
	public void updateMyOrderCancel(PaymentDTO paymentDTO) {
		mypageDAO.updateMyOrderCancel(paymentDTO);
	}
	
	@Override
	public void updateMyOrderExchange(PaymentDTO paymentDTO) {
		mypageDAO.updateMyOrderExchange(paymentDTO);
	}
	
	@Override
	public void updateMyOrderReturn(PaymentDTO paymentDTO) {
		mypageDAO.updateMyOrderReturn(paymentDTO);
	}
	
	@Override
	public MemberRatingDTO getMypageRating(String id) {
		return mypageDAO.getMypageRating(id);
	}

	@Override
	public PaymentDTO getMyOrderCancelInfo(String paymentCode) {
		PaymentDTO paymentDTO = mypageDAO.getMyOrderCancelInfo(paymentCode);
		
		if(paymentDTO.getDetailReason() != null) {
			paymentDTO.setDetailReason(paymentDTO.getDetailReason().replace("\n", "<br>"));
		}
		
		return paymentDTO;
	}

	@Override
	public JSONObject getMyReorderInfo(String paymentCode, String id) {
		List<PaymentDTO> paymentList = mypageDAO.getMyOrderInfo(paymentCode);
		MemberDTO memberDTO = mypageDAO.getMypageMyInfo(id);
		List<MypageShipmentDTO> shipList = mypageDAO.getShpMngList(id); 
		
		JSONObject json = new JSONObject();
		if(paymentList != null) json.put("paymentList", paymentList);
		if(memberDTO != null) json.put("memberDTO", memberDTO);
		if(shipList != null) json.put("shipList", shipList);

		return json;
	}

}
