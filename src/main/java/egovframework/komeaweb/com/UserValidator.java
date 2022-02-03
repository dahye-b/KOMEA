package egovframework.komeaweb.com;

import org.springframework.validation.Errors;

import egovframework.komeaweb.com.service.MberVO;

public class UserValidator {

	public boolean supports(Class clazz){
		return MberVO.class.isAssignableFrom(clazz);
	}

	public String get_userid_validate(Object object, Errors errors){

		MberVO mberVO = (MberVO)object;
		String id_ok = "";

		if(mberVO.getCnt() > 0){
			id_ok = "N";
			errors.rejectValue("id", "errors.userid");
		}else{
			id_ok = "Y";
			errors.rejectValue("id", "errors.useridok");
		}
		System.out.println("@@ : "+id_ok);
		
		return id_ok;
	}
}