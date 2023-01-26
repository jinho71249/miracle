package spring.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.vo.Comment;

public class CommentValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Comment.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Comment comment=(Comment)target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "com_Name", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "com_Pwd", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "com_Con", "required"); 
		
	}

}
