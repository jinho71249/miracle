package spring.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.jsp.tagext.ValidationMessage;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.vo.Adoption;

public class AdoboardWriteValidator implements Validator {
	

	private static final String phoneExp="(\\d{2,3})(\\d{3,4})(\\d{4})";
	private Pattern patternPhone =Pattern.compile(phoneExp);
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return Adoption.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Adoption adoption=(Adoption)target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ado_Breed", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ado_AniVaccin", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ado_AniDiscovery", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ado_Tel", "required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ado_AniCareplace", "required"); 
		
		Matcher matcher=patternPhone.matcher(adoption.getAdo_Tel());
		if(!matcher.matches()) { 
			errors.rejectValue("ado_Tel", "badTel");
		}
		
		if(adoption.getAdo_AniAge()==0) {
			errors.rejectValue("ado_AniAge", "iszero"); 
		}
		
		
		
	}

}
