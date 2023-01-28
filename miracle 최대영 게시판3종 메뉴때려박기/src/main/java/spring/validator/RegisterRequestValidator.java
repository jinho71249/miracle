package spring.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.vo.RegisterRequest;

public class RegisterRequestValidator implements Validator {

	private static final String emailExp="^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
	private Pattern pattern =Pattern.compile(emailExp); 
	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return RegisterRequest.class.isAssignableFrom(clazz); 
	}

	@Override
	public void validate(Object target, Errors errors) {
		RegisterRequest regReq = (RegisterRequest)target;
		
		if(regReq.getUser_Email()==null || regReq.getUser_Email().trim().isEmpty()) {
			regReq.setUser_Email("noEmail@noEmail.com"); 
		}
		else {
			Matcher matcher = pattern.matcher(regReq.getUser_Email());
			if(!matcher.matches()) {
				errors.rejectValue("user_Email", "bad"); 
			}
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Id", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Pwd", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Pwdck", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Name", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Tel", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Birth", "required"); 
		
		if(!regReq.isPassWordEqualToConfirmPassword()) {
			errors.rejectValue("user_Pwd", "nomatch"); 
		}
		
	}

}
