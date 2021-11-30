package admin.service;

import java.util.List;

import org.json.simple.JSONObject;

import comment.bean.CommentDTO;
import grade.bean.GradeDTO;
import payment.bean.PaymentDTO;
import product.bean.ProductDTO;

public interface AdminService {

	public void pProductInsert(ProductDTO productDTO);

	public List<ProductDTO> getProductList();

	public void productUpdate(ProductDTO productDTO);

	public void productDelete(String productCode);

	public List<ProductDTO> getStock();

	public void stockUpdate(String productCode, int enterCount);

	public JSONObject getQnaBoard(int pg);

	public List<GradeDTO> getGradeBenefit();

	public void updateGradeBenefit(String welcome, String green, String gold);

	public JSONObject getMemberList(int pg);

	public Object qnaCommentInsert(CommentDTO qnaBoardDTO);

	public List<CommentDTO> getQnaCommentContent(int qnaCode);

	public List<PaymentDTO> getDailyOrder();

	

}
