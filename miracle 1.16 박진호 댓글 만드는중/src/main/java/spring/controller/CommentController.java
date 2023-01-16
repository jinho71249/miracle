package spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.UserDao;
import spring.vo.Adoption;
import spring.vo.Comment;

@Controller
public class CommentController {
	private UserDao userDao;
	
	public CommentController(UserDao userDao) {
		this.userDao = userDao;
	}

	@RequestMapping("commentWrite")
	public String commentWrite(@RequestParam("returnNum") int num, Comment comment, Model model) {
		
		
		String returnPath="";
		String tmp=""+num;
		if(tmp.charAt(0)=='1') {//입양홍보글일때
			comment.setCom_Ado_Num(num);
			userDao.insertComment(comment, 1);
			
			Adoption adoInfo=userDao.selectAdoByNum(num);
		
			List<Comment> comments= new ArrayList<Comment>();
			comments = userDao.getCommentsByNum(0,num);
			
			model.addAttribute("returnNum", num);//댓글등록 후 돌아오기위한
			model.addAttribute("info", adoInfo);
			model.addAttribute("comments", comments);//db 댓글 리스트 
				
			returnPath="adoBoardDetail";
		}
		

		
		
		return returnPath;
	}
}
