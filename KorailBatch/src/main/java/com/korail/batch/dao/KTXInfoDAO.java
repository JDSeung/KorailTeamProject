package com.korail.batch.dao;

import java.util.List;
import java.util.Map;

import com.korail.batch.vo.KTXInfoVO;


public interface KTXInfoDAO {
	
	public int korailInfoInsert(Map<String, List<KTXInfoVO>> trainPairingMap) throws Exception;
	public int trainPairingDelete() throws Exception;
}
