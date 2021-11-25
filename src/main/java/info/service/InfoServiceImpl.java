package info.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import grade.bean.GradeDTO;
import info.bean.InfoDTO;
import info.dao.InfoDAO;

@Service
public class InfoServiceImpl implements InfoService {
	@Autowired
	private InfoDAO infoDAO;

	@Override
	public List<GradeDTO> getBenefit() {
		// TODO Auto-generated method stub
		return infoDAO.getBenefit();
	}

}
