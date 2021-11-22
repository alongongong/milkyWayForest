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

}
