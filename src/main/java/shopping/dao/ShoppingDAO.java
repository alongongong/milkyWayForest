package shopping.dao;

import java.util.List;
import java.util.Map;

import shopping.bean.ReviewDTO;
import shopping.bean.ShoppingDTO;

public interface ShoppingDAO {

	public List<ShoppingDTO> getShoppingList();

	public List<ShoppingDTO> getShoppingList2();

	public List<ShoppingDTO> getBeanNTeaList();

	public List<ShoppingDTO> getBeanNTeaList2();

	public List<ShoppingDTO> getBeanList();

	public List<ShoppingDTO> getTeaList();

	public List<ShoppingDTO> getProductList();

	public List<ShoppingDTO> getProductList2();

	public List<ShoppingDTO> getProductList3();

	public List<ShoppingDTO> getProductList4();

	public List<ShoppingDTO> getProductList5();

	public List<ShoppingDTO> getProductList6();

	public List<ShoppingDTO> getMugList();

	public List<ShoppingDTO> getGlassList();

	public List<ShoppingDTO> getPlasticTumblrList();

	public List<ShoppingDTO> getStainlessTumblrList();

	public List<ShoppingDTO> getThermosList();

	public List<ShoppingDTO> getCoffeeEtcList();

	public List<ShoppingDTO> getShoppingDetail(String productCode);

	public ShoppingDTO clickImg(String productCode);
	
	public int productSelect(Map<String, String> map);

	public int getReviewTotalA(String productCode);

	public List<ReviewDTO> getReview(Map<String, Object> map);

	public void reviewInsert(ReviewDTO reviewDTO);

	public void insertWishList(Map<String, String> map);

	public String getWishProduct(Map<String, String> map);
	
}
