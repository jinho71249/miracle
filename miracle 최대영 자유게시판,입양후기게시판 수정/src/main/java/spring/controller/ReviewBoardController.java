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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spring.dao.UserDao;
import spring.validator.ReviewBoardWriteValidator;
import spring.vo.Board;
import spring.vo.User;

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
	
	@GetMapping("reviewBoardWrite")
	public String reviewBoardWriteBtn (Model model,HttpSession session) {
		User user = (User) session.getAttribute("curLogin");
		
		if(user==null) {
			System.out.println("로그인후 이용가능");
			return "main";
		}else {
			Board board = new Board();
			board.setBoard_User_Id(user.getUser_Id());
			model.addAttribute("board",board);
			return "reviewBoardWrite";
		}
		
	}
	
	@PostMapping("reviewBoardWriteForm")
	public String reviewBoardWriteForm(@RequestParam(value="file")  List<MultipartFile> file, 
							Board board,Errors errors,Model model) {
		

		new ReviewBoardWriteValidator().validate(board, errors);
		if(errors.hasErrors()) {
			System.out.println("에러발생");
			return "reviewBoardWrite";

		}
		
		String path="";
		
		for(MultipartFile mf : file) {
			if(!file.isEmpty()) {
				String fileName=mf.getOriginalFilename();
				if(!mf.isEmpty()) {
					try {
						mf.transferTo(new File(("C:\\resources\\img"),fileName));
					}catch (IllegalStateException e) {
						e.printStackTrace();
					}catch (IOException e) {
						e.printStackTrace();
					}
				}

				path=path+fileName+"&";
			}
		}		

		if(!path.equals("&")) {
			board.setBoard_Pic(path);
		}

		int tmp=dao.writeReviewBoard(board);

		return "main";

	}
		
//		String fileName="";
//		if(!file.isEmpty()) {
//			fileName=file.getOriginalFilename();
//			String path=fileName;
//			board.setBoard_Pic(path);
//		}
//		
//		new ReviewBoardWriteValidator().validate(board, errors);
//		if(errors.hasErrors()) {
//			System.out.println("에러발생");
//			return "reviewBoardWrite";
//
//		}
//		if(board.getBoard_Pic()!=null) {
//			try {
//				file.transferTo(new File(("C:\\resources\\img"),fileName));
//			}catch (IllegalStateException e) {
//				e.printStackTrace();
//			}catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		int tmp=dao.writeReviewBoard(board);
//		return "main";
		
	
	
	
	@GetMapping("reviewBoardModi")
	public String reviewBoardModiBtn(@RequestParam("board_Num") int board_Num,Model model) {
		
		Board board = dao.selectBoardNum(board_Num);
		model.addAttribute("board",board);

		return "reviewBoardModi";		
	}
	
	
	@PostMapping("reviewBoardModiForm")
	public String reviewBoardModi(@RequestParam(value="file") List<MultipartFile> file,Board board,Errors errors,Model model) {
		new ReviewBoardWriteValidator().validate(board, errors);
		if(errors.hasErrors()) {
			System.out.println("에러발생");
			return "reviewBoardWrite";

		}
		
		String path="";
		
		for(MultipartFile mf : file) {
			if(!file.isEmpty()) {
				String fileName=mf.getOriginalFilename();
				if(!mf.isEmpty()) {
					try {
						mf.transferTo(new File(("C:\\resources\\img"),fileName));
					}catch (IllegalStateException e) {
						e.printStackTrace();
					}catch (IOException e) {
						e.printStackTrace();
					}
				}

				path=path+fileName+"&";
			}
		}		

		if(!path.equals("&")) {
			board.setBoard_Pic(path);
		}
		
		int tmp=dao.updateReviewBoard(board);
		return "main";	
	}
	
	@GetMapping("reviewBoardDel")
	public String reviewBoardDel(@RequestParam("board_Num") int board_Num, @RequestParam("cur_page") String cur_page, @RequestParam("cur_section") String cur_section, Model model,HttpSession session) {
		
		int del = dao.reviewBoardDel(board_Num);
		model.addAttribute("cur_page", cur_page);
		model.addAttribute("cur_section", cur_section);
		
		return "redirect:/reviewBoard";
		
	}

	
	
	
	
	
	
	
	
	
	
}
