package notice.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import qnaBoard.bean.QnaBoardDTO;

@Repository
public class NoticeDAOMybatis implements NoticeDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void qnaBoardWrite(QnaBoardDTO qnaBoardDTO) {
		sqlSession.insert("noticeSQL.qnaBoardWrite", qnaBoardDTO);
	}
}
