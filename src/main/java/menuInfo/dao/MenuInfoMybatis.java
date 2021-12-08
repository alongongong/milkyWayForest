package menuInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import menuInfo.bean.MenuInfoDTO;

@Transactional
@Repository
public class MenuInfoMybatis implements MenuInfoDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MenuInfoDTO> getDrink() {
		return sqlSession.selectList("menuInfoSQL.getDrink");
	}

	@Override
	public List<MenuInfoDTO> getFood() {
		return sqlSession.selectList("menuInfoSQL.getFood");
	}

	@Override
	public List<MenuInfoDTO> getTea() {
		return sqlSession.selectList("menuInfoSQL.getTea");
	}

	@Override
	public List<MenuInfoDTO> getCoffee() {
		return sqlSession.selectList("menuInfoSQL.getCoffee");
	}

	@Override
	public List<MenuInfoDTO> getMenuInfo(Map<String, Object> map) {
		return sqlSession.selectList("menuInfoSQL.getMenuInfo", map);
	}

	@Override
	public int getMenuTotalA(String menuCode) {
		return sqlSession.selectOne("menuInfoSQL.getMenuTotalA", menuCode);
	}

	@Override
	public List<MenuInfoDTO> getFoodAll(String menuCode) {
		return sqlSession.selectList("menuInfoSQL.getFoodAll", menuCode);
	}

	@Override
	public MenuInfoDTO getMenuDetail(String menuCode) {
		return sqlSession.selectOne("menuInfoSQL.getMenuDetail", menuCode);
	}
	
}
