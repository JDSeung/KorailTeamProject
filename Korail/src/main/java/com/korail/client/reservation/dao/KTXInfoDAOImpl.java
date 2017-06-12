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
	public List<KTXInfoVO> getTrainInfo(KTXInfoVO ktxInfoVO) {
		//만약 여기서 에러가 난다고하면 의심해봐야 할 상항 resultType는 Vo인데 반환값은 ?? 매핑이 되는건지 의심한번쯤은
		return session.selectList("getTrainInfo", ktxInfoVO);
	}

}
