package shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shopping.bean.ShoppingDTO;
import shopping.dao.ShoppingDAO;

@Service
public class ShoppingServiceImpl implements ShoppingService {
	@Autowired
	private ShoppingDAO shoppingDAO;

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
	public List<ShoppingDTO> getShoppingDetail() {
		return shoppingDAO.getShoppingDetail();
	}
	

	

}
