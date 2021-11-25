package member.dao;

import member.bean.MemberDTO;

public interface MemberWriteDAO {

	public MemberDTO writeEmailCheck(MemberDTO memberDTO);

	public MemberDTO writeIdCheck(String id);

	public void write(MemberDTO memberDTO);

}
