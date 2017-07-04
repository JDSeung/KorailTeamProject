package com.korail.client.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.korail.client.reservation.vo.TicketingVO;

public class RESInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		try {
			if(request.getMethod().equals("POST")){
				request.getSession().setAttribute("dest", "/reservation/resinfo");
				TicketingVO ticketInfo = new TicketingVO();
				ticketInfo.setTrainName(request.getParameter("trainName"));
				ticketInfo.setTrainNO(request.getParameter("trainNO"));
				ticketInfo.setArrPlaceName(request.getParameter("arrPlaceName"));
				ticketInfo.setArrPlandTime(request.getParameter("arrPlandTime"));
				ticketInfo.setDepPlaceName(request.getParameter("depPlaceName"));
				ticketInfo.setDepPlandTime(request.getParameter("depPlandTime"));
				ticketInfo.setPassengerType(request.getParameter("passengerType"));
				ticketInfo.setRate(request.getParameter("rate"));
				ticketInfo.setReservationNo(request.getParameter("reservationNo"));
				ticketInfo.setSeat(request.getParameter("seat"));
				ticketInfo.setSeatDivision(request.getParameter("seatDivision"));
				ticketInfo.setPassengerType(request.getParameter("passengerType"));
				HttpSession session = request.getSession();
				session.setAttribute("ticketInfo", ticketInfo);
			}
			if(request.getSession().getAttribute("userVO") == null ){
		        response.sendRedirect("/korail/login/");
		            return false;
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return true;
	}
}
