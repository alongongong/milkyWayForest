package mypage.service;

import member.bean.MemberDTO;

public interface MypageService {

	public MemberDTO getMypageMyInfo(String id);

	public MemberDTO mypagePwdCheck(MemberDTO memberDTO);

}
