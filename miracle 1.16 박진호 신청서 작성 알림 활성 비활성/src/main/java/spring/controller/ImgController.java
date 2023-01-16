package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.dao.UserDao;
import spring.vo.Adoption;

@Controller
public class ImgController {
	
private UserDao userDao;
	
	public ImgController(UserDao userDao) {
		this.userDao=userDao;
	}
	
	@RequestMapping("img")
	public String img(Model model) {
	
		
		return "img";
	}
}
