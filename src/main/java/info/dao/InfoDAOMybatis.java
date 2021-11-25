package info.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import grade.bean.GradeDTO;

@Repository
public class InfoDAOMybatis implements InfoDAO {
	@Autowired
	private SqlSession sqlSession;
		
	@Override
	public List<GradeDTO> getBenefit() {

		return sqlSession.selectList("infoSQL.getBenefit");
	}
}
