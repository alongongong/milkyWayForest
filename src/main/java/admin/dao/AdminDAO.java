package admin.dao;

import java.util.List;
import java.util.Map;

import admin.bean.AdminDTO;
import comment.bean.CommentDTO;
import grade.bean.GradeDTO;
import member.bean.MemberDTO;
import payment.bean.PaymentDTO;
import product.bean.ProductDTO;
import qnaBoard.bean.QnaBoardDTO;
import shopping.bean.ReviewDTO;

public interface AdminDAO {

	public void pProductInsert(ProductDTO productDTO);

	public List<ProductDTO> getProductList();

	public void productUpdate(ProductDTO productDTO);

	public void productDelete(String productCode);

	public List<ProductDTO> getStock();

	public void stockUpdate(String productCode, int enterCount);

	public List<QnaBoardDTO> getQnaBoard(Map<String, Integer> map);

	public List<GradeDTO> getGradeBenefit();

	public void updateGradeBenefit(Map<String, String> map);

	public int getTotalA();

	public int getTotalMemA();

	public List<MemberDTO> getMemberList(Map<String, Integer> map);

	public Object qnaCommentInsert(CommentDTO commentDTO);

	public List<CommentDTO> getQnaCommentContent(int qnaCode);

	public List<PaymentDTO> getDailyOrder();

	public List<PaymentDTO> getOrderNShip();

	public List<PaymentDTO> getOrderCancel();

	public void shipBtn(Map<String, String> map);
	
	public String adminlogin(AdminDTO adminDTO);

	public int getReviewTotalA();

	public List<ReviewDTO> getReview(Map<String, Integer> map);
	
}
