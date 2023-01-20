package spring.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.vo.LoginInfo;
import spring.vo.RegisterRequest;

public class LoginValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return LoginInfo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		LoginInfo loginInfo = (LoginInfo)target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Id", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Pwd", "required"); 
		
	}

}
