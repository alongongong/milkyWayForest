package menuInfo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import menuInfo.bean.MenuInfoDTO;
import menuInfo.dao.MenuInfoDAO;
import paging.BoardPaging;

@Service
public class MenuInfoServiceImpl implements MenuInfoService {
	@Autowired
	private MenuInfoDAO menuInfoDAO;
	@Autowired
	private BoardPaging boardPaging;

	@Override
	public List<MenuInfoDTO> getDrink() {
		return menuInfoDAO.getDrink();
	}

	@Override
	public List<MenuInfoDTO> getFood() {
		return menuInfoDAO.getFood();
	}

	@Override
	public List<MenuInfoDTO> getTea() {
		return menuInfoDAO.getTea();
	}

	@Override
	public List<MenuInfoDTO> getCoffee() {
		return menuInfoDAO.getCoffee();
	}

	@Override
	public JSONObject getMenuInfo(String menuCode, int pg) {
		int endNum = pg * 16;
		int startNum = endNum - 15;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("menuCode", menuCode);
		
		int menuTotalA = menuInfoDAO.getMenuTotalA(menuCode);
		
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(16);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(menuTotalA);
		boardPaging.makePagingHTML();
		
		List<MenuInfoDTO> list = menuInfoDAO.getMenuInfo(map);
		
		JSONObject json = new JSONObject();
		if(list != null) {
			json.put("list", list);
		}
		
		json.put("boardPaging", boardPaging.getPagingHTML().toString());
		json.put("pg", pg);
		
		return json;
	}

	@Override
	public List<MenuInfoDTO> getFoodAll(String menuCode) {
		return menuInfoDAO.getFoodAll(menuCode);
	}

	@Override
	public MenuInfoDTO getMenuDetail(String menuCode) {
		MenuInfoDTO menuInfoDTO = menuInfoDAO.getMenuDetail(menuCode);
		menuInfoDTO.setMenuDetail(menuInfoDTO.getMenuDetail().replace("\\n", "<br>"));
		return menuInfoDTO;
	}

}
