package admin.service;

import java.util.List;

import product.bean.ProductDTO;

public interface AdminService {

	public void pProductInsert(ProductDTO productDTO);

	public List<ProductDTO> getProductList();

	public void productUpdate(ProductDTO productDTO);

	public void productDelete(String productCode);

	public List<ProductDTO> getStock();

	public void stockUpdate(String productCode, int enterCount);

}
