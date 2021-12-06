package mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import comment.bean.CommentDTO;
import member.bean.MemberDTO;
import qnaBoard.bean.QnaBoardDTO;

@Repository 
@Transactional
public class MypageDAOMybatis implements MypageDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO getMypageMyInfo(String id) {
		return sqlSession.selectOne("mypageSQL.getMypageMyInfo", id);
	}

	@Override
	public MemberDTO mypagePwdCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne("mypageSQL.mypagePwdCheck", memberDTO);
	}

	@Override
	public void mypageMyInfoUpdate(MemberDTO memberDTO) {
		sqlSession.update("mypageSQL.mypageMyInfoUpdate", memberDTO);
	}

	@Override
	public void mypageMyInfoDelete(MemberDTO memberDTO) {
		sqlSession.delete("mypageSQL.mypageMyInfoDelete", memberDTO);
		
	}

	@Override
	public int getTotalA() {
		return sqlSession.selectOne("mypageSQL.getTotalA");
	}

	@Override
	public List<QnaBoardDTO> getMyQnaList(Map<String, String> map) {
		return sqlSession.selectList("mypageSQL.getMyQnaList", map);
	}

	@Override
	public QnaBoardDTO getMyQnaView(String qnaCode) {
		return sqlSession.selectOne("mypageSQL.getMyQnaView", qnaCode);
	}

	@Override
	public void updateMyQnaView(QnaBoardDTO qnaBoardDTO) {
		sqlSession.update("mypageSQL.updateMyQnaView", qnaBoardDTO);
	}

	@Override
	public List<CommentDTO> getMyQnaComment(int qnaCode) {
		return sqlSession.selectList("mypageSQL.getMyQnaComment", qnaCode);
	}

	@Override
	public void deleteMyQnaView(int qnaCode) {
		sqlSession.delete("mypageSQL.deleteMyQnaView", qnaCode);
	}

}
