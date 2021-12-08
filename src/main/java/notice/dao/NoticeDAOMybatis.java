package notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import comment.bean.CommentDTO;
import notice.bean.EventBoardDTO;
import notice.bean.FaqBoardDTO;
import notice.bean.NoticeBoardDTO;
import qnaBoard.bean.QnaBoardDTO;

@Transactional
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

	@Override
	public int getNoticeTotalA() {
		return sqlSession.selectOne("noticeSQL.getNoticeTotalA");
	}

	@Override
	public List<NoticeBoardDTO> getNoticeBoard(Map<String, Integer> map) {
		return sqlSession.selectList("noticeSQL.getNoticeBoard", map);
	}

	@Override
	public NoticeBoardDTO getNoticeView(String noticeCode) {
		return sqlSession.selectOne("noticeSQL.getNoticeView", noticeCode);
	}

	@Override
	public List<EventBoardDTO> getEventBoard() {
		return sqlSession.selectList("noticeSQL.getEventBoard");
	}

	@Override
	public List<EventBoardDTO> getEventView(String eventCode) {
		return sqlSession.selectList("noticeSQL.getEventView", eventCode);
	}

	@Override
	public int getFaqTotalA() {
		return sqlSession.selectOne("noticeSQL.getFaqTotalA");
	}

	@Override
	public List<FaqBoardDTO> getFaqBoard(Map<String, Integer> map) {
		return sqlSession.selectList("noticeSQL.getFaqBoard", map);
	}

	@Override
	public List<NoticeBoardDTO> noticeSearch(String search) {
		return sqlSession.selectList("noticeSQL.noticeSearch", search);
	}

	@Override
	public List<CommentDTO> getQnaComment(int qnaCode) {
		return sqlSession.selectList("noticeSQL.getQnaComment", qnaCode);
	}

}
