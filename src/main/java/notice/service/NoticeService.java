package notice.service;

import java.util.List;

import org.json.simple.JSONObject;

import comment.bean.CommentDTO;
import notice.bean.EventBoardDTO;
import notice.bean.FaqBoardDTO;
import notice.bean.NoticeBoardDTO;
import qnaBoard.bean.QnaBoardDTO;

public interface NoticeService {

	public void qnaBoardWrite(QnaBoardDTO qnaBoardDTO);

	public JSONObject getQnaBoard(int pg);

	public JSONObject getNoticeBoard(int pg);

	public NoticeBoardDTO getNoticeView(String noticeCode);

	public List<EventBoardDTO> getEventBoard();

	public List<EventBoardDTO> getEventView(String eventCode);

	public JSONObject getFaqBoard(int pg);

	public List<NoticeBoardDTO> noticeSearch(String search);

	public List<CommentDTO> getQnaComment(int qnaCode);

}
