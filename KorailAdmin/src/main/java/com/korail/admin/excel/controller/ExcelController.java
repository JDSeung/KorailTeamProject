package com.korail.admin.excel.controller;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.excel.service.ExcelService;
import com.korail.admin.reservation.vo.TicketingVO;
 
@Controller(value="down")
public class ExcelController {
 
    @Autowired
    private ExcelService excelService;
    
    @RequestMapping("/exceldownload")
    public String excelTransform(PagingComponent paging, Map<String, Object> ModelMap, HttpServletResponse response) throws Exception{
    	Calendar getDate = Calendar.getInstance();
		DateFormat setDate = new SimpleDateFormat("yyyy년MM월dd일");
		System.out.println("실행중");
		String setApiDate = setDate.format(getDate.getTime());
        String target = setApiDate + "예매정보";
         
        response.setHeader("Content-disposition", "attachment; filename=" + target + ".xlsx"); //target명을 파일명으로 작성
 
        //엑셀에 작성할 리스트를 가져온다.
        List<TicketingVO> excelList= excelService.getAllObjects(paging); 
         
        //ExcelView(kr.co.myapp.util.ExcelView) 에 넘겨줄 값 셋팅
        ModelMap.put("excelList", excelList); 
        ModelMap.put("target", target);
 
        return "excelView"; //servlet-context.xml 에서 name이 excelView(kr.co.myapp.util.ExcelView)인것 호출
 
    }
 
}