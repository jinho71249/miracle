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
	  }
	 

}
