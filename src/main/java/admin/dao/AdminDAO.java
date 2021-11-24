package admin.dao;

import java.util.List;
import java.util.Map;

import grade.bean.GradeDTO;
import product.bean.ProductDTO;
import qnaBoard.bean.QnaBoardDTO;

public interface AdminDAO {

	public void pProductInsert(ProductDTO productDTO);

	public List<ProductDTO> getProductList();

	public void productUpdate(ProductDTO productDTO);

	public void productDelete(String productCode);

	public List<ProductDTO> getStock();

	public void stockUpdate(String productCode, int enterCount);

	public List<QnaBoardDTO> getQnaBoard();

	public List<GradeDTO> getGradeBenefit();

	public void updateGradeBenefit(Map<String, String> map);
}
