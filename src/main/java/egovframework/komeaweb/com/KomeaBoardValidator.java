package egovframework.komeaweb.com;

import org.springframework.validation.Errors;

import egovframework.komea.bbs.service.KomeabbsVO;

public class KomeaBoardValidator{

	public boolean supports(Class clazz){
		return KomeabbsVO.class.isAssignableFrom(clazz);
	}

	public String get_BoardName(Object object, Errors errors){

		KomeabbsVO bbsVO = (KomeabbsVO)object;
		String BoardName = "";

		if(bbsVO.getbCode().equals("B001")){//mn09
			BoardName = "공지사항";
		}else if(bbsVO.getbCode().equals("B002")){//mn08
			BoardName = "간행물";
		}else if(bbsVO.getbCode().equals("B007")){//mn08
			BoardName = "KOMEA 국문뉴스레터";
		}else if(bbsVO.getbCode().equals("B008")){//mn08
			BoardName = "KOMEA 영문뉴스레터";
		}else if(bbsVO.getbCode().equals("B009")){//mn08
			BoardName = "보도자료";
		}else if(bbsVO.getbCode().equals("B010")){//mn09
			BoardName = "사업공고";
		}else if(bbsVO.getbCode().equals("B011")){//mn09
			BoardName = "열린제안";
		}else if(bbsVO.getbCode().equals("B013")){//mn08
			BoardName = "산업동향 정보";
		}else if(bbsVO.getbCode().equals("B014")){//mn08
			BoardName = "거점기지 프로젝트 정보";
		}else if(bbsVO.getbCode().equals("B015")){//mn07
			BoardName = "글로벌인증NEWS";
		}
		
		return BoardName;
	}
	
	public String get_BoardFileName(Object object, Errors errors){

		KomeabbsVO bbsVO = (KomeabbsVO)object;
		String BoardFileName = "";

		if(bbsVO.getbCode().equals("B001")){
			BoardFileName = "Board01";
		}else if(bbsVO.getbCode().equals("B002")){
			BoardFileName = "Board02";
		}else if(bbsVO.getbCode().equals("B007")){
			BoardFileName = "Board07";
		}else if(bbsVO.getbCode().equals("B008")){
			BoardFileName = "Board08";
		}else if(bbsVO.getbCode().equals("B009")){
			BoardFileName = "Board09";
		}else if(bbsVO.getbCode().equals("B010")){
			BoardFileName = "Board10";
		}else if(bbsVO.getbCode().equals("B011")){
			BoardFileName = "Board11";
		}else if(bbsVO.getbCode().equals("B013")){
			BoardFileName = "Board13";
		}else if(bbsVO.getbCode().equals("B014")){
			BoardFileName = "Board14";
		}else if(bbsVO.getbCode().equals("B015")){
			BoardFileName = "Board15";
		}
		
		return BoardFileName;
	}
}