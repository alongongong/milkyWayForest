package menuInfo.dao;

import java.util.List;
import java.util.Map;

import menuInfo.bean.MenuInfoDTO;

public interface MenuInfoDAO {

	public List<MenuInfoDTO> getDrink();

	public List<MenuInfoDTO> getFood();

	public List<MenuInfoDTO> getTea();

	public List<MenuInfoDTO> getCoffee();

	public List<MenuInfoDTO> getMenuInfo(Map<String, Object> map);

	public int getMenuTotalA(String menuCode);

	public List<MenuInfoDTO> getFoodAll(String menuCode);

	public MenuInfoDTO getMenuDetail(String menuCode);

}
