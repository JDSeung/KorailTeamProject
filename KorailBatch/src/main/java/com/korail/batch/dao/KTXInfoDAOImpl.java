package com.korail.batch.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.batch.vo.KTXInfoVO;

@Repository
public class KTXInfoDAOImpl implements KTXInfoDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public int korailInfoInsert(Map<String, List<KTXInfoVO>> korailInfoListMap) throws Exception {
		return session.insert("trainPairingInsert", korailInfoListMap);
	}

	@Override
	public int trainPairingDelete() throws Exception {
		return session.delete("trainPairingDelete");
	}

}
