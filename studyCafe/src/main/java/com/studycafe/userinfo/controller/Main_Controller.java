package com.studycafe.userinfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//첫 화면
@Controller
public class Main_Controller {
	
	//get방식
	//요청주소 ~컨패/main
	@RequestMapping(value="/main")
	public String main(Model model) {
		model.addAttribute("hi","welcome");
		return "user_info/main"; //jsp
	}

}
