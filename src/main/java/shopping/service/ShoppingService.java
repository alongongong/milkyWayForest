package shopping.service;

import java.util.List;

import org.json.simple.JSONObject;

import shopping.bean.ShoppingDTO;

public interface ShoppingService {

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
	
	public int productSelect(String memId, String productCode);

	public JSONObject getReview(String productCode, int pg);
	
	
	

}
