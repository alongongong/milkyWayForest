package member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

@Repository
@Transactional
public class MemberWriteMybatis implements MemberWriteDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO writeEmailCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne("writeSQL.writeEmailCheck", memberDTO);
	}
	@Override
	public MemberDTO writeIdCheck(String id) {
		return sqlSession.selectOne("writeSQL.writeIdCheck", id);
	}

	@Override
	public void write(MemberDTO memberDTO) {
		sqlSession.insert("writeSQL.write", memberDTO);
	}
}
