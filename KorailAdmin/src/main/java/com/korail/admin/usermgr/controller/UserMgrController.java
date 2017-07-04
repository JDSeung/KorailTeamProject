package com.korail.admin.usermgr.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.usermgr.service.UserInfoMgrService;
import com.korail.admin.usermgr.vo.UserVO;

@Controller
@RequestMapping(value = "/usermgr")
public class UserMgrController {
	
	@Autowired
	private UserInfoMgrService userService;
	
	@RequestMapping(value = "/")
	public String loginHome(Model model, PagingComponent paging) throws Exception {

		model.addAttribute("paging", paging);
		return "/usermgr/userList";
	}
	/*페이징 처리*/
	@ResponseBody
	@RequestMapping(value = "/list")
	public Map<String, Object> userList(Model model, PagingComponent paging) throws Exception {
		Map<String, Object> mapList = new HashMap<String, Object>();
		List<UserVO> userList = new ArrayList<UserVO>();
		paging.setListSize(15);
		userList = userService.getUserInfo(paging);
		mapList.put("userList", userList);
		mapList.put("paging", paging);
		return mapList;
	}
	/*게시물 검색*/
	@ResponseBody
	@RequestMapping(value = "/searchData")
	public Map<String, Object> searchData(UserVO userVO, PagingComponent paging) throws Exception{
		Map<String, Object> mapList = new HashMap<String, Object>();
		List<UserVO>  userList = userService.getUserInfo(paging);
		mapList.put("userList", userList);
		mapList.put("paging", paging);
		return mapList;
	}
}
