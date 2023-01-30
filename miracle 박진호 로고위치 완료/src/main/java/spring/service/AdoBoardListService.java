package spring.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import spring.dao.UserDao;
import spring.vo.Adoption;

public class AdoBoardListService {
	private UserDao userDao;

	public AdoBoardListService(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Transactional
	public void makeList(String cur_page, String cur_section, HttpSession session, Model model) {
		List<Adoption> list;
		int cnt;
		if(session.getAttribute("list")==null) {
			list=userDao.getList();
			cnt=userDao.getCount();//전체 게시글수
		}else {
			list=(List<Adoption>) session.getAttribute("list");
			cnt=(int) session.getAttribute("cnt");
		}
		
		
		//System.out.println(cur_section+" sec  "+cur_page+"  page");
		//200  200  23페이지   3세션   1~9  10~18 19~23  181~189  190~198  199~200
		
		//198  3  22
		
		//sec1 page1   1-9
		//         2   10 18
		//   2     1   91  99
		//         2   100  108
		
		
		int totalPage=cnt%9>0 ? (cnt/9+1) : (cnt/9); //페이지 수
		int totalSection=cnt%90>0 ? (cnt/90+1) : (cnt/90);//세션수
		
		int start=(Integer.parseInt(cur_section)-1)*90+(Integer.parseInt(cur_page)-1)*9+1; 
		int	end=(start+9)<=cnt ? (start+9) : cnt+1;
		
		List<Adoption> cur_list=new ArrayList<Adoption>();
		for(int i=start; i<end;i++) {//100~107 99~106
			cur_list.add(list.get(i-1));
		}	
		
		session.setAttribute("cur_section", cur_section);
		session.setAttribute("cur_page", cur_page);
		
		model.addAttribute("cur_section", cur_section);
		model.addAttribute("cur_page", cur_page);
		model.addAttribute("cur_list", cur_list);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalSection", totalSection);
	}
	
	

}
