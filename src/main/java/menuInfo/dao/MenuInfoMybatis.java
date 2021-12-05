package menuInfo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuInfoMybatis implements MenuInfoDAO {
	@Autowired
	private SqlSession sqlSession;
	
}
