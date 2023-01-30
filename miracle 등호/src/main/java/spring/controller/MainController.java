package spring.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.UserDao;
import spring.vo.User;

@Controller
public class MainController {
	private UserDao userDao;
	
	
	public MainController(UserDao userDao) {
		this.userDao = userDao;
	}

	@RequestMapping("main")
	public String gomain(HttpSession session) {
		User curLogin=(User) session.getAttribute("curLogin");
		if(curLogin!=null) {
			User user=userDao.selectById(curLogin.getUser_Id());
			session.setAttribute("curLogin", user);//db에서 데이터 다시가져와 정보저장 
		}
		
		
		return "main";
	}
	
	
	@RequestMapping("myList")
	public String myList(@RequestParam(value="back", required = false) String back,
			Model model, HttpSession session, HttpServletResponse response) throws IOException {
		User curLogin=(User) session.getAttribute("curLogin");
		model.addAttribute("user_Id", curLogin.getUser_Id());
		if(back==null) {
			model.addAttribute("back", "none");
		}
		else if(back.equals("ado")) {
			model.addAttribute("back", "ado");
		}
		else if(back.equals("applGet")) {
			model.addAttribute("back", "applGet");
		}
		else if(back.equals("applSent")) {
			model.addAttribute("back", "applSent");
		}
		else if(back.equals("review")) {
			model.addAttribute("back", "review");
		}
		else if(back.equals("info")) {
			model.addAttribute("back", "info");
		}
		else if(back.equals("free")) {
			model.addAttribute("back", "free");
		}
		
		return "myList";
	}
	
	
	@RequestMapping("guide")
	public String guide() {
		return "guide";
	}
	
	
}



