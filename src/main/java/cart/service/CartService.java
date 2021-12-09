package cart.service;

import java.util.List;
import java.util.Map;

import cart.bean.CartDTO;


public interface CartService {

	public void cartInsert(CartDTO cartDTO);

	public List<CartDTO> cartSelect(String memId);

	public void cartQty(Map<String, Integer> map);

	public void cartAllDelete(String memId);

	public void cartSelectDelete(String memId,String[] check);
	
}
