package login.service;

import member.bean.MemberDTO;

public interface LoginService {

	public MemberDTO login(MemberDTO memberDTO);

	public MemberDTO loginEmailCheck(MemberDTO memberDTO);

	public MemberDTO findIdQna(MemberDTO memberDTO);

	public MemberDTO loginIdCheck(String id);

	public void findPwdUpdate(MemberDTO memberDTO);

	public void kakaoWrite(MemberDTO memberDTO);

}
