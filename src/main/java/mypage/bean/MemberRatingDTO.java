package mypage.bean;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberRatingDTO {
	private String id;
	private String name;
	private String nickname;
	private String pwd;
	private String gender;
	private int yy;
	private int mm;
	private int dd;
	private String tel1;
	private String tel2;
	private String tel3;
	private String email1;
	private String email2;
	private String writeDate;
	private String memberGrade; // 'welcome',	-- ȸ�����
	private int savedMoney; //					-- ������
	private String idPwdQuestion; //			-- ���̵���ã�� ����
	private String idPwdAnswer; //				-- ���̵���ã�� ��
	private String writePath; //				-- ���԰��
	private String loginTime; // sysdate			-- �α��� �ð�
	private String couponName; //				-- ������
	private String coupon;
	private String gradeName;
	private String gradeBenefit;
}
