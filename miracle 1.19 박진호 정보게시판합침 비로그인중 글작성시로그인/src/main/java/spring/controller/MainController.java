package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("alarm")
	public String offAlarm(HttpSession session) {
		User user=(User) session.getAttribute("curLogin");//정보가져와
		userDao.offAlarm(user);//db알람 끄고
		user.setUser_Alarm(0);//현재로그인상태알람끄고
		session.setAttribute("curLogin", user);//웹 반영
		
		return "main";
	}
}
