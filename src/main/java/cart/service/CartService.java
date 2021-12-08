package cart.service;

import java.util.List;
import java.util.Map;

import cart.bean.CartDTO;


public interface CartService {

	public void cartInsert(CartDTO cartDTO);

	public List<CartDTO> cartSelect(String id);

	public void cartQty(Map<String, Integer> map);

	public void cartAllDelete(String id);

	public void cartSelectDelete(String id,String[] check);
	
}
