package spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.dao.UserDao;
import spring.vo.User;


@Controller
public class TestController {
	private UserDao UserDao;
	
	public TestController(UserDao userDao) {
		UserDao=userDao;
	}
	
	
	@RequestMapping("test")
	public String list(Model model) {
		
		
		List<User> list= UserDao.select();
		model.addAttribute("list", list);
		
		return "test";
	}
}
