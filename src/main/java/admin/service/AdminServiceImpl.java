package admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.AdminDAO;
import grade.bean.GradeDTO;
import member.bean.MemberDTO;
import paging.BoardPaging;
import product.bean.ProductDTO;
import qnaBoard.bean.QnaBoardDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private BoardPaging boardPaging;
		
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
	public JSONObject getQnaBoard(int pg) {
		int endNum = pg * 10;
		int startNum = endNum - 9;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		int totalA = adminDAO.getTotalA();
		int totalP = (totalA - 1) / 10 + 1;
		
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(10);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		List<QnaBoardDTO> list = adminDAO.getQnaBoard(map);
		
		JSONObject json = new JSONObject();
		
		if(list != null) {
			json.put("list", list);
			json.put("boardPaging", boardPaging.getPagingHTML().toString());
			json.put("pg", pg);
		}
		
		return json;
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

	@Override
	public JSONObject getMemberList(int pg) {
		int endNum = pg * 20;
		int startNum = endNum - 19;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		int totalMemA = adminDAO.getTotalMemA();
		int totalMemP = (totalMemA - 1) / 20 + 1;
		
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(10);
		boardPaging.setPageSize(20);
		boardPaging.setTotalA(totalMemA);
		boardPaging.makePagingHTML();
		
		List<MemberDTO> list = adminDAO.getMemberList(map);
		return null;
	}

}
