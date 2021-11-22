package product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import product.bean.ProductDTO;

@Repository
@Transactional
public class ProductDAOMybatis implements ProductDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void pProductInsert(ProductDTO productDTO) {
		sqlSession.insert("productSQL.pProductInsert", productDTO);
		
	}

	@Override
	public List<ProductDTO> getProductList() {
		return sqlSession.selectList("productSQL.getProductList");
	}

	@Override
	public void productUpdate(ProductDTO productDTO) {
		sqlSession.update("productSQL.productUpdate", productDTO);
	}

	@Override
	public void productDelete(String productCode) {
		sqlSession.delete("productSQL.productDelete", productCode);
	}
}
