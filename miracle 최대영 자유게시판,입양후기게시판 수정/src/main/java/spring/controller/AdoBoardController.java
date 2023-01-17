package spring.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import spring.dao.UserDao;
import spring.validator.AdoboardWriteValidator;
import spring.validator.RegisterRequestValidator;
import spring.vo.AdoWrite;
import spring.vo.Adoption;
import spring.vo.User;

@Controller
public class AdoBoardController {
	private UserDao userDao;
	
	public AdoBoardController(UserDao userDao) {
		this.userDao = userDao;
	}



	@RequestMapping("adoBoardList")
	public String adoBoardList(Model model, 
			@RequestParam("cur_section") String section, 
			@RequestParam("cur_page") String page) {
		
		int cur_section = Integer.parseInt((section==null)?"1":section);
		int cur_page = Integer.parseInt((page==null)?"1":page);
		//200  200  23페이지   3세션   1~9  10~18 19~23  181~189  190~198  199~200
		
		//198  3  22
		
		//sec1 page1   1-9
		//         2   10 18
		//   2     1   91  99
		//         2   100  108
		
		
		List<Adoption> list=userDao.getList();
		int cnt=userDao.getCount();//전체 게시글수
		
		int totalPage=cnt%9>0 ? (cnt/9+1) : (cnt/9); //페이지 수
		int totalSection=cnt%90>0 ? (cnt/90+1) : (cnt/90);//세션수
		
		int start=(cur_section-1)*90+(cur_page-1)*9+1; 
		int	end=(start+9)<cnt ? (start+9) : cnt+1;
		
		List<Adoption> cur_list=new ArrayList<Adoption>();
		for(int i=start; i<end;i++) {//100~107 99~106
			cur_list.add(list.get(i-1));
		}	
		
		model.addAttribute("cur_section", cur_section);
		model.addAttribute("cur_page", cur_page);
		model.addAttribute("cur_list", cur_list);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalSection", totalSection);
		
		return "adoBoardList";
	}
	
	@GetMapping("adoBoardDetail")
	public String adoBoardDetail(@RequestParam("ado_Num") int ado_Num, 
			@RequestParam("cur_page") String cur_page, 
			@RequestParam("cur_section") String cur_section, 
			Model model ) {
		Adoption adoInfo=userDao.selectAdoByNum(ado_Num);
		model.addAttribute("info", adoInfo);
		model.addAttribute("cur_page", cur_page);
		model.addAttribute("cur_section", cur_section);//다시 리스트로 돌아올때사용
		 
		return "adoBoardDetail";
	}
	
	@GetMapping("adoBoardWrite")
	public String adoBoardWrite(Model model, HttpSession session) {
		
		User user= (User)session.getAttribute("curLogin");
		if(user==null) {
			System.out.println("로그인후 이용가능");
			return "main";
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
	public String adoBoardWriteAfter(@RequestParam(value="file") MultipartFile file, Adoption adoption, Errors errors, Model model) {	
		
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
		System.out.println(tmp+" 쿼리 삽입");
		return "main";
	}
	
	@PostMapping("img")
	public String img(HttpServletRequest request, Model model) {
		String path="C:\\resources\\img";
		MultipartRequest mr;
		String picName="";
		try {
			mr = new MultipartRequest(request, path, 
					1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			picName="/img/"+mr.getFilesystemName("ado_AniPic");
			System.out.println(picName); 
			String id=mr.getParameter("id");
			Adoption ado=new Adoption();
			ado.setAdo_User_Name("qwe"); 
			ado.setAdo_AniPic(picName);
			ado.setAdo_User_Id(id);
			model.addAttribute("data", ado);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "adoBoardWrite";
		
	}
	
}















