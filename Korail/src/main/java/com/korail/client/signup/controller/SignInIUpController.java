package com.korail.client.signup.controller;




import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korail.client.signup.service.SignUpServiceImpl;
import com.korail.client.user.service.SearchZipCodeService;
import com.korail.client.user.vo.AddrTO;
import com.korail.client.user.vo.UserVO;

@Controller
@RequestMapping(value = "/signup")
public class SignInIUpController {

	@Autowired
	private SearchZipCodeService zipCodeService;
	@Autowired
	private SignUpServiceImpl signUpService;

	@RequestMapping(value = "/agreement", method = RequestMethod.POST)
	public String home(Model model, @RequestParam("email") String mail) {

		model.addAttribute("email", mail);
		return "/signup/agreement";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(Model model, HttpServletRequest request) {

		model.addAttribute("email", request.getParameter("email"));
		return "/signup/signup";

	}

	@ResponseBody
	@RequestMapping(value="/zip",method = RequestMethod.POST ,produces="text/plain;charset=UTF-8")
	public String searchZipCode(HttpServletRequest request, @ModelAttribute AddrTO addrTO ,Model model) throws Exception{
		
		zipCodeService.getZipCode(addrTO);
		
		return zipCodeService.getZipCode(addrTO);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/sign",method = RequestMethod.POST)
	public int singUp(@ModelAttribute UserVO userVO,HttpServletRequest request,Model model){
		if(request.getParameter("uemail") != null){
			userVO.setUserEmail(request.getParameter("uemail"));			
		}
		int result = signUpService.selectId(userVO);
		if(result == 0){
			result = signUpService.insertUser(userVO, request);
		}else{
			result = 0;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/idChk" ,method = RequestMethod.POST)
	public int idChk(UserVO userVO){
		
		int result = signUpService.selectId(userVO);
		
		return result;
	}

}
