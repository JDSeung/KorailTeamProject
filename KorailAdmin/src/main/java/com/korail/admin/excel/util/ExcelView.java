package com.korail.admin.excel.util;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.korail.admin.excel.view.AbstractExcelPOIView;
import com.korail.admin.reservation.vo.TicketingVO;

 
public class ExcelView extends AbstractExcelPOIView {
 
    @SuppressWarnings("unchecked")
    @Override
    protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
 
        String target = model.get("target").toString();
        System.out.println("실행중");
        //Object로 넘어온 값을 각 Model에 맞게 형변환 해준다.
        List<TicketingVO> listBooks = (List<TicketingVO>) model.get("excelList");
        response.setContentType("application/x-msexcel; charset=EUC-KR");
            //Sheet 생성
            Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;
 
        // 제목 Cell 생성
        row = sheet.createRow(rowCount++);
 
        row.createCell(cellCount++).setCellValue("예매번호");
        row.createCell(cellCount++).setCellValue("회원번호");
        row.createCell(cellCount++).setCellValue("회원성명");
        row.createCell(cellCount++).setCellValue("차량번호");
        row.createCell(cellCount++).setCellValue("차량호수");
        row.createCell(cellCount++).setCellValue("열차종별");
        row.createCell(cellCount++).setCellValue("출발역");
        row.createCell(cellCount++).setCellValue("출발시각");
        row.createCell(cellCount++).setCellValue("도착역");
        row.createCell(cellCount++).setCellValue("도착시각");
        row.createCell(cellCount++).setCellValue("예매매수");
        row.createCell(cellCount++).setCellValue("금액");
        row.createCell(cellCount++).setCellValue("객실등급");
        row.createCell(cellCount++).setCellValue("좌석정보");
        row.createCell(cellCount++).setCellValue("승객유형");
        row.createCell(cellCount++).setCellValue("예먀일자");
 
            // 데이터 Cell 생성
        for (TicketingVO ticketingVO : listBooks) {
            row = sheet.createRow(rowCount++);
            cellCount = 0;
            row.createCell(cellCount++).setCellValue(ticketingVO.getTicketingNo()); //데이터를 가져와 입력
                row.createCell(cellCount++).setCellValue(ticketingVO.getUserNo());
                row.createCell(cellCount++).setCellValue(ticketingVO.getUserName());
                row.createCell(cellCount++).setCellValue(ticketingVO.getTrainName());
                row.createCell(cellCount++).setCellValue(ticketingVO.getTrainNO());
                row.createCell(cellCount++).setCellValue(ticketingVO.getVehiclekndNm());
                row.createCell(cellCount++).setCellValue(ticketingVO.getDepPlaceName());
                row.createCell(cellCount++).setCellValue(ticketingVO.getDepPlandTime());
                row.createCell(cellCount++).setCellValue(ticketingVO.getArrPlaceName());
                row.createCell(cellCount++).setCellValue(ticketingVO.getArrPlandTime());
                row.createCell(cellCount++).setCellValue(ticketingVO.getReservationNo());
                row.createCell(cellCount++).setCellValue(ticketingVO.getRate());
                row.createCell(cellCount++).setCellValue(ticketingVO.getSeatDivision());
                row.createCell(cellCount++).setCellValue(ticketingVO.getSeat());
                row.createCell(cellCount++).setCellValue(ticketingVO.getPassengerType());
                row.createCell(cellCount++).setCellValue(ticketingVO.getTicketingDate());
 
            }
        Calendar getDate = Calendar.getInstance();
		DateFormat setDate = new SimpleDateFormat("yyyy년MM월dd일");
		System.out.println("실행중");
		String setApiDate = setDate.format(getDate.getTime());
		target = setApiDate + "예매정보";
		response.setContentType("Application/Msexcel");
        response.setHeader("Content-disposition", "attachment; filename=" + target + ".xlsx"); //target명을 파일명으로 작성
        FileOutputStream fileoutputstream = new FileOutputStream("D:\\" + target + ".xlsx");
		//파일을 쓴다
		workbook.write(fileoutputstream);
		//필수로 닫아주어야함
		fileoutputstream.close();


      
    }
 
    @Override
    protected Workbook createWorkbook() {
        return new XSSFWorkbook();
    }
 
}