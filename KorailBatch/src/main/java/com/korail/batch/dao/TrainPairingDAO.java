package com.korail.batch.dao;

import java.util.List;
import java.util.Map;

import com.korail.batch.vo.TrainPairingVO;


public interface TrainPairingDAO {
	
	public int korailInfoInsert(Map<String, List<TrainPairingVO>> trainPairingMap) throws Exception;
	public int trainPairingDelete() throws Exception;
}
