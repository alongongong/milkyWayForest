package mypage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

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
}
