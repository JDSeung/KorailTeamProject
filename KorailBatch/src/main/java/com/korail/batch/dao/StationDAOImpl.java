package com.korail.batch.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.batch.vo.StationVO;

@Repository
public class StationDAOImpl implements StationDAO{

	@Inject
	private SqlSession session;
	
	@Override
	public List<StationVO> selectData(Map<String, Integer> trainSerchTypeMap) {
		return session.selectList("getStationInfo", trainSerchTypeMap);
	}

}
