package spring.controller;



import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import spring.dao.UserDao;

@Controller
public class InsertController {
	
	private UserDao UserDao;

	public InsertController(UserDao userDao) {
		UserDao=userDao;
	}
	
	
	
	@GetMapping("insert")
	public String insert() {
		
		
		return "insertImgForm";
	}
	
	
	@PostMapping("insert")
	public String getInfo(HttpServletRequest request) {
		try {
			
			String path="C:\\resources";

			MultipartRequest mr=new MultipartRequest(request, path, 
					1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			System.out.println(mr.getFilesystemName("file"));  
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
		return "main";
	}
}





