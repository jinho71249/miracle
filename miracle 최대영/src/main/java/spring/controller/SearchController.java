package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.UserDao;
import spring.vo.Search;
import spring.vo.User;

@Controller
public class SearchController {
	
	private UserDao UserDao; 
	
	public SearchController(UserDao userDao) {
		UserDao = userDao;
	}
	
	@GetMapping("idSearch")
	public String SearchIdGet() {
		return "idSearch";
	}
	
	@PostMapping("idSearchCom")
	public String SearchId( Search search, Model model) {
		
		search.getUser_Name();
		search.getUser_Tel();
		search.getUser_Birth();
		
		User user_Id = UserDao.searchId(search);
		model.addAttribute("user",user_Id);
		
		return "idSearchCom";
	}
	
	
	
	
	
	

}
