package com.studycafe.userinfo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.studycafe.userinfo.domain.User_info;
import com.studycafe.userinfo.service.User_login_Service;

	
//로그인관련 controller
	@Controller //현재 클래스를 스프링에서 관리하는 컨트롤러 bean생성
	@RequestMapping("/user/") //모든 맵핑은 /user를 상속
	public class User_login_Controller {
	
		@Inject
		User_login_Service user_login_Service;
		
		//menu.do를 클릭하면 views/user/user_login.jsp로 이동
		@RequestMapping("login.do")
			public String login() {
			return "user/user_login";
		}
		
		@RequestMapping("login_check.do")
		public ModelAndView login_check(@ModelAttribute User_info user_vo, HttpSession session) {
			String name = user_login_Service.loginCheck(user_vo, session);
			ModelAndView mav = new ModelAndView();

				//로그인 성공시
				if(name != null) {
					mav.setViewName("home");
				}
				//로그인 실패시
				else {
					mav.setViewName("user/user_login");
					mav.addObject("massage","error");
				}
				return mav;
		}
		
		@RequestMapping("logout.do")
		public ModelAndView logout(HttpSession session, ModelAndView mav) {
			user_login_Service.logout(session);
			mav.setViewName("user/user_login");
			mav.addObject("massage","logout");
			return mav;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*
		 * private static final Logger logger =
		 * LoggerFactory.getLogger(User_login_Controller.class);
		 * 
		 * @Inject User_login_ServiceImpl user_login_Service;
		 * 
		 * //01 로그인화면
		 * 
		 * @RequestMapping("login.do") public String login() { return "user/user_login";
		 * //view/user/login.jsp -> jsp로 연결 //경로 :
		 * src->main->webapp->web-inf->views->user
		 * 
		 * }
		 * 
		 * //02 로그인처리
		 * 
		 * @RequestMapping("loginCheck.do") public ModelAndView
		 * loginCheck(@ModelAttribute User_info user_vo, HttpSession session) { boolean
		 * result = user_login_Service.loginCheck(user_vo, session); ModelAndView mav =
		 * new ModelAndView(); //mav는 ModelAndView의 약어 //로그인성공 if(result == true) {
		 * //main(home) jsp로 이동 mav.setViewName("home"); mav.addObject("msg",
		 * "success"); } //로그인실패 else { //login.jsp로 이동
		 * mav.setViewName("user/user_login"); mav.addObject("msg","failuer"); } return
		 * mav; }
		 * 
		 * // 로그아웃처리 -
		 * 
		 * @RequestMapping("logout.do") public ModelAndView logout(HttpSession session)
		 * { user_login_Service.logout(session); ModelAndView mav = new ModelAndView();
		 * mav.setViewName("user/login"); mav.addObject("msg","logout"); return mav; }
		 * 
		 */
		
}//class의 끝
