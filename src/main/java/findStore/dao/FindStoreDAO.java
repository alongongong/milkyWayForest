package findStore.dao;

import java.util.List;
import java.util.Map;

import findStore.bean.FindStoreDTO;

public interface FindStoreDAO {

	List<FindStoreDTO> getStore(Map<String, Double> map);

}
