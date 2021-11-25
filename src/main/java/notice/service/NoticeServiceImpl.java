package notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
			json.put("boardPaging", boardPaging.getPagingHTML().toString());
			json.put("pg", pg);
		}
		
		return json;
	}
}
