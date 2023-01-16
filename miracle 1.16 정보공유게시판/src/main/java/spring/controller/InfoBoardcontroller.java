package spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spring.dao.UserDao;
import spring.validator.InfoBoardWriteValidator;
import spring.validator.ReviewBoardWriteValidator;
import spring.vo.Board;
import spring.vo.User;

@Controller
public class InfoBoardcontroller {

	
	private UserDao userDao;

	public InfoBoardcontroller(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
	// 정보공유리스트
	@RequestMapping("infoBoardList")
	public String inforBoardList(
			Model model,
			@RequestParam("cur_section") String section,
			@RequestParam("cur_page") String page) {
		
		int cur_section = Integer.parseInt((section==null)?"1":section);
		int cur_page = Integer.parseInt((page==null)?"1":page);
		
		List<Board> list = userDao.getInfoBoardList();
		int cnt=userDao.infoBoardCount();
		
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
		
		return "infoBoardList";
		
	}
	

	//정보공유 상세보기
	@GetMapping("infoBoardDetail")
	public String infoBoardDetail
		(@RequestParam("board_Num") int board_Num,
		@RequestParam("cur_page") String cur_page, 
		@RequestParam("cur_section") String cur_section,
		Model model) {
		
		Board board = userDao.selectBoardNum(board_Num);
		int readCount = userDao.boardReadCount(board_Num);
		model.addAttribute("readCount",readCount);
		model.addAttribute("board",board);
		model.addAttribute("cur_page", cur_page);
		model.addAttribute("cur_section", cur_section);
		
		return "infoBoardDetail";
	}
	
	

	@GetMapping("infoBoardWrite")
	public String infoBoardWrite(Model model,
				HttpSession session) {

		User user = (User)session.getAttribute("curLogin");
		
		if(user==null) {
			System.out.println("로그인후 이용가능");
			return "main";
		}else {
			Board board = new Board();
			board.setBoard_User_Id(user.getUser_Id());
			model.addAttribute("board",board);
			return "infoBoardWrite";
		}
		
	}

	@PostMapping("infoBoardWriteForm")
	public String infoBoardWriteForm(
			@RequestParam(value="file") MultipartFile file, 
			Board board,Errors errors,
			Model model, HttpSession session) {
		
		String fileName="";
		if(!file.isEmpty()) {
			fileName=file.getOriginalFilename();
			String path=fileName;
			board.setBoard_Pic(path);
		}
		
		new InfoBoardWriteValidator().validate(board, errors);
		
		if(errors.hasErrors()) {
			System.out.println("에러");
			return "infoBoardWrite";
		}
		
		if(board.getBoard_Pic()!=null) {
			try {
				file.transferTo(new File(("C:\\resources\\img"),fileName));
			}catch (IllegalStateException e) {
				e.printStackTrace();
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		int tmp = userDao.writeInfoBoard(board);
		
		return "main";
	}
	
	
	@GetMapping("infoBoardModi")
	public String infoBoardModi(
			@RequestParam("board_Num") int board_Num,
			Model model, HttpSession session) {
		
		Board board = userDao.selectBoardNum(board_Num);
	
		model.addAttribute("board", board);
		
		return "infoBoardModi";
	}
	
	
	@PostMapping("infoBoardWriteModiForm")
	public String infoBoardWriteModiForm(
			@RequestParam(value="file") MultipartFile file,
			Board board,Errors errors,Model model, HttpSession session) {
		
		String fileName="";
		if(!file.isEmpty()) {
			fileName=file.getOriginalFilename();
			String path=fileName;
			board.setBoard_Pic(path);
		}
		
		new ReviewBoardWriteValidator().validate(board, errors);
		if(errors.hasErrors()) {
			System.out.println("에러발생");
			return "infoBoardWrite";
		}
		
		if(board.getBoard_Pic()!=null) {
			try {
				file.transferTo(new File(("C:\\resources\\img"),fileName));
			}catch (IllegalStateException e) {
				e.printStackTrace();
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		int tmp=userDao.updateinfoBoard(board);
		
		return "main";
	
	}

	
	
	@GetMapping("infoBoardDel")
	public String infoBoardDel(
			@RequestParam("board_Num") int board_Num, 
			@RequestParam("cur_page") String cur_page, 
			@RequestParam("cur_section") String cur_section, 
			Model model,
			HttpSession session) {
		
		int del = userDao.infoBoardDel(board_Num);
		model.addAttribute("cur_page", cur_page);
		model.addAttribute("cur_section", cur_section);
		
		return "redirect:/infoBoardList";
		
	}
	
	
	
	
	
	
	
	
	
	
}
