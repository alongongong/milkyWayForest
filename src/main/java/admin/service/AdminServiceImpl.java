package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.bean.ProductDTO;
import product.dao.ProductDAO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private ProductDAO productDAO;
		
	@Override
	public void pProductInsert(ProductDTO productDTO) {
		productDAO.pProductInsert(productDTO);
		
	}

	@Override
	public List<ProductDTO> getProductList() {
		return productDAO.getProductList();
	}

	@Override
	public void productUpdate(ProductDTO productDTO) {
		productDAO.productUpdate(productDTO);
	}

	@Override
	public void productDelete(String productCode) {
		productDAO.productDelete(productCode);
	}

}
