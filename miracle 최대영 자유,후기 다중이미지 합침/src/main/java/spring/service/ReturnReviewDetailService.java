package spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import spring.dao.UserDao;
import spring.vo.Board;
import spring.vo.Comment;

public class ReturnReviewDetailService {

	private UserDao dao;

	public ReturnReviewDetailService(UserDao dao) {
		this.dao = dao;
	}
	
	@Transactional
	public void returnReview(Model model, int num, String type) {
		Board boardInfo=dao.selectBoardNum(num);
		
		List<Comment> comments= new ArrayList<Comment>();
		
		comments = dao.getCommentsByNum(num,0);	
		
		
		
		model.addAttribute("returnNum", num);//댓글등록 후 돌아오기위한
		model.addAttribute("board", boardInfo);
		model.addAttribute("comments", comments);//db 댓글 리스트 
		
	}
}


