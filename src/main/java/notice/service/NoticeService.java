package notice.service;

import org.json.simple.JSONObject;

import qnaBoard.bean.QnaBoardDTO;

public interface NoticeService {

	public void qnaBoardWrite(QnaBoardDTO qnaBoardDTO);

	public JSONObject getQnaBoard(int pg);

}
