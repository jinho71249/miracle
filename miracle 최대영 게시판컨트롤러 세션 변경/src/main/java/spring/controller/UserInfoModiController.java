package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import spring.Exception.DuplicateTelException;
import spring.service.UserInfoModifyService;
import spring.validator.RegisterRequestValidator;
import spring.vo.RegisterRequest;
import spring.vo.User;

@Controller
public class UserInfoModiController {

	private UserInfoModifyService userInfoModifySvc;

	public UserInfoModiController(UserInfoModifyService userInfoModifySvc) {
		this.userInfoModifySvc = userInfoModifySvc;
	}
	
	@GetMapping("userInfoModi")
	public String userInfoModiGet(Model model) {
		
		model.addAttribute("data",new RegisterRequest());
		
		return "userInfoModi";
	}
	@PostMapping("userInfoModi")
	public String userInfoModiPost(@ModelAttribute("data") RegisterRequest reg,Errors errors){
		
		new RegisterRequestValidator().validate(reg, errors);

		if(errors.hasErrors()) {
			return "userInfoModi";
		}
		
		try {
			userInfoModifySvc.userInfoModify(reg);
			return "main";
		}catch (DuplicateTelException e) {
			errors.rejectValue("user_Tel", "duplicateTel");
			return "userInfoModi";
		}
		
	}
}
