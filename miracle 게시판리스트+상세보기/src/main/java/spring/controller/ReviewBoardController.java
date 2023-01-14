package spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.UserDao;
import spring.vo.Board;

@Controller
public class ReviewBoardController {
	private UserDao dao;

	public ReviewBoardController(UserDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("reviewBoard")
	public String reviewBoard(Model model,@RequestParam("cur_section") String section,@RequestParam("cur_page") String page) {
		
		int cur_section = Integer.parseInt((section==null)?"1":section);
		int cur_page = Integer.parseInt((page==null)?"1":page);
		
		List<Board> list = dao.reviewList();
		int cnt=dao.reviewBoardCount();
		
		int totalPage = cnt%9>0 ? (cnt/9+1) : (cnt/9);
		int totalSection = cnt%90>0 ? (cnt/90+1) : (cnt/90);
		
		int start = (cur_section-1)*90+(cur_page-1)*9+1;
		int end = (start+9)<cnt ? (start+9) : cnt+1;
		
		List<Board> cur_list = new ArrayList<Board>();
		for(int i=start;i<end;i++) {
			cur_list.add(list.get(i-1));
		}
		
		model.addAttribute("cur_section",cur_section);
		model.addAttribute("cur_page", cur_page);
		model.addAttribute("cur_list", cur_list);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalSection", totalSection);
		
		return "reviewBoard";
	}
	@GetMapping("reviewBoardDetail")
	public String reviewBoardDetail(@RequestParam("board_Num") int board_Num,@RequestParam("cur_page") String cur_page, @RequestParam("cur_section") String cur_section, Model model) {
		
		Board board = dao.selectBoardNum(board_Num);
		int readCount = dao.boardReadCount(board_Num);
		model.addAttribute("readCount",readCount);
		model.addAttribute("board",board);
		model.addAttribute("cur_page", cur_page);
		model.addAttribute("cur_section", cur_section);
		
		
		
		return "reviewBoardDetail";
		
	}
	
	
}
