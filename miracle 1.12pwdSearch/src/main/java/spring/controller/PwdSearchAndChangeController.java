package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.UserDao;
import spring.vo.PwdSearchAndChange;
import spring.vo.User;

@Controller
public class PwdSearchAndChangeController {

	
	private UserDao userDao;

	public PwdSearchAndChangeController(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@PostMapping("pwdSearchAndChange")
	public String pwdChange(@ModelAttribute("pwdSearchAndChange") PwdSearchAndChange pwdSAC,
								Model model) {
				
		System.out.println(pwdSAC.getUser_Id());
		
		String ChangePwd = pwdSAC.getUser_Pwd();
		String changePwdChk = pwdSAC.getChangePwdChk();
		String user_Id = pwdSAC.getUser_Id();
	
		System.out.println("입력한 비밀번호 " + ChangePwd);
		System.out.println("입력한 비밀번호 " + changePwdChk);
		
		if(!ChangePwd.equals(changePwdChk)) {
			//입력한 비밀번호 불일치
			System.out.println("입력한 비밀번호 불일치-확인용");
			return "pwdSearchChange";
		}
		

		try {
		

		User user_Pwd = userDao.pwdSearchAndChangeUpdate(pwdSAC);
	
		model.addAttribute("user_Pwd",user_Pwd);
		//System.out.println("변경된 비밀번호 : " + user_Pwd);
		
		//비밀번호 변경이 완료되면 로그인페이지로 
		return "main";
		
		}catch (Exception e) {
			e.printStackTrace();
			
			return "pwdSearchChange";
		}
		
	}
	
	
	
}
