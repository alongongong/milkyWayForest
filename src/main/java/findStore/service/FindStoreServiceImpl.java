package findStore.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import findStore.bean.FindStoreDTO;
import findStore.dao.FindStoreDAO;

@Service
public class FindStoreServiceImpl implements FindStoreService {

	@Autowired
	private FindStoreDAO findStoreDAO;
	
	@Override
	public List<FindStoreDTO> getStore(double now_x, double now_y) {
		Map<String, Double> map = new HashMap<String, Double>();
		map.put("now_x", now_x);
		map.put("now_y", now_y);
		
		return findStoreDAO.getStore(map);
	}


}
