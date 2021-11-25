package notice.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<QnaBoardDTO> getQnaBoard(Map<String, Integer> map) {
		return sqlSession.selectList("noticeSQL.getQnaBoard", map);
	}


	@Override
	public int getTotalA() {
		return sqlSession.selectOne("noticeSQL.getTotalA");
	}

}
