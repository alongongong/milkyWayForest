package mypage.dao;

import member.bean.MemberDTO;

public interface MypageDAO {

	public MemberDTO getMypageMyInfo(String id);

	public MemberDTO mypagePwdCheck(MemberDTO memberDTO);

	public void mypageMyInfoUpdate(MemberDTO memberDTO);

}
