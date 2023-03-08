package com.studycafe.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.studycafe.user.domain.User;
import com.studycafe.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@GetMapping("/login")
	public String login(Model model) throws Exception {
		return "user/login";
	}
	@PostMapping("/logined")
	public String logined(String u_id,String u_pass,Model model,HttpServletRequest request) throws Exception {
		
		User user = new User();
		user.setU_id(u_id);
		user.setU_pass(u_pass);
		User loginUser = userService.getLogin(user);
		if(loginUser==null) {
			String msg ="로그인에 실패하였습니다";
			model.addAttribute("msg",msg);

			return "user/login";
		}
		HttpSession session = request.getSession();
		session.setAttribute("AUTHUSER", loginUser);
		return "main";
	}
	
	@GetMapping("/logout")
	public String logout(Model model,HttpSession session) throws Exception {
		session.invalidate();
		return "user/login";
	}
	
	@GetMapping("/join")
	public String join() throws Exception {
		return "user/join";
	}
	
	@PostMapping("/join")
	public String doJoin(User user, String re_u_pass, Model model, HttpServletRequest req) throws Exception {
		Map<String,Boolean> errors = new HashMap<String,Boolean>();
		req.setAttribute("errors",errors);
		String u_pass = user.getU_pass();
		if(!u_pass.equals(re_u_pass)) {
			errors.put("notMatch", Boolean.TRUE);
		}
		if(!errors.isEmpty()) { //에러가 존재하면 돌아가라
			return "user/join";
		}
		userService.insertUser(user);
		return "user/success";
	}
	
	public boolean isPasswordEqualsToConfirm(String u_pass, String re_u_pass) {
		return u_pass != null && u_pass.equals(re_u_pass);   //조건두개 충족. null이면 안됨
		
	}
	
}
