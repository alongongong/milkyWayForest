package shopping.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import paging.BoardPaging;
import shopping.bean.ReviewDTO;
import shopping.bean.ShoppingDTO;
import shopping.dao.ShoppingDAO;

@Service
public class ShoppingServiceImpl implements ShoppingService {
	@Autowired
	private ShoppingDAO shoppingDAO;
	@Autowired
	private BoardPaging boardPaging;

	@Override
	public List<ShoppingDTO> getShoppingList() {
		return shoppingDAO.getShoppingList();
	}

	@Override
	public List<ShoppingDTO> getShoppingList2() {
		return shoppingDAO.getShoppingList2();
	}

	@Override
	public List<ShoppingDTO> getBeanNTeaList() {
		return shoppingDAO.getBeanNTeaList();
	}

	@Override
	public List<ShoppingDTO> getBeanNTeaList2() {
		return shoppingDAO.getBeanNTeaList2();
	}

	@Override
	public List<ShoppingDTO> getBeanList() {
		return shoppingDAO.getBeanList();
	}

	@Override
	public List<ShoppingDTO> getTeaList() {
		return shoppingDAO.getTeaList();
	}

	@Override
	public List<ShoppingDTO> getProductList() {
		return shoppingDAO.getProductList();
	}

	@Override
	public List<ShoppingDTO> getProductList2() {
		return shoppingDAO.getProductList2();
	}

	@Override
	public List<ShoppingDTO> getProductList3() {
		return shoppingDAO.getProductList3();
	}

	@Override
	public List<ShoppingDTO> getProductList4() {
		return shoppingDAO.getProductList4();
	}

	@Override
	public List<ShoppingDTO> getProductList5() {
		return shoppingDAO.getProductList5();
	}

	@Override
	public List<ShoppingDTO> getProductList6() {
		return shoppingDAO.getProductList6();
	}

	@Override
	public List<ShoppingDTO> getMugList() {
		return shoppingDAO.getMugList();
	}

	@Override
	public List<ShoppingDTO> getGlassList() {
		return shoppingDAO.getGlassList();
	}

	@Override
	public List<ShoppingDTO> getPlasticTumblrList() {
		return shoppingDAO.getPlasticTumblrList();
	}

	@Override
	public List<ShoppingDTO> getStainlessTumblrList() {
		return shoppingDAO.getStainlessTumblrList();
	}

	@Override
	public List<ShoppingDTO> getThermosList() {
		return shoppingDAO.getThermosList();
	}

	@Override
	public List<ShoppingDTO> getCoffeeEtcList() {
		return shoppingDAO.getCoffeeEtcList();
	}

	@Override
	public List<ShoppingDTO> getShoppingDetail(String productCode) {  //함수를 만들때는 자료형을 꼭 써줘야하고
		return shoppingDAO.getShoppingDetail(productCode);  //함수를 호출할떄는 변수명만 쓰면된다.
	}

	@Override
	public ShoppingDTO clickImg(String productCode) {
		return shoppingDAO.clickImg(productCode);
	}



	@Override
	public int productSelect(String memId, String productCode) {
		Map<String,String> map = new HashMap<String,String>();
	
		map.put("id", memId);
		map.put("productCode", productCode);
		
		
		return shoppingDAO.productSelect(map);
	}

	@Override
	public JSONObject getReview(String productCode, int pg) {
		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("productCode", productCode);
		
		int reviewTotalA = shoppingDAO.getReviewTotalA(productCode);
		
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(5);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(reviewTotalA);
		boardPaging.makePagingHTML();
		
		List<ReviewDTO> list = shoppingDAO.getReview(map);
		
		JSONObject json = new JSONObject();
		
		if(list != null) {
			json.put("list", list);
		}
		json.put("pg", pg);
		json.put("boardpaging", boardPaging.getPagingHTML().toString());
		
		return json;
	}
		

}
