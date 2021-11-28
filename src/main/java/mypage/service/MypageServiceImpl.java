package mypage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mypage.dao.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public Map<String, String> getMypageMyInfo(String id) {
		//System.out.println(mypageDAO.getMypageMyInfo(id));
		return mypageDAO.getMypageMyInfo(id);
	}
}
