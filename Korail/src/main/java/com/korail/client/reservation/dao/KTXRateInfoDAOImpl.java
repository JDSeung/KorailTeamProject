package com.korail.client.reservation.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.client.reservation.vo.KTXRateInfoVO;

@Repository
public class KTXRateInfoDAOImpl implements KTXRateInfoDAO{

	@Inject
	SqlSession session;
	
	@Override
	public List<KTXRateInfoVO> searchRate(KTXRateInfoVO ktxRateInfoVO) {
		return session.selectList("searchRate", ktxRateInfoVO);
	}
	
}
