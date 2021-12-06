package cart.dao;

import java.util.List;

import cart.bean.CartDTO;

public interface CartDAO {

	public void cartInsert(CartDTO cartDTO);

	public List<CartDTO> cartSelect(String id);

}
