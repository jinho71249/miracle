package spring.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.vo.Board;

public class ReviewBoardWriteValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Board.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		/* Board board = (Board) target; */
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "board_Title", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "board_Content", "required");
	

	
	}

	
}
