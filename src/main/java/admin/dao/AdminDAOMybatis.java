package admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import grade.bean.GradeDTO;
import product.bean.ProductDTO;
import qnaBoard.bean.QnaBoardDTO;

@Repository
@Transactional
public class AdminDAOMybatis implements AdminDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void pProductInsert(ProductDTO productDTO) {
		sqlSession.insert("adminSQL.pProductInsert", productDTO);
		
	}

	@Override
	public List<ProductDTO> getProductList() {
		return sqlSession.selectList("adminSQL.getProductList");
	}

	@Override
	public void productUpdate(ProductDTO productDTO) {
		sqlSession.update("adminSQL.productUpdate", productDTO);
	}

	@Override
	public void productDelete(String productCode) {
		sqlSession.delete("adminSQL.productDelete", productCode);
	}

	@Override
	public List<ProductDTO> getStock() {
		return sqlSession.selectList("adminSQL.getStock");
	}

	@Override
	public void stockUpdate(String productCode, int enterCount) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productCode", productCode);
		map.put("enterCount", enterCount);
		sqlSession.update("adminSQL.stockUpdate", map);
	}

	@Override
	public List<QnaBoardDTO> getQnaBoard() {
		return sqlSession.selectList("adminSQL.getQnaBoard");
	}

	@Override
	public List<GradeDTO> getGradeBenefit() {
		return sqlSession.selectList("adminSQL.getGradeBenefit");
	}

	@Override
	public void updateGradeBenefit(Map<String, String> map) {
		sqlSession.update("adminSQL.updateGradeBenefit", map);
	}
}
