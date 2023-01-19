package spring.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.vo.Board;

public class InfoBoardWriteValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Board.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "board_Title", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "board_Content", "required");

	}

	
	
	
}
