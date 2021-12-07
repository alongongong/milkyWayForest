package menuInfo.service;

import java.util.List;

import org.json.simple.JSONObject;

import menuInfo.bean.MenuInfoDTO;

public interface MenuInfoService {

	public List<MenuInfoDTO> getDrink();

	public List<MenuInfoDTO> getFood();

	public List<MenuInfoDTO> getTea();

	public List<MenuInfoDTO> getCoffee();

	public JSONObject getMenuInfo(String menuCode, int pg);

	public List<MenuInfoDTO> getFoodAll(String menuCode);

	public MenuInfoDTO getMenuDetail(String menuCode);

}
