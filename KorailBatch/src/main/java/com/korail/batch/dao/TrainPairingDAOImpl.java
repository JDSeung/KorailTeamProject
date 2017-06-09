package com.korail.batch.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.batch.vo.TrainPairingVO;

@Repository
public class TrainPairingDAOImpl implements TrainPairingDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public int korailInfoInsert(Map<String, List<TrainPairingVO>> korailInfoListMap) throws Exception {
		return session.insert("trainPairingInsert", korailInfoListMap);
	}

	@Override
	public int trainPairingDelete() throws Exception {
		return session.delete("trainPairingDelete");
	}

}
