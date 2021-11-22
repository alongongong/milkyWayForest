package login.service;

import member.bean.MemberDTO;

public interface LoginService {

	public MemberDTO login(MemberDTO memberDTO);

	public MemberDTO loginEmailCheck(MemberDTO memberDTO);

}
