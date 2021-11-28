package mypage.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository 
@Transactional
public class MypageDAOMybatis implements MypageDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public Map<String, String> getMypageMyInfo(String id) {
		return sqlSession.selectMap("mypageSQL.getMypageMyInfo", id);
	}
}
