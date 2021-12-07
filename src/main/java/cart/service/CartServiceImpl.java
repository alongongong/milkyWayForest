package cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cart.bean.CartDTO;
import cart.dao.CartDAO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;
	
	
	@Override
	public void cartInsert(CartDTO cartDTO) {
		cartDAO.cartInsert(cartDTO);
		
	}

	@Override
	public List<CartDTO> cartSelect(String id) {
		return cartDAO.cartSelect(id);
	}

	@Override
	public void cartQty(Map<String, Integer> map) {
		cartDAO.cartQty(map);
	}

}
