package com.korail.client.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.korail.client.user.vo.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    try {
	    	String url = request.getRequestURL().toString();
	    	String[] urlMapper = url.split("/");
	    	String mapper = urlMapper[urlMapper.length-1];
	    	String[] guestMapper = {"resinfolist", "reservation", "resinfo", "payment", "reslist"};
	    	UserVO user = (UserVO) request.getSession().getAttribute("userVO");
	    	boolean isenter = true;
	    	for(String getMapper : guestMapper){
	    		if(getMapper.equals(mapper)){
	    			isenter = false;
	    		}
	    	}
	        if(user == null ){
				response.sendRedirect("/korail/login/");
				return false;
	        }else if(isenter){
	        	System.out.println("실행됨");
	        	if(user.getUserId() == null){
	        		System.out.println("실행됨2");
	        		request.getSession().invalidate();
					response.sendRedirect("/korail/login/");
					return false;
	        	}
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return true;
	}
	 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	    super.postHandle(request, response, handler, modelAndView);
	}
	 
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	    super.afterCompletion(request, response, handler, ex);
	}
	 
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    super.afterConcurrentHandlingStarted(request, response, handler);
	}


}
