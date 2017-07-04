package com.korail.client.reservation.dao;

import java.util.List;
import java.util.Map;

import com.korail.client.reservation.vo.KTXInfoVO;
import com.korail.client.reservation.vo.TicketingVO;

public interface KTXInfoDAO {
	/*열차정보 조회*/
	public List<KTXInfoVO> getTrainInfo(Map<String, Object>  ktxInfoMap);
	/*검색에 따른 전체 열차 수 */
	public int getTotalTrainList(KTXInfoVO ktxInfoVO);

}
