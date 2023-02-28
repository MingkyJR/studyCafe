package com.studycafe.userinfo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.studycafe.userinfo.domain.User_info;
import com.studycafe.userinfo.service.User_info_Service;

@Controller
public class User_info_Controller {

	private static final Logger logger = LoggerFactory.getLogger(User_info_Controller.class);
	
	@Autowired
	private  User_info_Service user_info_Service;
	
	/*
	 * @Autowired private HttpSession session;
	 */
	
	//session 예시
	//session.setAttribute("user_info",user);
	//session명 : user, 또는 user_info

	//회원등록폼 보여주기
	@GetMapping("/user/add")
	public String request_user_add_Form(@ModelAttribute("user") User_info user) {
		return "user/user_add";
	}
	
		//회원등록처리
		@PostMapping("/user/add")
		public String submit_user_add(@ModelAttribute("user") User_info user) {
		  	logger.info(user.toString());
		  	user_info_Service.setNewUser_info(user);
			return "test/resultView";
		}
		
	
	//(회원id) 상세회원정보조회
		//요청주소  ~컨페/member/info?memberid=hongid
		@GetMapping("/user/info")
		public String request_User_info_ById(@RequestParam("memberid") String id, Model model) {
			User_info user = user_info_Service.getUser_info_ById(id);
			model.addAttribute("user", user);
			return "user/user_Info"; 
		}
	
		//회원목록조회
		//요청주소   ~컨페/member/list
		@GetMapping("/user/list")
		public ModelAndView request_All_user_list(ModelAndView mv) {
			List<User_info> user_list = user_info_Service.getAllUser_info_List();
			mv.addObject("user_list", user_list);
			mv.setViewName("user/user_list");
			return mv;
		}
		
		/*
		 * //회원가입? -> 오류 터지면 user_add 및 user/add, user_add.jsp 파일들 다른 것으로 변경
		 * 
		 * @RequestMapping(value="/user/add",method=RequestMethod.POST) public String
		 * user_add() throws Exception{ return "/user/user_add"; }
		 */
		
		/*
		 * // ----------------------로그인 관련--------------------------------------
		 * 
		 * @RequestMapping(value="/user/add",method=RequestMethod.POST) //아이디 중복체크, 생성
		 * -> add로 오류뜨면 insert로 변경할 것. public String useradd(User_info user_info, Model
		 * model) { int result = user_info_Service.setNewUser_info(user_info);
		 * 
		 * if (result == 0) { model.addAttribute("message","중복되는 아이디입니다."); return
		 * "main"; } return "login"; }
		 */
			
			
		
		
		
	
	//비밀번호 수정폼 요청
		@GetMapping("/usesr/update")
		public ModelAndView request_user_modify_Form(String user_id,ModelAndView mv) {
			logger.info(user_id);
			mv.addObject("user_id",user_id);
			mv.setViewName("user/user_modify_Form");
			return mv;
		}
	
	//비밀번호 수정처리
	

	
	
}//class의 끝
