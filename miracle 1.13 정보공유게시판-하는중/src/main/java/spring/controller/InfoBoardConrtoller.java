package spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.UserDao;
import spring.vo.Board;

@Controller
public class InfoBoardConrtoller {

	private UserDao userDao;

	public InfoBoardConrtoller(UserDao userDao) {
		this.userDao = userDao;
	}

	@RequestMapping("infoBoardList")
	public String InfoBoardConrtoller(Model model, 
			@RequestParam("cur_section") String section,
			@RequestParam("cur_page") String page
			) {

		int cur_section = Integer.parseInt((section == null) ? "1" : section);
		int cur_page = Integer.parseInt((page == null) ? "1" : page);

		// 보드게시판에서 정보공유게시판글만 가져오기
		List<Board> list = userDao.getInfoBoardList();
		// 보드게시판에서 정보공유게시판글의 갯수만 가져오기
		int cnt = userDao.getInfoBoardListCount();

		int totalPage = cnt%9>0? (cnt/9+1) : (cnt/9); 
		int totalSection = cnt%90>0 ?(cnt/90+1) : (cnt/90);
		 
		int start=(cur_section-1)*90+(cur_page-1)*9+1; 
		int end = (start+9)<cnt ?(start+9) : cnt+1;
		 
		 List<Board> cur_list = new ArrayList<Board>(); 
		 for(int i=start; i<end; i++) {
			 cur_list.add(list.get(i-1)); }
		 
		 model.addAttribute("cur_section", cur_section);
		 model.addAttribute("cur_page", cur_page);
		 model.addAttribute("cur_list",cur_list);
		 model.addAttribute("totalPage",totalPage);
		 model.addAttribute("totalSection",totalSection);
		

		return "infoBoardList"; // 정보공유게시물목록페이지로 리턴

	}

}
