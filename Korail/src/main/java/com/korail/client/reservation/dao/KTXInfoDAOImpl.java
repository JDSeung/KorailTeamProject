package com.korail.client.reservation.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.client.reservation.vo.KTXInfoVO;

@Repository
public class KTXInfoDAOImpl implements KTXInfoDAO {

	@Inject
	SqlSession session;
	
	@Override
	public List<KTXInfoVO> searchTrain(KTXInfoVO ktxInfoVO) {
		return session.selectList("searchTrain");
	}

}
