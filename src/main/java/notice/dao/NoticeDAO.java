package notice.dao;

import java.util.List;
import java.util.Map;

import qnaBoard.bean.QnaBoardDTO;

public interface NoticeDAO {

	public void qnaBoardWrite(QnaBoardDTO qnaBoardDTO);

	public List<QnaBoardDTO> getQnaBoard(Map<String, Integer> map);

	public int getTotalA();

}
