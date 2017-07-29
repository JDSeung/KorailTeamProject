package com.korail.admin.excel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.reservation.dao.TicketingDAO;
import com.korail.admin.reservation.vo.TicketingVO;

@Service
public class ExcelServiceImpl implements ExcelService{

	@Autowired
	private TicketingDAO ticketingDAO;
	
	@Override
	public List<TicketingVO> getAllObjects(PagingComponent paging) {
		int totalContent = ticketingDAO.getResTotalCnt(paging);
		paging.setTotalContent(totalContent);
		paging.setListSize(totalContent);
		return ticketingDAO.getResInfo(paging);
	}

}
