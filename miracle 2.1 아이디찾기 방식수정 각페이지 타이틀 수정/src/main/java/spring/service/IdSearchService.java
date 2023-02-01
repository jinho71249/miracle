package spring.service;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import spring.Exception.IdNotSearchException;
import spring.dao.UserDao;
import spring.vo.Search;
import spring.vo.User;

public class IdSearchService {

	
	  private UserDao dao;
	  
	  public IdSearchService(UserDao dao) { 
		  this.dao = dao; 
	  }
	  
	  @Transactional 
	  public void idSearch(Search search,Model model) {
		  User user_Id = dao.searchId(search);
		  if(user_Id==null) {
				throw new IdNotSearchException();
			}
		  
		  model.addAttribute("user",user_Id);
		  model.addAttribute("message", "고객님의 아이디는  <strong>"+user_Id.getUser_Id()+"</strong> 입니다" );
		  User data=new User();
		  data.setUser_Id(user_Id.getUser_Id());
		  model.addAttribute("data", data);
	  }
	 

}
