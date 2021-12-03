package notice.dao;

import java.util.List;
import java.util.Map;

import notice.bean.EventBoardDTO;
import notice.bean.FaqBoardDTO;
import notice.bean.NoticeBoardDTO;
import qnaBoard.bean.QnaBoardDTO;

public interface NoticeDAO {

	public void qnaBoardWrite(QnaBoardDTO qnaBoardDTO);

	public List<QnaBoardDTO> getQnaBoard(Map<String, Integer> map);

	public int getTotalA();

	public int getNoticeTotalA();

	public List<NoticeBoardDTO> getNoticeBoard(Map<String, Integer> map);

	public NoticeBoardDTO getNoticeView(String noticeCode);

	public List<EventBoardDTO> getEventBoard();

	public List<EventBoardDTO> getEventView(String eventCode);

	public int getFaqTotalA();

	public List<FaqBoardDTO> getFaqBoard(Map<String, Integer> map);

}
