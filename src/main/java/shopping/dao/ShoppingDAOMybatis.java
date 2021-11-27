package shopping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shopping.bean.ShoppingDTO;


@Repository
public class ShoppingDAOMybatis implements ShoppingDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ShoppingDTO> getShoppingList() {
		return sqlSession.selectList("shoppingSQL.getShoppingList");
	}

	@Override
	public List<ShoppingDTO> getShoppingList2() {
		return sqlSession.selectList("shoppingSQL.getShoppingList2");
	}

	

}
