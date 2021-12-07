package mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comment.bean.CommentDTO;
import member.bean.MemberDTO;
import mypage.bean.MypageShipmentDTO;
import mypage.dao.MypageDAO;
import net.sf.json.JSONObject;
import paging.BoardPaging;
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
		
		int totalA = mypageDAO.getTotalA();
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

}
