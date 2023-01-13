package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import spring.Exception.IdNotMatchingException;
import spring.Exception.PasswordNotMatchingException;
import spring.service.LoginService;
import spring.validator.LoginValidator;
import spring.vo.LoginInfo;
import spring.vo.RegisterRequest;

@Controller
public class LoginController {
	
	private LoginService loginSvc;
	
	public LoginController(LoginService loginSvc) {
		this.loginSvc=loginSvc;
	}
	
	@GetMapping("login")
	public String login(Model model) {
		model.addAttribute("data", new LoginInfo());
		return "login";
	}
	
	@PostMapping("login")
	public String loginConfirm(@ModelAttribute("data") LoginInfo loginInfo, HttpSession session, Errors errors) {
		new LoginValidator().validate(loginInfo, errors);
	
		if(errors.hasErrors()) {
			return "login";
		}
		
		try {
			String user_Id=loginSvc.login(loginInfo);
			session.setAttribute("user_Id", user_Id);
			return "main";
		}catch (PasswordNotMatchingException e) {
			errors.rejectValue("user_Pwd", "passwordNotMatching"); 
			return "login";
		}catch (IdNotMatchingException e) {
			errors.rejectValue("user_Id", "idNotMatching"); 
			return "login";
		}
		
		
	}
}
