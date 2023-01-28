package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.Exception.IdNotMatchingException;
import spring.Exception.PasswordNotMatchingException;
import spring.service.AdoBoardListService;
import spring.service.LoginService;
import spring.validator.LoginValidator;
import spring.vo.Adoption;
import spring.vo.Appl;
import spring.vo.Board;
import spring.vo.LoginInfo;
import spring.vo.User;

@Controller
public class LoginController {
	
	private LoginService loginSvc;
	
	public LoginController(LoginService loginSvc) {
		this.loginSvc = loginSvc;
	}

	@GetMapping("login")
	public String login(Model model) {
		model.addAttribute("data", new LoginInfo());
		return "login";
	}
	
	@PostMapping("login")
	public String loginConfirm(@RequestParam(value="returnPath", required = false) String path, 
								@ModelAttribute("data") LoginInfo loginInfo, 
								HttpSession session, Errors errors, Model model) {
		new LoginValidator().validate(loginInfo, errors);
		if(errors.hasErrors()) {
			return "login";
		}
		
		try {
			loginSvc.login(loginInfo, session);
			if(path.equals("adoBoardWrite")) {//로그인 안하고 글작성시 실행됌
				User user=(User)session.getAttribute("curLogin");
				model.addAttribute("adoption", new Adoption(user.getUser_Id(), user.getUser_Name()));
				return path;
			}
			else if(path.equals("adoBoardWrite")){
				model.addAttribute("board", new Board(loginInfo.getUser_Id())); 
				return path;
			}
			else if(path.equals("infoBoardWrite")){
				model.addAttribute("board", new Board(loginInfo.getUser_Id())); 
				return path;
			}
			else if(path.equals("reviewBoardWrite")){
				model.addAttribute("board", new Board(loginInfo.getUser_Id())); 
				return path;
			}
			else if(path.equals("freeBoardWrite")){
				model.addAttribute("board", new Board(loginInfo.getUser_Id())); 
				return path;
			}
			else if(path.equals("applWrite")){
				
				Appl appl=(Appl)session.getAttribute("appl");
				User user=(User)session.getAttribute("curLogin");
				appl.setAppl_Id(user.getUser_Id());
				model.addAttribute("appl", appl);
				return path;
			}
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
