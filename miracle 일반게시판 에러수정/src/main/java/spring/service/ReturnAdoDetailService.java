package spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import spring.dao.UserDao;
import spring.vo.Adoption;
import spring.vo.Comment;

public class ReturnAdoDetailService {
	private UserDao userDao;

	public ReturnAdoDetailService(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Transactional
	public void returnAdo(Model model, int num, String type) {
		Adoption adoInfo=userDao.selectAdoByNum(num);
		
		List<Comment> comments= new ArrayList<Comment>();
		
		comments = userDao.getCommentsByNum(0,num);
		
		model.addAttribute("returnNum", num);//댓글등록 후 돌아오기위한
		model.addAttribute("info", adoInfo);
		model.addAttribute("comments", comments);//db 댓글 리스트 
		
	}
	
	

}
