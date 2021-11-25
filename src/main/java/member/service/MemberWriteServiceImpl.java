package member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberWriteDAO;

@Service
public class MemberWriteServiceImpl implements MemberWriteService {

	@Autowired
	private MemberWriteDAO memberWriteDAO;
	
	@Override
	public MemberDTO writeEmailCheck(MemberDTO memberDTO) {
		return memberWriteDAO.writeEmailCheck(memberDTO);
	}

	@Override
	public MemberDTO writeIdCheck(String id) {
		return memberWriteDAO.writeIdCheck(id);
	}

	@Override
	public void write(MemberDTO memberDTO) {
		memberWriteDAO.write(memberDTO);
		
	}

}
