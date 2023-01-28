package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Guide {

	@RequestMapping("guide")
	public String guide() {
		return "guide";
	}
}
