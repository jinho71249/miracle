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
import spring.vo.Comment;
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
			@RequestParam(value = "path", required = false) String path, 
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
		model.addAttribute("path", path);
		return "applWrite";
	}
	
	@PostMapping("applWriteAfter")
	public String applWriteAfter(@RequestParam(value = "path", required = false) String path, 
								Appl appl, HttpSession session, Errors errors, Model model) {
		//session.setAttribute("appl", null);
		new ApplValidator().validate(appl, errors);
		if(errors.hasErrors()) {
			return "applWrite";
		}
		
		
		int tmp=userDao.insertAppl(appl);
		//System.out.println(tmp+"개 쿼리 상입됌");
		int tmp2=userDao.setAlarm(appl);
		//System.out.println(tmp2+"개 알림 설정됌");
		
		Adoption adoInfo=userDao.selectAdoByNum(appl.getAppl_Ado_Num());
		
		List<Comment> comments= new ArrayList<Comment>();
		comments = userDao.getCommentsByNum(0, appl.getAppl_Ado_Num());
		
		model.addAttribute("returnNum", appl.getAppl_Ado_Num());//댓글등록 후 돌아오기위한
		model.addAttribute("comment", new Comment());//댓글 등록 객체
		model.addAttribute("comments", comments);//db 댓글 리스트 
		model.addAttribute("info", adoInfo);
		model.addAttribute("path", path);
		System.out.println(path +" ");
		
//		adoBoardListService.makeList((String)session.getAttribute("cur_page"),
//			     (String)session.getAttribute("cur_section"), session, model);
		
		return "adoBoardDetail"; 
	}
	
	@RequestMapping("applDetail")
	public String applDetail(@RequestParam("appl_Num") int appl_Num,
							@RequestParam("path") String path,
							Model model) {
		Appl appl=userDao.selectApplByNum(appl_Num);
		model.addAttribute("appl", appl);
		
		if(path.equals("myListG")) {
			path="myList?back=applGet";
			
		}
		else if(path.equals("myListS")){//path.equals("myListS")
			path="myList?back=applSent";
		}
		model.addAttribute("path", path);
		return "applDetail";
	}
	
	@RequestMapping("applGet")
	@ResponseBody
	public void applGet(String id, HttpServletResponse response, HttpSession session) throws IOException {
		User user=(User) session.getAttribute("curLogin");//정보가져와
		userDao.offAlarm(user);//db알람 끄고
		user.setUser_Alarm(0);//현재로그인상태알람끄고
		session.setAttribute("curLogin", user);//웹 반영
		
		List<Adoption> myLists=new ArrayList<Adoption>();
		myLists=userDao.selectAdoById(id);
		
		List<Appl> lists=new ArrayList<Appl>();
		for(Adoption ado : myLists) {
			List<Appl> tmp=new ArrayList<Appl>();
			tmp=userDao.selectApplByAdoNum(ado.getAdo_Num());
			lists.addAll(tmp);
		}
		
		Gson gson=new Gson();
		String jsonInfo=gson.toJson(lists);
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out=response.getWriter();
		out.print(jsonInfo);
		
	}
	
	@RequestMapping("applSent")
	@ResponseBody
	public void applSent(String id, HttpServletResponse response) throws IOException {
		
		List<Appl> myLists=new ArrayList<Appl>();
		myLists=userDao.selectApplListById(id); // 내신청서  .신청서대상의 품종, 현상태
		
		List<Adoption> lists=new ArrayList<Adoption>();
		for(Appl appl : myLists) {
			Adoption ado=userDao.selectAdoByNum(appl.getAppl_Ado_Num());
			lists.add(ado);
		}
		for(int i=0;i<lists.size();i++) {
			lists.get(i).setAdo_Num(myLists.get(i).getAppl_Num());
		}															
		
		Gson gson=new Gson();
		String jsonInfo=gson.toJson(lists);
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out=response.getWriter();
		out.print(jsonInfo);
		
	}
	
}






