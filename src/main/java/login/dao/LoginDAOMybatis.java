package login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

@Repository 
@Transactional
public class LoginDAOMybatis implements LoginDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		return sqlSession.selectOne("loginSQL.login", memberDTO);
		
	}

	@Override
	public MemberDTO loginEmailCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne("loginSQL.loginEmailCheck", memberDTO);
	}

}
