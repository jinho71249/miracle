package spring.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.vo.PwdSearchCommand;

public class SearchAndPwdChangdValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {

		return PwdSearchCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
	
			//형변환
			PwdSearchCommand pwdSearchInfo = (PwdSearchCommand) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Id", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Tel", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_Birth", "required");
		
		
	}
	
	

}
