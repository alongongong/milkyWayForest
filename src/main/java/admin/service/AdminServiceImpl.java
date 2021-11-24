package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.AdminDAO;
import grade.bean.GradeDTO;
import product.bean.ProductDTO;
import qnaBoard.bean.QnaBoardDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;
		
	@Override
	public void pProductInsert(ProductDTO productDTO) {
		adminDAO.pProductInsert(productDTO);
		
	}

	@Override
	public List<ProductDTO> getProductList() {
		return adminDAO.getProductList();
	}

	@Override
	public void productUpdate(ProductDTO productDTO) {
		adminDAO.productUpdate(productDTO);
	}

	@Override
	public void productDelete(String productCode) {
		adminDAO.productDelete(productCode);
	}

	@Override
	public List<ProductDTO> getStock() {
		return adminDAO.getStock();
	}

	@Override
	public void stockUpdate(String productCode, int enterCount) {
		adminDAO.stockUpdate(productCode, enterCount);
	}

	@Override
	public List<QnaBoardDTO> getQnaBoard() {
		return adminDAO.getQnaBoard();
	}

	@Override
	public List<GradeDTO> getGradeBenefit() {
		return adminDAO.getGradeBenefit();
	}

	@Override
	public void updateGradeBenefit(GradeDTO gradeDTO) {
		adminDAO.updateGradeBenefit(gradeDTO);
	}

}
