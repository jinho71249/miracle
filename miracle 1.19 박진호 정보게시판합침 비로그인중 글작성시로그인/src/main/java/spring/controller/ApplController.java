package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.UserDao;
import spring.service.AdoBoardListService;
import spring.validator.AdoboardWriteValidator;
import spring.validator.ApplValidator;
import spring.vo.Appl;

@Controller
public class ApplController {
	
	private UserDao userDao;
	private AdoBoardListService adoBoardListService;
	
	public ApplController(UserDao userDao, AdoBoardListService adoBoardListService) {
		this.userDao = userDao;
		this.adoBoardListService = adoBoardListService;
	}

	@GetMapping("applWrite")
	public String applWrite(@RequestParam("ado_Num") int ado_Num, 
			@RequestParam("ado_AniPic") String ado_AniPic, Model model) {
		Appl appl=new Appl();
		appl.setAppl_Ado_AniPic(ado_AniPic);
		appl.setAppl_Ado_Num(ado_Num);
		model.addAttribute("appl", appl);
		
		return "applWrite";
	}
	
	@PostMapping("applWriteAfter")
	public String applWriteAfter(Appl appl, HttpSession session, Errors errors, Model model) {
		
		new ApplValidator().validate(appl, errors);
		if(errors.hasErrors()) {
			return "applWrite";
		}
		
		
		int tmp=userDao.insertAppl(appl);
		System.out.println(tmp+"개 쿼리 상입됌");
		int tmp2=userDao.setAlarm(appl);
		System.out.println(tmp2+"개 알림 설정됌");
		
		adoBoardListService.makeList((String)session.getAttribute("cur_page"),
			     (String)session.getAttribute("cur_section"), session, model);
		
		return "adoBoardList"; 
	}
}
