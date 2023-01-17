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
import spring.validator.AdoboardWriteValidator;
import spring.validator.CommentValidator;
import spring.vo.Adoption;
import spring.vo.Comment;

@Controller
public class CommentController {
	private UserDao userDao;
	private ReturnAdoDetailService returnAdoDetailSvc;
	
	public CommentController(UserDao userDao, ReturnAdoDetailService returnAdoDetailSvc) {
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
			
			model.addAttribute("comment", new Comment());
			
			returnPath="adoBoardDetail";
		}
		
		return returnPath;
	}
	
	
}
