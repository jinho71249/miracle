package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import spring.Exception.IdNotSearchException;
import spring.dao.UserDao;
import spring.service.IdSearchService;
import spring.validator.IdSearchValidator;
import spring.validator.RegisterRequestValidator;
import spring.vo.RegisterRequest;
import spring.vo.Search;
import spring.vo.User;

@Controller
public class IdSearchController {
	
	private IdSearchService idSearchSvc; 
	
	public IdSearchController(IdSearchService idSearchSvc) {
		this.idSearchSvc=idSearchSvc;
	}
	
	@GetMapping("idSearch")
	public String SearchIdGet(Model model) {
		 model.addAttribute("data",new Search()); 
		return "idSearch";
	}
	
	@PostMapping("idSearchCom")
	public String SearchId(@ModelAttribute("data") Search search, Model model,Errors errors) {
		
		new IdSearchValidator().validate(search, errors);
		
		if(errors.hasErrors()) {
			return "idSearch";
		}
		try {
			idSearchSvc.idSearch(search, model);
			return "idSearchCom";
		}catch (IdNotSearchException e) {
			model.addAttribute("message","존재하지 않는 회원입니다.");
			return "idSearch";
		}
	}
	
	
	
	
	
	

}
