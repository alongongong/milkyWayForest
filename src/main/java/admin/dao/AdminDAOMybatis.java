package admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import product.bean.ProductDTO;
import qnaBoard.bean.QnaBoardDTO;

@Repository
@Transactional
public class AdminDAOMybatis implements AdminDAO {
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

	@Override
	public List<ProductDTO> getStock() {
		return sqlSession.selectList("productSQL.getStock");
	}

	@Override
	public void stockUpdate(String productCode, int enterCount) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productCode", productCode);
		map.put("enterCount", enterCount);
		sqlSession.update("productSQL.stockUpdate", map);
	}

	@Override
	public List<QnaBoardDTO> getQnaBoard() {
		// TODO Auto-generated method stub
		return null;
	}
}
