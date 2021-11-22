package product.dao;

import java.util.List;

import product.bean.ProductDTO;

public interface ProductDAO {

	public void pProductInsert(ProductDTO productDTO);

	public List<ProductDTO> getProductList();

	public void productUpdate(ProductDTO productDTO);

	public void productDelete(String productCode);

}
