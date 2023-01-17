package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.UserDao;
import spring.vo.Comment;
import spring.vo.User;


@Controller
public class TestController {
	private UserDao UserDao;
	
	public TestController(UserDao userDao) {
		UserDao=userDao;
	}
	
	
	@RequestMapping("test")
	public String list(Model model, HttpServletRequest request) {
		
		String ado_Num=request.getParameter("ado_Num");

		
 		
		return "main";
	}
}
