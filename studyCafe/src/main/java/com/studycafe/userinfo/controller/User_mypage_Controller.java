package com.studycafe.userinfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//mypage 컨트롤러
@Controller
public class User_mypage_Controller {

	@RequestMapping(value = "/mypage.do")
	public String mypage() throws Exception{
		return "/user/mypage";
	}
}
