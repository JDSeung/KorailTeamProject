package com.korail.admin.excel.service;

import java.util.List;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.reservation.vo.TicketingVO;
 
 
public interface ExcelService {
 
    public List<TicketingVO> getAllObjects(PagingComponent paging);
 
}
