package spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.UserDao;
import spring.vo.Adoption;

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
		int cnt=userDao.getCount();
		
		
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
}
