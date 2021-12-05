package findStore.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import findStore.bean.FindStoreDTO;

@Repository
public class FindStoreMybatis implements FindStoreDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<FindStoreDTO> getStore(Map<String, Double> map) {
		return sqlSession.selectList("findStoreSQL.getStore", map);
	}

}
