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
import spring.dao.UserDao;
import spring.service.LoginService;
import spring.service.SecedeService;
//import spring.service.SecedeService;
import spring.validator.LoginValidator;
import spring.vo.LoginInfo;

@Controller
public class SecedeController {

	private SecedeService secedeSvc;

	public SecedeController(SecedeService secedeSvc) {
		this.secedeSvc = secedeSvc;
	}

	@GetMapping("secede")
	public String secede(Model model){
		model.addAttribute("secededata", new LoginInfo());
		return "secede";
	}
	
	 @PostMapping("secede") 
	 public String secedeform(
		 @ModelAttribute("secededata") LoginInfo loginInfo, 
		 Errors errors, HttpSession session) {
		 
		 System.out.println("가지고온아이디");
		 
		 new LoginValidator().validate(loginInfo, errors);
	
		 if(errors.hasErrors()) { 
			 return "secede"; 
		}
		
		 try { 
			 
			 secedeSvc.secede(loginInfo, session);
	
			 session.invalidate(); //세션초기화
			 return "main"; 
			 
		 } catch(PasswordNotMatchingException e) { 
			 errors.rejectValue("user_Pwd","passwordNotMatching");
			 return "secede"; 
		}catch (IdNotMatchingException e) {
		 errors.rejectValue("user_Id", "notCurrentId"); 
		 	return "secede"; }
		
	 	}

		
	}


