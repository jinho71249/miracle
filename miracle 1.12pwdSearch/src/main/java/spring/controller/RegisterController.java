package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.Exception.CommonException;
import spring.Exception.DuplicateIdException;
import spring.Exception.DuplicateTelException;
import spring.service.UserRegisterService;
import spring.validator.RegisterRequestValidator;
import spring.vo.RegisterRequest;

@Controller
public class RegisterController {
	private UserRegisterService userRegisterService;
	
	public RegisterController(UserRegisterService userRegisterService) {
		this.userRegisterService=userRegisterService;
	}


	@GetMapping("register")
	public String goRegForm(@RequestParam("user_Admin") int user_Admin, Model model) {
		
		model.addAttribute("user_Admin", user_Admin);
		model.addAttribute("data", new RegisterRequest());
		
		return "register";
	}
	
	
	@PostMapping("register")
	public String reg(@ModelAttribute("data") RegisterRequest reg, Errors errors, Model model ) {
		model.addAttribute("user_Admin", reg.getUser_Admin());//오류 나서 다시 회원가입 기업할때 admin이 빠져있으므로 다시 넣기
		new RegisterRequestValidator().validate(reg, errors);
		if(errors.hasErrors()) {
			return "register";
		}
		
		try {
			userRegisterService.regist(reg);
			return "main";
		}catch (DuplicateIdException e) {
			errors.rejectValue("user_Id", "duplicateId"); 
			return "register";
		}catch (DuplicateTelException e) {
			errors.rejectValue("user_Tel", "duplicateTel"); 
			return "register";
		}
		
	}
	
	
	@RequestMapping("regSelect")
	public String regselect() {
		return "regSelect";
	}
}
