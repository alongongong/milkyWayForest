package notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import notice.dao.NoticeDAO;
import qnaBoard.bean.QnaBoardDTO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public void qnaBoardWrite(QnaBoardDTO qnaBoardDTO) {
		noticeDAO.qnaBoardWrite(qnaBoardDTO);
	}
}
