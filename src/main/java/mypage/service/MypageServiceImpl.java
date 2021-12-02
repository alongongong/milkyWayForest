package mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import mypage.dao.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public MemberDTO getMypageMyInfo(String id) {
		return mypageDAO.getMypageMyInfo(id);
	}

	@Override
	public MemberDTO mypagePwdCheck(MemberDTO memberDTO) {
		return mypageDAO.mypagePwdCheck(memberDTO);
	}

	@Override
	public void mypageMyInfoUpdate(MemberDTO memberDTO) {
		mypageDAO.mypageMyInfoUpdate(memberDTO);
	}

	@Override
	public void mypageMyInfoDelete(MemberDTO memberDTO) {
		mypageDAO.mypageMyInfoDelete(memberDTO);
		
	}
}
