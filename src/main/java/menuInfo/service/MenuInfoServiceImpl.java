package menuInfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import menuInfo.dao.MenuInfoDAO;

@Service
public class MenuInfoServiceImpl implements MenuInfoService {
	@Autowired
	private MenuInfoDAO menuInfoDAO;
}
