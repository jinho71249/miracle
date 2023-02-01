package spring.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.vo.RegisterRequest;

public class RegisterRequestValidator implements Validator {

	private static final String emailExp="^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
	//2~3 3~4 4자리
	private static final String phoneExp="(\\d{2,3})(\\d{3,4})(\\d{4})";
	//YYYYMMDD
	private static final String birthExp="(19|20)\\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[01])";
	
	private Pattern patternEmail =Pattern.compile(emailExp);  
	private Pattern patternPhone =Pattern.compile(phoneExp);
	private Pattern patternBirth =Pattern.compile(birthExp);
	
	
	
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
			Matcher matcher = patternEmail.matcher(regReq.getUser_Email());
			if(!matcher.matches()) {
				errors.rejectValue("user_Email", "badEmail"); 
			}
		}
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Id", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Pwd", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Pwdck", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Name", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Tel", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Birth", "required"); 
		
		Matcher matcher1=patternPhone.matcher(regReq.getUser_Tel());
		if(!matcher1.matches()) {
			errors.rejectValue("user_Tel", "badTel");
		}
		
		Matcher matcher2=patternBirth.matcher(regReq.getUser_Birth());
		if(!matcher2.matches()) {
			errors.rejectValue("user_Birth", "badBirth");
		}
		
		if(!regReq.isPassWordEqualToConfirmPassword()) {
			errors.rejectValue("user_Pwd", "nomatch"); 
		}
		
	}

}
