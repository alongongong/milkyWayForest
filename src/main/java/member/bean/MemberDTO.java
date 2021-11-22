package member.bean;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
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
	private Date writeDate;
	private String memberGrade; // 'welcome',	-- ȸ�����
	private int savedMoney; //					-- ������
	private String idPwdQuestion; //			-- ���̵���ã�� ����
	private String idPwdAnswer; //				-- ���̵���ã�� ��
	private String writePath; //				-- ���԰��
	private Date loginTime; // sysdate			-- �α��� �ð�
	private String couponName; //				-- ������
	private String coupon;
}
