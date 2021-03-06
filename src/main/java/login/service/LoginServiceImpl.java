package login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import login.dao.LoginDAO;
import member.bean.MemberDTO;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginDAO loginDAO;

	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		return loginDAO.login(memberDTO);
	}

	@Override
	public MemberDTO loginEmailCheck(MemberDTO memberDTO) {
		return loginDAO.loginEmailCheck(memberDTO);
	}

	@Override
	public MemberDTO findIdQna(MemberDTO memberDTO) {
		return loginDAO.findIdQna(memberDTO);
	}

	@Override
	public MemberDTO loginIdCheck(String id) {
		return loginDAO.loginIdCheck(id);
	}

	@Override
	public void findPwdUpdate(MemberDTO memberDTO) {
		loginDAO.findPwdUpdate(memberDTO);
	}

	@Override
	public void kakaoWrite(MemberDTO memberDTO) {
		loginDAO.kakaoWrite(memberDTO);
		
	}

	@Override
	public void loginTime(String id) {
		loginDAO.loginTime(id);
	}

}
