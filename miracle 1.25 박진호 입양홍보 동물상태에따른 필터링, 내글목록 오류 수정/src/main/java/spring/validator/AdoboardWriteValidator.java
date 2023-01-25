package spring.validator;

import javax.servlet.jsp.tagext.ValidationMessage;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.vo.Adoption;

public class AdoboardWriteValidator implements Validator {
	
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
		
		if(adoption.getAdo_AniAge()==0) {
			errors.rejectValue("ado_AniAge", "iszero"); 
		}
		if(adoption.getAdo_AniWeight()==0.0) {
			errors.rejectValue("ado_AniWeight", "iszero"); 
		}
		
	}

}
