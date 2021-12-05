package findStore.service;

import java.util.List;

import findStore.bean.FindStoreDTO;

public interface FindStoreService {

	List<FindStoreDTO> getStore(double now_x, double now_y);

}
