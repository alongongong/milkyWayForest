package login.dao;

import member.bean.MemberDTO;

public interface LoginDAO {

	public MemberDTO login(MemberDTO memberDTO);

	public MemberDTO loginEmailCheck(MemberDTO memberDTO);

}
