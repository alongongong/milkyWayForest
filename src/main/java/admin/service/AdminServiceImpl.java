package admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.AdminDAO;
import grade.bean.GradeDTO;
import oracle.net.aso.m;
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
	public void updateGradeBenefit(String welcome, String green, String gold) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("welcome", welcome);
		map.put("green", green);
		map.put("gold", gold);
		adminDAO.updateGradeBenefit(map);		
	}

}
