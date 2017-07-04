package com.korail.client.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.client.encryption.BCrypt;
import com.korail.client.encryption.SHA256;
import com.korail.client.reservation.dao.TicketingDAO;
import com.korail.client.reservation.vo.TicketingVO;
import com.korail.client.user.dao.UserInfoDAO;
import com.korail.client.user.vo.UserVO;
@Service
public class UserServiceImpl implements UserService{
	/*슬기형, 도윤 , 승열*/

	@Autowired
	private UserInfoDAO userInfoDAO;
	@Autowired
	private TicketingDAO ticketingDAO;
	// 비밀번호 확인
	@Override
	public UserVO checkPw(UserVO userVO, TicketingVO ticketingVO, HttpSession session) {

		UserVO dbuserVO = userInfoDAO.checkPw(userVO);
		try {
			if (dbuserVO != null) {
				String orgPass = userVO.getUserPw();
				SHA256 sha = SHA256.getInsatnce();
				String shaPass = sha.getSha256(orgPass.getBytes());
				String dbPass = dbuserVO.getUserPw();
				if (BCrypt.checkpw(shaPass, dbPass)) {
					ticketingVO = myPageTicket(ticketingVO);
					session.setAttribute("ticketingVO", ticketingVO);
					userVO = dbuserVO;
				}else{
					userVO = null;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userVO;
	}
	/*회원정보 수정 또는 뒤로가기버튼 이동*/
	public UserVO getUserInfo(UserVO userVO, TicketingVO ticketingVO, HttpSession session){
		userVO  = userInfoDAO.checkPw(userVO);
		if(userVO != null){
			ticketingVO = myPageTicket(ticketingVO);
			session.setAttribute("ticketingVO", ticketingVO);
		}
		return userVO;
	}
	/*비밀번호 변경*/
	@Override
	public int changePw(UserVO userVO, HttpSession session){
		int result = 0;
		userVO = userInfoDAO.searchPw(userVO);
		session.setAttribute("userNo", userVO.getUserNo());
		if(userVO != null){
			if(userVO.getUserNo() != null){
				result = 1;
			}
		}
		return result;
	}
	/*PW 변경*/
	@Override
	public int updatePw(UserVO userVO){
		String orgPass = userVO.getUserPw();
		String shaPass = "";
		try {
			SHA256 sha = SHA256.getInsatnce();
		
		     shaPass = sha.getSha256(orgPass.getBytes());
		
		     String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
		     System.out.println(bcPass);
		     userVO.setUserPw(bcPass);
		} catch (Exception e) {
		     e.printStackTrace();
		}
		return userInfoDAO.updatePw(userVO);
	}
	
	/*내 최근 예약정보 조회*/
	@Override
	public TicketingVO myPageTicket(TicketingVO ticketingVO) {
		return userInfoDAO.myPageTicket(ticketingVO);
	}
	/*회원정보 수정*/
	@Override
	public int updateUserInfo(UserVO userVO, HttpServletRequest request){
		userVO.setUserAddr(request.getParameter("dorozip") + "/" + request.getParameter("doroaddrVil") + "/"
				+ request.getParameter("doroaddrDit"));
		userVO.setUserPhone(request.getParameter("userphone1") + "-" + request.getParameter("userphone2") + "-"
				+ request.getParameter("userphone3"));
		return userInfoDAO.updateUserInfo(userVO);
	}
	
	/*회원 탈퇴*/
	@Override
	public int signOut(UserVO userVO) throws Exception{
		int result = ticketingDAO.isResUser(userVO);
		if(result > 0){
			return 0;
		}
		return userInfoDAO.signOut(userVO);
	}
}
