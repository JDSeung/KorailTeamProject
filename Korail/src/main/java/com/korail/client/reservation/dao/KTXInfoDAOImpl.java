package com.korail.client.reservation.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.client.reservation.vo.KTXInfoVO;

@Repository
public class KTXInfoDAOImpl implements KTXInfoDAO {

	@Inject
	SqlSession session;
	
	/*열차정보 조회*/
	@Override
	public List<KTXInfoVO> getTrainInfo(Map<String, Object>  ktxInfoMap) {
		return session.selectList("getTrainInfo", ktxInfoMap);
	}

	/*검색에 따른 열차 리스트 총 개수*/
	@Override
	public int getTotalTrainList(KTXInfoVO ktxInfoVO) {
		return session.selectOne("getTotalTrainList", ktxInfoVO);
	}

	

}
