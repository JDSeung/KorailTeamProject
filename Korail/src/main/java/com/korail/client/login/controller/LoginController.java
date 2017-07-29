package com.korail.client.login.controller;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.korail.client.login.service.LoginService;
import com.korail.client.user.vo.UserVO;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

	private static String RSA_WEB_KEY = "_RSA_WEB_Key_"; //개인키 session key
	private static String RSA_INSTANCE = "RSA"; //rsa transformation
	@Autowired
	private LoginService loginService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loginHome( HttpSession session,Model model, HttpServletRequest request) {
		if(session.getAttribute("userVO") != null){
			return"redirect:/";
		}
		
		//RSA 키 생성
		initRsa(request, session);
		return "/login/login";
	}
	@ResponseBody
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout( HttpSession session) {
		session.invalidate();
	}

	@ResponseBody
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public ModelAndView login(UserVO userVO, HttpSession session, HttpServletRequest reqeust)throws Exception {
		String userPw = userVO.getUserPw();
		
		PrivateKey privateKey = (PrivateKey) session.getAttribute(LoginController.RSA_WEB_KEY);
		
		//복호화
		userPw = decryptRsa(privateKey, userPw);
		//개인키 삭제
		session.removeAttribute(LoginController.RSA_WEB_KEY);
		
		//복호화 비밀번호 vo 저장
		userVO.setUserPw(userPw);
		
		userVO.setUserEtc("0");
		if (userVO.getUserPw() != null) {
			loginService.getLogin(userVO, session);
		}
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("userVO") == null) {
			session.setAttribute("loginCheck", 0);
			mav.setViewName("redirect:/login/");
		} else {
			/*로그인 했을경우
			 * 만료된 예매정보 업데이트(추후 관리자 측에서 해야할 일)
			 * 홈, 예약페이지로 이동*/
			userVO = (UserVO) session.getAttribute("userVO");
			String dest = (String) session.getAttribute("dest");
			dest = dest == null?"redirect:/":"redirect:"+dest;
			System.out.println(dest);
			mav.setViewName(dest);
		}
		return mav;
	}
	
	
	/*복호화*/
	private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception{
		Cipher cipher = Cipher.getInstance(LoginController.RSA_INSTANCE);
		byte[] encryptedBytes = hexToByteArray(securedValue);
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
		String decryptedValue = new String(decryptedBytes, "UTF-8"); //문자 인코딩 주의
		return decryptedValue;
	}
	
	
	/*16진수를 byte로 배열로 변환*/
	public static byte[] hexToByteArray(String hex){
		if(hex == null || hex.length() % 2 != 0){
			return new byte[] {};
		}
		byte[] bytes = new byte[hex.length() / 2];
		for(int i = 0; i < hex.length(); i+=2){
			byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
			bytes[(int) Math.floor( i / 2) ] = value;
		}
		return bytes;
	}
	
	/*RSA 공개키, 개인키 생성*/
	public void initRsa(HttpServletRequest request, HttpSession session){
		KeyPairGenerator generator;
		try{
			generator = KeyPairGenerator.getInstance(LoginController.RSA_INSTANCE);
			generator.initialize(1024);
			
			KeyPair keyPair = generator.generateKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance(LoginController.RSA_INSTANCE);
			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();
			
			session.setAttribute(LoginController.RSA_WEB_KEY, privateKey); //session에 RSA 개인키 저장
			
			RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			
			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
			
			request.setAttribute("RSAModulus", publicKeyModulus); // RSA Modulus를 request 추가
			request.setAttribute("RSAExponent", publicKeyExponent); // RSA Exponent를 request 추가
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	/*비회원예매버튼 클릭시 사용자 정보 입력 화면 출력*/
	@RequestMapping(value = "/guest", method = RequestMethod.GET)
	public String guest(Model model) {

		return "/login/guest";
	}

	/*정보 입력시*/
	@RequestMapping(value = "/guestinfo", method = RequestMethod.POST)
	public ModelAndView guestInfo(UserVO userVO, HttpSession session, Model model, HttpServletRequest request) {
		userVO.setUserEmail(request.getParameter("uemail"));
		loginService.getGuest(userVO, session);
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("userVO") == null) {
			mav.addObject("loginCheck", false);
			mav.setViewName("/login/login");
		} else {
			mav.setViewName("redirect:/reservation/");
		}
		
		return mav;
	}
	
	/*비회원 화면*/
	@RequestMapping(value = "/guestlogin")
	public String guest(UserVO userVO, HttpSession session, Model model, HttpServletRequest request) {	
		return "/login/guestLogin";
	}
	
	/*비회원 로그인 버튼 클릭시*/
	@ResponseBody
	@RequestMapping(value = "/guestlogin/login", method = RequestMethod.POST)
	public int guestLogin(UserVO userVO, HttpSession session, HttpServletRequest request) {
		userVO.setUserEtc("2");
		int result = loginService.getGuest(userVO, session);
		return result;
	}
}
