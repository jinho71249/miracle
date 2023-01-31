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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import spring.dao.UserDao;
import spring.validator.ReviewBoardWriteValidator;
import spring.vo.Board;
import spring.vo.Comment;
import spring.vo.LoginInfo;
import spring.vo.User;

@Controller
public class FreeBoardController {
	private UserDao dao;

	public FreeBoardController(UserDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("freeBoard")
	public String freeBoard(Model model,@RequestParam("cur_section") String section,
			@RequestParam("cur_page") String page,HttpSession session) {
		

		
		int cur_section = Integer.parseInt((section==null)?"1":section);
		int cur_page = Integer.parseInt((page==null)?"1":page);
		
		List<Board> list = dao.freeList();
		int cnt=dao.freeBoardCount();
		
		int totalPage = cnt%9>0 ? (cnt/9+1) : (cnt/9);
		int totalSection = cnt%90>0 ? (cnt/90+1) : (cnt/90);
		
		int start = (cur_section-1)*90+(cur_page-1)*9+1;
		int end = (start+9)<cnt ? (start+9) : cnt+1;
		
		List<Board> cur_list = new ArrayList<Board>();
		for(int i=start;i<end;i++) {
			cur_list.add(list.get(i-1));
		}
		

		session.setAttribute("cur_section", cur_section);
		session.setAttribute("cur_page", cur_page);
		
		model.addAttribute("cur_section",cur_section);
		model.addAttribute("cur_page", cur_page);
		model.addAttribute("cur_list", cur_list);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalSection", totalSection);
		
		return "freeBoard";
	}
	@GetMapping("freeBoardDetail")
	public String freeBoardDetail(@RequestParam("board_Num") int board_Num,
			@RequestParam(value = "cur_page", required = false) String cur_page, 
			@RequestParam(value = "cur_section", required = false) String cur_section, 
			@RequestParam(value = "path", required = false) String path,
			Model model) {
		
		Board board = dao.selectBoardNum(board_Num);
		int readCount = dao.boardReadCount(board_Num);
		
		
		List<Comment> comments= new ArrayList<Comment>();
		comments = dao.getCommentsByNum(board_Num,0);
		
		if(path==null) {
			path="freeBoard?";
		}else if(path.equals("myList")){ 
			path+="?back=free&";
		}
		System.out.println(path+"  경로");
		model.addAttribute("path",path);
		model.addAttribute("returnNum", board_Num);//댓글등록 후 돌아오기위한
		model.addAttribute("comment", new Comment());//댓글 등록 객체
		model.addAttribute("comments", comments);//db 댓글 리스트 
		model.addAttribute("readCount",readCount);
		model.addAttribute("board",board);
		model.addAttribute("cur_page", cur_page);
		model.addAttribute("cur_section", cur_section);
				
		return "freeBoardDetail";
	}
	
	@GetMapping("freeBoardWrite")
	public String freeBoardWriteBtn (Model model,HttpSession session) {
		User user = (User) session.getAttribute("curLogin");
		
		if(user==null) {
			System.out.println("로그인후 이용가능");
			model.addAttribute("data", new LoginInfo());
			model.addAttribute("returnPath", "freeBoardWrite");
			model.addAttribute("message", "로그인 후 작성 가능합니다");
			return "login";
		}else {
			Board board = new Board();
			board.setBoard_User_Id(user.getUser_Id());
			model.addAttribute("board",board);
			return "freeBoardWrite";
		}
		
	}
	
	@PostMapping("freeBoardWriteForm")
	public String freeBoardWriteForm(@RequestParam(value="file")  List<MultipartFile> file, 
							Board board,Errors errors,Model model,HttpSession session) {
		

		new ReviewBoardWriteValidator().validate(board, errors);
		if(errors.hasErrors()) {
			System.out.println("에러발생");
			return "freeBoardWrite";

		}
		
		String picPath="";
		
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

				picPath=picPath+fileName+"&";
			}
		}		

		if(!picPath.equals("&")) {
			board.setBoard_Pic(picPath);
		}

		int tmp=dao.writeFreeBoard(board);
		
		int cur_section = 1;
		int cur_page = 1;
		
		List<Board> list = dao.freeList();
		int cnt=dao.freeBoardCount();
		
		int totalPage = cnt%9>0 ? (cnt/9+1) : (cnt/9);
		int totalSection = cnt%90>0 ? (cnt/90+1) : (cnt/90);
		
		int start = (cur_section-1)*90+(cur_page-1)*9+1;
		int end = (start+9)<cnt ? (start+9) : cnt+1;
		
		List<Board> cur_list = new ArrayList<Board>();
		for(int i=start;i<end;i++) {
			cur_list.add(list.get(i-1));
		}
		
		session.setAttribute("cur_section", cur_section);
		session.setAttribute("cur_page", cur_page);
		
		model.addAttribute("cur_section",cur_section);
		model.addAttribute("cur_page", cur_page);
		model.addAttribute("cur_list", cur_list);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalSection", totalSection);
		

		return "freeBoard";

	}
	
	@GetMapping("freeBoardModi")
	public String freeBoardModiBtn(
			@RequestParam("board_Num") int board_Num,
			@RequestParam(value = "path", required = false) String path, 
			Model model) {
		
		Board board = dao.selectBoardNum(board_Num);
		if(path!=null) {
			model.addAttribute("path", path);
		}
		
		model.addAttribute("board",board);

		return "freeBoardModi";		
	}
	
	
	@PostMapping("freeBoardModiForm")
	public String freeBoardModi(@RequestParam(value="file") List<MultipartFile> file,Board board,Errors errors,Model model,HttpSession session,
			@RequestParam(value="board_Pic", required = false) String board_Pic,
			@RequestParam("board_Num") int board_Num,
			@RequestParam(value = "path", required = false) String path) {
		
		new ReviewBoardWriteValidator().validate(board, errors);
		if(errors.hasErrors()) {
			System.out.println("에러발생");
			return "freeBoardModi";

		}
		
		String picPath=board_Pic;
		
		for(MultipartFile mf : file) {
			if(!file.isEmpty()) {
				String fileName=mf.getOriginalFilename();
				if(!mf.isEmpty()) {
					try {
						mf.transferTo(new File(("C:\\resources\\img"),fileName));
						if(board_Pic!=null) {
							picPath=picPath+fileName+"&";
						}
					}catch (IllegalStateException e) {
						e.printStackTrace();
					}catch (IOException e) {
						e.printStackTrace();
					}
				}

			}
		}		

		if(!picPath.equals("&")) {
			board.setBoard_Pic(picPath);
		}
		
		int tmp=dao.updateReviewBoard(board);
		
		
		int cur_section = 1;
		int cur_page = 1;
		
		List<Board> list = dao.freeList();
		int cnt=dao.freeBoardCount();
		
		int totalPage = cnt%9>0 ? (cnt/9+1) : (cnt/9);
		int totalSection = cnt%90>0 ? (cnt/90+1) : (cnt/90);
		
		int start = (cur_section-1)*90+(cur_page-1)*9+1;
		int end = (start+9)<cnt ? (start+9) : cnt+1;
		
		List<Board> cur_list = new ArrayList<Board>();
		for(int i=start;i<end;i++) {
			cur_list.add(list.get(i-1));
		}
		List<Comment> comments= new ArrayList<Comment>();
		comments = dao.getCommentsByNum(board_Num,0);
		
		if(path==null) {
			path="freeBoard?";
		}else {
			path+="&";
		}
		session.setAttribute("cur_section", cur_section);
		session.setAttribute("cur_page", cur_page);
		
		model.addAttribute("cur_section",cur_section);
		model.addAttribute("cur_page", cur_page);
		model.addAttribute("cur_list", cur_list);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalSection", totalSection);
		model.addAttribute("comment", new Comment());
		model.addAttribute("comments",comments);
		board = dao.selectBoardNum(board_Num);
		model.addAttribute("board",board);
		model.addAttribute("path",path);
		
		return "freeBoardDetail";	
	}
	
	@GetMapping("freeBoardDel")
	public String freeBoardDel(@RequestParam("board_Num") int board_Num, 
			@RequestParam("cur_page") String cur_page, 
			@RequestParam("cur_section") String cur_section, 
			@RequestParam(value = "path", required = false) String path,
			Model model,HttpSession session) {
		
		int dele = dao.reviewBoardDelCom(board_Num);
		int del = dao.reviewBoardDel(board_Num);
		
		
		if(path.equals("myList?back=free")) {
			User curLogin=(User) session.getAttribute("curLogin");
			model.addAttribute("user_Id", curLogin.getUser_Id());
			model.addAttribute("back", "free");
			path="myList";
		}else {
			model.addAttribute("cur_page", cur_page);
			model.addAttribute("cur_section", cur_section);
			path="redirect:/freeBoard";
		}
		
		return path;
		
	}
	
	@RequestMapping("freeAjax")
	@ResponseBody
	public void getMyAdo(String id, HttpServletResponse response) throws IOException {
		
		List<Board> lists=new ArrayList<Board>();
		lists=dao.selectFreeListById(id);
		
		Gson gson=new Gson();
		String jsonInfo=gson.toJson(lists);
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out=response.getWriter();
		out.print(jsonInfo);
		
	}
}
