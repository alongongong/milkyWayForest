package cart.service;

import java.util.List;

import cart.bean.CartDTO;


public interface CartService {

	public void cartInsert(CartDTO cartDTO);

	public List<CartDTO> cartSelect(String id);
	
}
