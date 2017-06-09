package com.korail.batch.dao;

import java.util.List;
import java.util.Map;

import com.korail.batch.vo.StationVO;

public interface StationDAO {
	public List<StationVO> selectData(Map<String, Integer> trainSerchTypeMap);
}
