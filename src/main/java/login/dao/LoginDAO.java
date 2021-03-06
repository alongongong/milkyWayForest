package login.dao;

import member.bean.MemberDTO;

public interface LoginDAO {

	public MemberDTO login(MemberDTO memberDTO);

	public MemberDTO loginEmailCheck(MemberDTO memberDTO);

	public MemberDTO findIdQna(MemberDTO memberDTO);

	public MemberDTO loginIdCheck(String id);

	public void findPwdUpdate(MemberDTO memberDTO);

	public void kakaoWrite(MemberDTO memberDTO);

	public void loginTime(String id);

}
