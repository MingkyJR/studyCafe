package com.studycafe.userinfo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.studycafe.userinfo.domain.User_info;//dto
import com.studycafe.userinfo.service.User_info_Service; //dao

@Controller
@RequestMapping("/user/*")//user ~전부 받음
public class User_Info_Controller {
		
		private static final Logger logger = LoggerFactory.getLogger(User_Info_Controller.class);
	
	@Inject
	User_info_Service user_info_Service;
	
	//회원가입(get)
	@RequestMapping(value ="/user_insert.do",method = RequestMethod.GET)
	public void getUser_insert() throws Exception{
		logger.info("get user_insert");
	}//회원가입(get)의 끝
	
	//회원가입(post)
	@RequestMapping(value ="/user_insert.do",method = RequestMethod.POST)
	public String postUser_insert(User_info u_vo) throws Exception{
		logger.info("get user_insert");
		
		user_info_Service.User_insert(u_vo);
		
		return null;
	}//회원가입(post)의 끝

	
	//로그인
	@RequestMapping(value="/user_login.do", method = RequestMethod.GET)
	public String User_login(User_info u_vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("get user_login");
		
		HttpSession session = req.getSession();
		User_info user_login = user_info_Service.User_login(u_vo);
		
		if(user_login == null) {
			session.setAttribute("user",null);
			rttr.addFlashAttribute("msg",false);
			System.out.printf("contrror로그인 실패",user_login);
		}else{
			System.out.printf("contrror로그인 성공",user_login);
			session.setAttribute("user",user_login);
		}
		return "redirect:/";
	}//로그인의 끝.
	
	//로그아웃
	@RequestMapping(value= "/user_logout.do",method = RequestMethod.GET)
	public String User_logout(HttpSession session)throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}//로그아웃의 끝
	
	
	
	//04. 회원정보 수정처리(마이페이지)	
	@RequestMapping(value="/user_updateView.do", method= RequestMethod.GET)
	public String user_UpdateView() throws Exception{
		
		return "user/user_updateView";
	}
		
	@RequestMapping(value="user/user_update.do", method= RequestMethod.POST)
	public String user_Update(User_info user_update, HttpSession session) throws Exception{
		user_info_Service.User_update(user_update);
		
		session.invalidate();
		
		return "redirect:/";
	}
		
	
	
	
	/*
	 * //05. 회원정보 삭제처리
	 * 
	 * @RequestMapping("user/user_delete.do") public String
	 * user_delete(@RequestParam String u_id, @RequestParam String u_pass, Model
	 * model ) { //비밀번호 체크 boolean result = user_info_Service.check_Pass(u_id,
	 * u_pass); if(result) { user_info_Service.User_delete(u_id); return
	 * "redirect:/user/user_list.do"; }else {
	 * model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
	 * model.addAttribute("dto",user_info_Service.User_view(u_id)); return
	 * "user/user_view"; } }
	 */
	
	
}//class의 끝
