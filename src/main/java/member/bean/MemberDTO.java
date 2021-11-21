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
	private String memberGrade; // 'welcome',	-- 회원등급
	private int savedMoney; //					-- 적립금
	private String idPwdQuestion; //			-- 아이디비번찾기 질문
	private String idPwdAnswer; //				-- 아이디비번찾기 답
	private String writePath; //				-- 가입경로
	private Date loginTime; // sysdate			-- 로그인 시간
	private String couponName; //				-- 쿠폰명
	private String coupon;
}
