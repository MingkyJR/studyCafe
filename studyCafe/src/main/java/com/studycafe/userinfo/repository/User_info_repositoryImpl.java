package com.studycafe.userinfo.repository;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.studycafe.userinfo.domain.User_info;

@Repository
public class User_info_repositoryImpl implements User_info_repository{

	/*action-mybatis.xml에서   sqlSession이름으로  bean객체만들어진 것을
	 * 자동주입(@Autowired)시켜준다
	<bean id="sqlSession"
		  class="org.mybatis.spring.SqlSessionTemplate">
		<constructor-arg index="0" ref="sqlSessionFactory"></constructor-arg>
	</bean>*/
	
	private JdbcTemplate template;

	@Autowired 
	    public void setDataSource(DataSource dataSource) {
	        this.template = new JdbcTemplate(dataSource); 
	    }
		
		//회원등록처리
	    /*update(String sql,Object... args):JdbcTemplate에서 insert쿼리문 실행
		 *파라미터
		  String sql: 실행쿼리문(insert문,update문,delete문)
		  Object... args:?에 해당하는 내용
		 *리턴타입  int : 실행된 쿼리문의 row수       */
		public void setNewUser_info(User_info User_info) {
		 System.out.println(User_info);
		 String sql = 
		    "insert into user_info(user_number,u_name,u_id,u_pass,u_tell,u_gender,u_credate) " + 
		 	"values(?,?,?,?,?,?,?)";
		 	this.template.update(
				 sql,
				 User_info.getUser_number(), //유저 식별 번호 1 
				 User_info.getU_name(), //유저이름 2
				 User_info.getU_id(), //유저 id 3 
				 User_info.getU_pass(), //유저 비번 4
				 User_info.getU_tell(), //유저 전화번호 5			 
				 User_info.getU_gender(), //유저 성별 6
				 User_info.getU_credate() //유저 가입일 7
				 ); 		 
		 		//유저 번호?
		}
		 	
		 			
		 	
		 	
			//(회원id로)상세회원정보 조회
			//파라미터 String id : 조회하고자하는 회원id
			//리턴타입 Member : 상세회원정보
		 	
		 	@Override
		 	public User_info getUser_info_ById(String id) {
		 		String sql ="select user_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate " + 
						"from user_info " + 
						"where u_id =?";
		 		
		 		User_info user_info = template.queryForObject(
							 				sql, 
							 				new User_info_RowMapper(),
							 				id);
		 				
		 		return user_info;
		 	}
		 	
	
		 	//회원목록 조회
			@Override
			public List<User_info> getAllUser_info_List(){
				String sql = "select user_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate " + 
						"from user_info";
				List<User_info> user_list = this.template.query(
												sql, 
												new User_info_RowMapper());
				return user_list;
			}

			
			
		
}//class의 끝
