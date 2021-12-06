package mypage.dao;

import java.util.List;
import java.util.Map;

import comment.bean.CommentDTO;
import member.bean.MemberDTO;
import qnaBoard.bean.QnaBoardDTO;

public interface MypageDAO {

	public MemberDTO getMypageMyInfo(String id);

	public MemberDTO mypagePwdCheck(MemberDTO memberDTO);

	public void mypageMyInfoUpdate(MemberDTO memberDTO);

	public void mypageMyInfoDelete(MemberDTO memberDTO);

	public int getTotalA();

	public List<QnaBoardDTO> getMyQnaList(Map<String, String> map);

	public QnaBoardDTO getMyQnaView(String qnaCode);

	public void updateMyQnaView(QnaBoardDTO qnaBoardDTO);

	public List<CommentDTO> getMyQnaComment(int qnaCode);

	public void deleteMyQnaView(int qnaCode);


}
