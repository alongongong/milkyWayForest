package member.service;

import member.bean.MemberDTO;

public interface MemberWriteService {

	public MemberDTO writeEmailCheck(MemberDTO memberDTO);

	public MemberDTO writeIdCheck(String id);

	public void write(MemberDTO memberDTO);

}
