package spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.UserDao;
import spring.service.ReturnAdoDetailService;
import spring.service.ReturnReviewDetailService;
import spring.validator.AdoboardWriteValidator;
import spring.validator.CommentValidator;
import spring.vo.Adoption;
import spring.vo.Comment;

@Controller
public class CommentController {
	private UserDao userDao;
	private ReturnAdoDetailService returnAdoDetailSvc;
	private ReturnReviewDetailService returnReviewDetailSvc;
	
	public CommentController(UserDao userDao, ReturnAdoDetailService returnAdoDetailSvc,ReturnReviewDetailService returnReviewDetailSvc) {
		this.returnReviewDetailSvc = returnReviewDetailSvc;
		this.userDao = userDao;
		this.returnAdoDetailSvc = returnAdoDetailSvc;
	}


	@RequestMapping("commentWrite")
	public String commentWrite(@RequestParam("returnNum") int num, Comment comment, Model model, Errors errors) {
		String type=(""+num).substring(0, 1);//첫글자 따오기
		String returnPath="main";
		
		if(type.equals("1")) {//입양홍보글일때
			new CommentValidator().validate(comment, errors);
			if(!errors.hasErrors()) {//에러가 없으면 insert
				comment.setCom_Ado_Num(num);
				userDao.insertComment(comment, 1);
			}
			returnAdoDetailSvc.returnAdo(model, num, type);
			returnPath="adoBoardDetail";
		}
		
		else if(type.equals("3")){ // 입양후기
			new CommentValidator().validate(comment, errors);
			if(!errors.hasErrors()) {
				comment.setCom_Board_Num(num);
				userDao.insertComment(comment, 3);
			}
			returnReviewDetailSvc.returnReview(model, num, type);
			returnPath="reviewBoardDetail";
		}
		
		else if(type.equals("4")) { // 정보공유
			new CommentValidator().validate(comment, errors);
			if(!errors.hasErrors()) {
				comment.setCom_Board_Num(num);
				userDao.insertComment(comment, 4);
			}
			returnReviewDetailSvc.returnReview(model, num, type);
			returnPath="infoBoardDetail";
		}
		
		else if(type.equals("5")) { // 자유
			new CommentValidator().validate(comment, errors);
			if(!errors.hasErrors()) {
				comment.setCom_Board_Num(num);
				userDao.insertComment(comment, 5);
			}
			returnReviewDetailSvc.returnReview(model, num, type);
			returnPath="freeBoardDetail";
		}
		
		model.addAttribute("comment", new Comment());
		return returnPath;
	}
	
	
	@PostMapping("commentUpdate")
	public String commentUpdate(@RequestParam("returnNum") int num, Comment comment, Model model) {
		String returnPath="main";
		String type=(""+num).substring(0, 1);
		if(type.equals("1")) {
			userDao.upadateComment(comment, 1);
			
			returnAdoDetailSvc.returnAdo(model, num, type);
			
			returnPath="adoBoardDetail";
		}
		else if(type.equals("3")){
			userDao.upadateComment(comment, 3);
			
			returnReviewDetailSvc.returnReview(model, num, type);
			
			returnPath="reviewBoardDetail";
		}
		else if(type.equals("4")) {
			userDao.upadateComment(comment, 4);
			returnReviewDetailSvc.returnReview(model, num, type);
			model.addAttribute("comment", new Comment());
			returnPath="infoBoardDetail";
		}
		else if(type.equals("5")) {
			userDao.upadateComment(comment, 5);
			returnReviewDetailSvc.returnReview(model, num, type);
			returnPath="freeBoardDetail";
		}
		model.addAttribute("comment", new Comment());
		return returnPath;
	}
	
	
	
	@RequestMapping("commentDel")
	public String commentDel(@RequestParam("returnNum") int num, 
							@RequestParam("com_Num") int delNum, Model model){     
		String returnPath="main";
		String type=(""+num).substring(0, 1);
		
		
		if(type.equals("1")) {
			userDao.deleteComment(delNum);
			returnAdoDetailSvc.returnAdo(model, num, type);
			
			returnPath="adoBoardDetail";
		}
		else if(type.equals("3")) {
			userDao.deleteComment(delNum);
			returnReviewDetailSvc.returnReview(model,num, type);
			
			model.addAttribute("comment", new Comment());
			
			returnPath="reviewBoardDetail";
		}
		else if(type.equals("4")) {
			userDao.deleteComment(delNum);
			returnReviewDetailSvc.returnReview(model,num, type);
			
			model.addAttribute("comment", new Comment());
			
			returnPath="infoBoardDetail";
		}
		else if(type.equals("5")) {
			userDao.deleteComment(delNum);
			returnReviewDetailSvc.returnReview(model,num, type);
			
			model.addAttribute("comment", new Comment());
			
			returnPath="freeBoardDetail";
		}
		return returnPath;
	}
	
	
}
