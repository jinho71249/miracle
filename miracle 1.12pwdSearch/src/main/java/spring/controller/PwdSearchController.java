package spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.UserDao;
//import spring.service.PwdSearchService;
import spring.validator.SearchAndPwdChangdValidator;
//import spring.vo.PwdSearchCommand;
import spring.vo.User;


@Controller
public class PwdSearchController {

	private UserDao userDao;

	
	public PwdSearchController(UserDao userDao) {
		this.userDao = userDao;
	}
	

	//로그인페이지에서 비밀번호 찾기 페이지로 리턴 
	@GetMapping("pwdSearch")
	public String pwdSearch() {
		return "pwdSearch";
	}
	
	//비밀번호찾기 페이지에서 가져온 아이디/전화번호/생년월일정보 
	@PostMapping("pwdSearch")
					//Form데이터를 ModelAttribute로 
	public String pwdSearch(@ModelAttribute("pwdSearchdata") User user,Model model, Errors errors) {
//	public String pwdSearch(HttpSession session, HttpServletRequest request, @RequestParam("user_Id"), User user, Errors errors) {
		
		
		//에러가 있으면 다시 비밀번호찾기 정보를 입력하는 페이지로 리턴
		if(errors.hasErrors()) {
			return "pwdSearch";
		}
		
		try {
			//입력받은 아이디/전화번호/생년월일이 일치하면 비밀번호 변경페이지로 리턴 

			//System.out.println(user.getUser_Id());
//			String user_Id = request.getParameter("user_Id");
//			String user_Tel = request.getParameter("user_Tel");
//			String user_Birth = request.getParameter("user_Birth");
			
			String user_Id
				= userDao.pwdChangeSelectById(user); //
			model.addAttribute("user_Id",user_Id);
			
			System.out.println("확인용 - 가져온 아이디값" + user_Id);
			
			return "pwdSearchChange";
			
		
		} catch (Exception e) {
			e.printStackTrace();
			return "pwdSearch";
		}

		
	}
	
	
}
	

	
	
	
	
