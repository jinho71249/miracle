package spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import spring.dao.UserDao;
import spring.service.AdoBoardListService;
import spring.validator.AdoboardWriteValidator;
import spring.validator.ApplValidator;
import spring.vo.Adoption;
import spring.vo.Appl;
import spring.vo.LoginInfo;
import spring.vo.User;

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
			@RequestParam("ado_AniPic") String ado_AniPic, Model model, HttpSession session) {
		User user= (User)session.getAttribute("curLogin");
		
		Appl appl=new Appl();
		appl.setAppl_Ado_AniPic(ado_AniPic);
		appl.setAppl_Ado_Num(ado_Num);
		
		if(user==null) {
			session.setAttribute("appl", appl);
			System.out.println("로그인후 이용가능");
			model.addAttribute("data", new LoginInfo());
			model.addAttribute("returnPath", "applWrite");
			model.addAttribute("message", "로그인 후 신청이 가능합니다");
			return "login";
		}
		appl.setAppl_Id(user.getUser_Id());
		model.addAttribute("appl", appl);
		return "applWrite";
	}
	
	@PostMapping("applWriteAfter")
	public String applWriteAfter(Appl appl, HttpSession session, Errors errors, Model model) {
		//session.setAttribute("appl", null);
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
	
	@RequestMapping("applDetail")
	public String applDetail() {
		
		return "applDetail";
	}
	
	@RequestMapping("applGet")
	@ResponseBody
	public void getMyAdo(String id, HttpServletResponse response) throws IOException {
		
		List<Adoption> myLists=new ArrayList<Adoption>();
		myLists=userDao.selectAdoById(id);
		
		List<Appl> lists=new ArrayList<Appl>();
		for(Adoption ado : myLists) {
			List<Appl> tmp=new ArrayList<Appl>();
			//tmp=userDao.selectApplByNum(ado.getAdo_Num());
			lists.addAll(tmp);
		}
		
		Gson gson=new Gson();
		String jsonInfo=gson.toJson(lists);
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out=response.getWriter();
		out.print(jsonInfo);
		
	}
}
