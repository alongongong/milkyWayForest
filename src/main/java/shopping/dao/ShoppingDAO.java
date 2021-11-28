package shopping.dao;

import java.util.List;

import shopping.bean.ShoppingDTO;

public interface ShoppingDAO {

	public List<ShoppingDTO> getShoppingList();

	public List<ShoppingDTO> getShoppingList2();

	public List<ShoppingDTO> getBeanNTeaList();

	public List<ShoppingDTO> getBeanNTeaList2();
}
