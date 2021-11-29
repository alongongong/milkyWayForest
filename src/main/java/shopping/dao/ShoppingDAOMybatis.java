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

	@Override
	public List<ShoppingDTO> getBeanNTeaList() {
		return sqlSession.selectList("shoppingSQL.getBeanNTeaList");
	}

	@Override
	public List<ShoppingDTO> getBeanNTeaList2() {
		return sqlSession.selectList("shoppingSQL.getBeanNTeaList2");
	}

	@Override
	public List<ShoppingDTO> getBeanList() {
		return sqlSession.selectList("shoppingSQL.getBeanList");
	}

	@Override
	public List<ShoppingDTO> getTeaList() {
		return sqlSession.selectList("shoppingSQL.getTeaList");
	}

	@Override
	public List<ShoppingDTO> getProductList() {
		return sqlSession.selectList("shoppingSQL.getProductList");
	}

	@Override
	public List<ShoppingDTO> getProductList2() {
		return sqlSession.selectList("shoppingSQL.getProductList2");
	}

	@Override
	public List<ShoppingDTO> getProductList3() {
		return sqlSession.selectList("shoppingSQL.getProductList3");
	}

	@Override
	public List<ShoppingDTO> getProductList4() {
		return sqlSession.selectList("shoppingSQL.getProductList4");
	}

	@Override
	public List<ShoppingDTO> getProductList5() {
		return sqlSession.selectList("shoppingSQL.getProductList5");
	}

	@Override
	public List<ShoppingDTO> getProductList6() {
		return sqlSession.selectList("shoppingSQL.getProductList6");
	}

	@Override
	public List<ShoppingDTO> getMugList() {
		return sqlSession.selectList("shoppingSQL.getMugList");
	}

	@Override
	public List<ShoppingDTO> getGlassList() {
		return sqlSession.selectList("shoppingSQL.getGlassList");
	}

	@Override
	public List<ShoppingDTO> getPlasticTumblrList() {
		return sqlSession.selectList("shoppingSQL.getPlasticTumblrList");
	}

	@Override
	public List<ShoppingDTO> getStainlessTumblrList() {
		return sqlSession.selectList("shoppingSQL.getStainlessTumblrList");
	}

	@Override
	public List<ShoppingDTO> getThermosList() {
		return sqlSession.selectList("shoppingSQL.getThermosList");
	}

	@Override
	public List<ShoppingDTO> getCoffeeEtcList() {
		return sqlSession.selectList("shoppingSQL.getCoffeeEtcList");
	}

	@Override
	public List<ShoppingDTO> getShoppingDetail() {
		return sqlSession.selectList("shoppingSQL.getShoppingDetail");
	}

	

}
