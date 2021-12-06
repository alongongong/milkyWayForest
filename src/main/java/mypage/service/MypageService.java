package mypage.service;

import java.util.List;

import comment.bean.CommentDTO;
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

	public void updateMyQnaView(QnaBoardDTO qnaBoardDTO);

	public List<CommentDTO> getMyQnaComment(int qnaCode);

	public void deleteMyQnaView(int qnaCode);

}
