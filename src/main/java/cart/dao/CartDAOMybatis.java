package cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cart.bean.CartDTO;

@Repository
@Transactional
public class CartDAOMybatis implements CartDAO {
	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	public void cartInsert(CartDTO cartDTO) {
		sqlSession.insert("cartSQL.cartInsert", cartDTO);
		
	}

	@Override
	public List<CartDTO> cartSelect(String id) {
		return sqlSession.selectList("cartSQL.cartSelect", id);
	}

	@Override
	public void cartQty(Map<String, Integer> map) {
	  sqlSession.update("cartSQL.cartQty", map);
	}

	@Override
	public void cartAllDelete(String id) {
		sqlSession.delete("cartSQL.cartAllDelete", id);
		
	}

	@Override
	public void cartSelectDelete(String id) {
		sqlSession.delete("cartSQL.cartSelectDelete", id);
		
	}

}
