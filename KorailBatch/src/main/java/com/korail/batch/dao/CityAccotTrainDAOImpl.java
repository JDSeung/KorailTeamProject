package com.korail.batch.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.batch.vo.CityAccotTrainVO;

@Repository
public class CityAccotTrainDAOImpl implements CityAccotTrainDAO{

	@Inject
	private SqlSession session;
	
	@Override
	public List<CityAccotTrainVO> getDepArrData() {
		return session.selectList("getStationInfo");
	}

}
