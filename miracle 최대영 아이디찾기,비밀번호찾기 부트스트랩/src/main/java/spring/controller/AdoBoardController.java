package spring.controller;


import java.io.File;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import spring.dao.UserDao;
import spring.service.AdoBoardListService;
import spring.validator.AdoboardWriteValidator;
import spring.vo.Adoption;
import spring.vo.Comment;
import spring.vo.LoginInfo;
import spring.vo.User;

@Controller
public class AdoBoardController {
	private UserDao userDao;
	private AdoBoardListService adoBoardListService;
	
	

	public AdoBoardController(UserDao userDao, AdoBoardListService adoBoardListService) {
		this.userDao = userDao;
		this.adoBoardListService = adoBoardListService;
	}

	@RequestMapping("adoBoardList")
	public String adoBoardList(Model model, 
			@RequestParam(value="cur_page", required=false) String page, 
			@RequestParam(value="cur_section", required=false) String section,
			HttpSession session) {
		String cur_section;
		String cur_page;
		
		//cur_section requestParam? > null >> section? > null > 1 
		cur_section = section!=null?section:
			session.getAttribute("cur_section")!=null?
					 (String) session.getAttribute("cur_section"):"1";
					
		cur_page = page!=null?page:
			session.getAttribute("cur_page")!=null?
					 (String) session.getAttribute("cur_page"):"1";
					
		
		adoBoardListService.makeList(cur_page, cur_section, session, model);

		return "adoBoardList";
	}
	
	@GetMapping("adoBoardDetail")
	public String adoBoardDetail(@RequestParam("ado_Num") int ado_Num, 
			@RequestParam(value = "path", required = false) String path,
			Model model, HttpSession session) {
		
		Adoption adoInfo=userDao.selectAdoByNum(ado_Num);
		int tmp=userDao.upCountAdoBoard(ado_Num); //????????? 1??????
		//System.out.println(tmp+"??? ?????? ???????????????");
		List<Comment> comments= new ArrayList<Comment>();
		comments = userDao.getCommentsByNum(0,ado_Num);
		
		if(path==null) {
			path="adoBoardList";
		}else {
			path+="?back=ado";
		}
		System.out.println(path+" ??????");
		model.addAttribute("path", path);
		model.addAttribute("returnNum", ado_Num);//???????????? ??? ??????????????????
		model.addAttribute("comment", new Comment());//?????? ?????? ??????
		model.addAttribute("comments", comments);//db ?????? ????????? 
		model.addAttribute("info", adoInfo);
		 
		return "adoBoardDetail";
	}
	
	@GetMapping("adoBoardWrite")
	public String adoBoardWrite(Model model, HttpSession session) {
		
		User user= (User)session.getAttribute("curLogin");
		if(user==null) {
			System.out.println("???????????? ????????????");
			model.addAttribute("data", new LoginInfo());
			model.addAttribute("returnPath", "adoBoardWrite");
			model.addAttribute("message", "????????? ??? ?????? ???????????????");
			return "login";
		}
		else {
			Adoption ado=new Adoption();
			ado.setAdo_User_Id(user.getUser_Id());
			ado.setAdo_User_Name(user.getUser_Name()); 
			model.addAttribute("adoption", ado);
			return "adoBoardWrite";
		}
		
	}
	
	@PostMapping("adoBoardWriteAfter")//, required = false
	public String adoBoardWriteAfter(@RequestParam(value="file") MultipartFile file, 
									Adoption adoption, Errors errors, Model model, HttpSession session) {	
		
		String filename="";
		if(!file.isEmpty()) {
			filename=file.getOriginalFilename();
			String path="/img/"+filename;
			adoption.setAdo_AniPic(path);
		}
		
		new AdoboardWriteValidator().validate(adoption, errors);
		if(errors.hasErrors()) {
			
			return "adoBoardWrite";
		}
		
		
		try {
			file.transferTo(new File(("C:\\resources\\img"), filename));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int tmp=userDao.insertAdo(adoption);
		System.out.println(tmp+" ?????? ??????");
		//---------------------------------------------------
		
		String cur_section="1";
		String cur_page="1";
		
		adoBoardListService.makeList(cur_page, cur_section, session, model);
		
		return "adoBoardList";
	}
	
	
	@GetMapping("adoBoardDel")
	public String adoBoardDel(@RequestParam("ado_Num") int ado_Num, Model model, HttpSession session) {
		
		int tmp=userDao.delAdoBoardByNum(ado_Num);
		System.out.println(tmp+"??? ?????? ?????????");
		
		adoBoardListService.makeList((String)session.getAttribute("cur_page"),
				     (String)session.getAttribute("cur_section"), session, model);
		
		return "adoBoardList";
		//????????? myList????????? mylist??? ??????????????????
	}
	
	@GetMapping("adoBoardModi")
	public String adoBoardModi(@RequestParam("ado_Num") int ado_Num, 
								@RequestParam("ado_AniPic") String ado_AniPic, Model model) {
		
		Adoption adoption=userDao.selectAdoByNum(ado_Num);
		model.addAttribute("adoption", adoption);
		model.addAttribute("ado_AniPic", ado_AniPic);
		
		return "adoBoardModiPage";
	}
	
	@PostMapping("adoBoardModiAfter")
	public String adoBoardModiAfter(@RequestParam(value="file") MultipartFile file, 
									@RequestParam("img") String img,
									Adoption adoption, Errors errors, Model model, HttpSession session) {

		new AdoboardWriteValidator().validate(adoption, errors);
		if(errors.hasErrors()) {
			return "adoBoardModiPage";
		}
		
		
		String filename="";
		if(!file.isEmpty()) {
			filename=file.getOriginalFilename();
			String path="/img/"+filename;
			adoption.setAdo_AniPic(path);
			
			try {
				file.transferTo(new File(("C:\\resources\\img"), filename));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else {//file is empty
			adoption.setAdo_AniPic(img);
		}
		
		
		
		
		int tmp=userDao.updateAdoBoard(adoption);
		//System.out.println(tmp+"??? ?????? ????????????");
		adoBoardListService.makeList((String)session.getAttribute("cur_page"),
			     (String)session.getAttribute("cur_section"), session, model);
	
		return "adoBoardList";
	}
	
	@RequestMapping("adoAjax")
	@ResponseBody
	public void getMyAdo(String id, HttpServletResponse response) throws IOException {
		
		List<Adoption> lists=new ArrayList<Adoption>();
		lists=userDao.selectAdoById(id);
		
		Gson gson=new Gson();
		String jsonInfo=gson.toJson(lists);
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out=response.getWriter();
		out.print(jsonInfo);
		
	}
	
	

	
}















