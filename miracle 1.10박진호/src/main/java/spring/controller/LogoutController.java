package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.setAttribute("user_Id", null); 
		return "main";
	}
}
