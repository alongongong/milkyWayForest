package mypage.service;

import member.bean.MemberDTO;
import net.sf.json.JSONObject;
import qnaBoard.bean.QnaBoardDTO;

public interface MypageService {

	public MemberDTO getMypageMyInfo(String id);

	public MemberDTO mypagePwdCheck(MemberDTO memberDTO);

	public void mypageMyInfoUpdate(MemberDTO memberDTO);

	public void mypageMyInfoDelete(MemberDTO memberDTO);

	public JSONObject getMyQnaList(String id, int pg);

	public QnaBoardDTO getMyQnaView(String qnaCode);

}
