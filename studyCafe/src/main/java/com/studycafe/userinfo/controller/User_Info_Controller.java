package com.studycafe.userinfo.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.studycafe.userinfo.domain.User_info;
import com.studycafe.userinfo.service.User_info_Service;

@Controller
public class User_Info_Controller {
		
		private static final Logger logger = LoggerFactory.getLogger(User_Info_Controller.class);
	
	@Inject
	User_info_Service user_info_Service2;
	
	//01 회원목록
	@RequestMapping("user/user_list.do")
	public String user_list(Model model) {
		
		List<User_info> list = user_info_Service2.User_info_List();
		model.addAttribute("list",list);
		return "user/user_list";
	}
	
	//02_01 회원등록페이로 이동
	@RequestMapping("user/user_add.do")
	public String user_add() {

		return "user/user_add";
	}
	
	// 02_02 회원등록 처리 후 회원목록으로 리다이렉트
	// ModelAttribute 폼에서 입력한 데이터 저장
	@RequestMapping("user/user_insert.do")
	public String user_insert(@ModelAttribute User_info u_vo) {
		
		user_info_Service2.User_insert(u_vo);
		
		return "redirect:/user/user_list.do";
	}
	
	//03. 회원 상세정보 조회
		@RequestMapping("user/user_view.do")
		public String user_view(@RequestParam(value="u_id", required=false) String u_id, Model model) {
			//회원정보 model에 저장
			model.addAttribute("dto",user_info_Service2.User_view(u_id));
			//클릭한 아이디 확인
			logger.info("클릭한 아이디 :"+u_id);
			
			return "user/user_view";	
		}
		
	//04. 회원정보 수정처리(마이페이지)
	@RequestMapping("user/user_update.do")
	public String user_update(@ModelAttribute User_info u_vo, Model model) {
		//비밀번호 체크
		boolean result = user_info_Service2.check_Pass(u_vo.getU_id(), u_vo.getU_pass());
		
		if(result) { //비밀번호가 일치하면 수정 처리 후 전체회원목록으로 리다이렉트 -> 메인화면으로 리다이렉트로 변경 예정
			user_info_Service2.User_update(u_vo);
			return "redirect:/user/list.do";
			//비밀번호가 일치하지 안흔다면 div에 불일치 문구 출력, view.jsp로 포워드, 가입일자, 수정일자 저장
		}else {
			User_info u_vo2 = user_info_Service2.User_view(u_vo.getU_id());
			u_vo.setU_credate(u_vo2.getU_credate()); //가입일
			u_vo.setU_upDate(u_vo2.getU_upDate()); //수정일
			model.addAttribute("dto",u_vo);
			model.addAttribute("msg","비밀번호가 일치하지 않습니다."); //mag : massage
			return "redirect:/user/user_view";
		}
	}
		
	
	//05. 회원정보 삭제처리
	@RequestMapping("user/user_delete.do")
	public String user_delete(@RequestParam String u_id, @RequestParam String u_pass, Model model ) {
		//비밀번호 체크
		boolean result = user_info_Service2.check_Pass(u_id, u_pass);
		if(result) {
			user_info_Service2.User_delete(u_id);
			return "redirect:/user/user_list.do";
		}else {
			model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
			model.addAttribute("dto",user_info_Service2.User_view(u_id));
			return "user/user_view";
		}
	}
	
}//class의 끝
