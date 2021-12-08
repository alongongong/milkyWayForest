package notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comment.bean.CommentDTO;
import notice.bean.EventBoardDTO;
import notice.bean.FaqBoardDTO;
import notice.bean.NoticeBoardDTO;
import notice.dao.NoticeDAO;
import paging.BoardPaging;
import qnaBoard.bean.QnaBoardDTO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private BoardPaging boardPaging;

	@Override
	public void qnaBoardWrite(QnaBoardDTO qnaBoardDTO) {
		noticeDAO.qnaBoardWrite(qnaBoardDTO);
	}

	@Override
	public JSONObject getQnaBoard(int pg) {
		int endNum = pg * 10;
		int startNum = endNum - 9;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		int totalA = noticeDAO.getTotalA();
		int totalP = (totalA - 1) / 10 + 1;
		
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(10);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();		
		
		List<QnaBoardDTO> list =  noticeDAO.getQnaBoard(map);
		
		JSONObject json = new JSONObject();
		
		if(list != null) {
			json.put("list", list);
		}
		
		json.put("boardPaging", boardPaging.getPagingHTML().toString());
		json.put("pg", pg);

		return json;
	}

	@Override
	public JSONObject getNoticeBoard(int pg) {
		int endNum = pg * 7;
		int startNum = pg - 6;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		int noticeTotalA = noticeDAO.getNoticeTotalA();
		int noticeTotalP = (noticeTotalA - 1) / 7 + 1;
		
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(7);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(noticeTotalA);
		boardPaging.makePagingHTML();
		
		List<NoticeBoardDTO> list = noticeDAO.getNoticeBoard(map);
		
		JSONObject json = new JSONObject();
		
		if(list != null) {
			json.put("list", list);
		}
		
		json.put("pg", pg);
		json.put("boardPaging", boardPaging.getPagingHTML().toString());

		return json;
	}

	@Override
	public NoticeBoardDTO getNoticeView(String noticeCode) {
		NoticeBoardDTO noticeBoardDTO = noticeDAO.getNoticeView(noticeCode);
		if(noticeBoardDTO.getNoticeContent() != null) {
			noticeBoardDTO.setNoticeContent(noticeBoardDTO.getNoticeContent().replace("\n", "<br>"));
		}
		
		return noticeBoardDTO;
	}

	@Override
	public List<EventBoardDTO> getEventBoard() {
		return noticeDAO.getEventBoard();
	}

	@Override
	public List<EventBoardDTO> getEventView(String eventCode) {
		return noticeDAO.getEventView(eventCode);
	}

	@Override
	public JSONObject getFaqBoard(int pg) {
		int endNum = pg * 7;
		int startNum = endNum - 6;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		int faqTotalA = noticeDAO.getFaqTotalA();
		
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(7);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(faqTotalA);
		boardPaging.makePagingHTML();
		
		List<FaqBoardDTO> list = noticeDAO.getFaqBoard(map);
		
		JSONObject json = new JSONObject();
		
		if(list != null) {
			for(FaqBoardDTO faqBoardDTO : list) {
				faqBoardDTO.setFaqContent(faqBoardDTO.getFaqContent().replace("\n","<br>"));
			}
			json.put("list", list);
		}
		
		json.put("pg", pg);
		json.put("boardPaging", boardPaging.getPagingHTML().toString());
		
		return json;
	}

	@Override
	public List<NoticeBoardDTO> noticeSearch(String search) {
		return noticeDAO.noticeSearch(search);
	}

	@Override
	public List<CommentDTO> getQnaComment(int qnaCode) {
		return noticeDAO.getQnaComment(qnaCode);
	}
}
