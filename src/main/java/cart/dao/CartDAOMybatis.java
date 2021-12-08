package cart.dao;

import java.util.HashMap;
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
	public void cartSelectDelete(String id,String[] check ) {
//		System.out.println(id);
//		System.out.println(check[0]);
//		System.out.println(check[1]);
		
		for(int i=0; i<check.length; i++) {
			Map<String,String> map= new HashMap<String,String>();
			map.put("id", id);
			map.put("cartCode", check[i]);
			sqlSession.delete("cartSQL.cartSelectDelete", map);  //체크하면서 카트코드를 들고오니까 포문이 체크한만큼 도는것,
			
		}
		
		
	}

}
