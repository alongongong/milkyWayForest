package admin.service;

import java.util.List;

import grade.bean.GradeDTO;
import product.bean.ProductDTO;
import qnaBoard.bean.QnaBoardDTO;

public interface AdminService {

	public void pProductInsert(ProductDTO productDTO);

	public List<ProductDTO> getProductList();

	public void productUpdate(ProductDTO productDTO);

	public void productDelete(String productCode);

	public List<ProductDTO> getStock();

	public void stockUpdate(String productCode, int enterCount);

	public List<QnaBoardDTO> getQnaBoard();

	public List<GradeDTO> getGradeBenefit();

	public void updateGradeBenefit(String welcome, String green, String gold);

	

}
