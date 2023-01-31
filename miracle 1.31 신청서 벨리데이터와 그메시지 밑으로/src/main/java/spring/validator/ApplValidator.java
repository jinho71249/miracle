package spring.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.vo.Adoption;
import spring.vo.Appl;

public class ApplValidator implements Validator{
	
	private static final String emailExp="^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
	//2~3 3~4 4자리
	private static final String phoneExp="(\\d{2,3})(\\d{3,4})(\\d{4})";

	private Pattern patternEmail =Pattern.compile(emailExp);  
	private Pattern patternPhone =Pattern.compile(phoneExp);

	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return Appl.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Appl appl=(Appl)target;
		
		if(appl.getAppl_Email()==null || appl.getAppl_Email().trim().isEmpty()) {
			errors.rejectValue("appl_Email", "required"); 
		}
		else {
			Matcher matcher = patternEmail.matcher(appl.getAppl_Email());
			if(!matcher.matches()) {
				errors.rejectValue("appl_Email", "badEmail"); 
			}
		}
		if(appl.getAppl_Age()==0) {
			errors.rejectValue("appl_Age", "iszero"); 
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appl_Name", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appl_Tel", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appl_Contact", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appl_Addr", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appl_Job", "required"); 
		
		
		Matcher matcher1=patternPhone.matcher(appl.getAppl_Tel());
		if(!matcher1.matches()) {
			errors.rejectValue("appl_Tel", "badTel");
		}
		

	}

}
