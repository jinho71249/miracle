package spring.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.vo.RegisterRequest;
import spring.vo.Search;

public class IdSearchValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return Search.class.isAssignableFrom(clazz); 
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Name", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Tel", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Birth", "required"); 
	}
}
