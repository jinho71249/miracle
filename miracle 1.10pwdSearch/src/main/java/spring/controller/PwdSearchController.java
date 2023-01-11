package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import spring.dao.UserDao;
import spring.validator.SearchAndPwdChangdValidator;
import spring.vo.PwdSearchCommand;


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
	public String pwdSearch(@ModelAttribute("pwdSearchdata") PwdSearchCommand pwdSearchInfo, Errors errors) {
	
		new SearchAndPwdChangdValidator().validate(pwdSearchInfo, errors);
		
		//에러가 있으면 다시 비밀번호찾기 정보를 입력하는 페이지로 리턴
		if(errors.hasErrors()) {
			return "pwdSearch";
		}
		
		try {
			//입력받은 아이디/전화번호/생년월일이 일치하면 비밀번호 변경페이지로 리턴 
			
			return "pwdSearchChange";

		} catch (Exception e) {
			return "pwdSearch";
		}

		
	}
	
	
}
	

	
	
	
	
