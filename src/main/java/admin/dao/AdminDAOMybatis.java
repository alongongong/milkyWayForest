package admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import admin.bean.AdminDTO;
import comment.bean.CommentDTO;
import grade.bean.GradeDTO;
import member.bean.MemberDTO;
import payment.bean.PaymentDTO;
import product.bean.ProductDTO;
import qnaBoard.bean.QnaBoardDTO;
import shopping.bean.ReviewDTO;

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
	public List<QnaBoardDTO> getQnaBoard(Map<String, Integer> map) {
		return sqlSession.selectList("adminSQL.getQnaBoard", map);
	}

	@Override
	public List<GradeDTO> getGradeBenefit() {
		return sqlSession.selectList("adminSQL.getGradeBenefit");
	}

	@Override
	public void updateGradeBenefit(Map<String, String> map) {
		sqlSession.update("adminSQL.updateGradeBenefit", map);
	}

	@Override
	public int getTotalA() {
		return sqlSession.selectOne("adminSQL.getTotalA");
	}

	@Override
	public int getTotalMemA() {
		return sqlSession.selectOne("adminSQL.getTotalMemA");
	}

	@Override
	public List<MemberDTO> getMemberList(Map<String, Integer> map) {
		return sqlSession.selectList("adminSQL.getMemberList", map);
	}

	@Override
	public Object qnaCommentInsert(CommentDTO commentDTO) {
		return sqlSession.insert("adminSQL.qnaCommentInsert", commentDTO);
	}

	@Override
	public List<CommentDTO> getQnaCommentContent(int qnaCode) {
		return sqlSession.selectList("adminSQL.getQnaCommentContent", qnaCode);
	}

	@Override
	public List<PaymentDTO> getDailyOrder() {
		return sqlSession.selectList("adminSQL.getDailyOrder");
	}

	@Override
	public List<PaymentDTO> getOrderNShip() {
		return sqlSession.selectList("adminSQL.getOrderNShip");
	}

	@Override
	public List<PaymentDTO> getOrderCancel() {
		return sqlSession.selectList("adminSQL.getOrderCancel");
	}

	@Override
	public void shipBtn(Map<String, String> map) {
		sqlSession.update("adminSQL.shipBtn", map);
	}

	@Override
	public String adminlogin(AdminDTO adminDTO) {
		return sqlSession.selectOne("adminSQL.adminlogin", adminDTO);
	}

	@Override
	public int getReviewTotalA() {
		return sqlSession.selectOne("adminSQL.getReviewTotalA");
	}

	@Override
	public List<ReviewDTO> getReview(Map<String, Integer> map) {
		return sqlSession.selectList("adminSQL.getReview", map);
	}


}
