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

	

}
