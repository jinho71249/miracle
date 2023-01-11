package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import spring.service.RegiModifyService;
import spring.vo.RegisterRequest;
import spring.vo.User;

@Controller
public class RegisterModifyController {

	private RegiModifyService RegiModifySvc;

	public RegisterModifyController(RegiModifyService regiModifySvc) {
		RegiModifySvc = regiModifySvc;
	}
	
	@GetMapping("regiModi")
	public String RegiModiGet() {
		return "regiModi";
	}
	@PostMapping("regiModi")
	public String RegiModiPost(RegisterRequest reg){
		
		RegiModifySvc.RegiModify(reg);
		
		
		return "main";
	}
}
