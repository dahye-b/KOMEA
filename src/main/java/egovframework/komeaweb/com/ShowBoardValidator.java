package egovframework.komeaweb.com;

import org.springframework.validation.Errors;

import egovframework.komeaweb.com.service.ShowVO;


public class ShowBoardValidator {
	public boolean supports(Class clazz){
		return ShowVO.class.isAssignableFrom(clazz);
	}

	public String get_BoardName(Object object, Errors errors){

		ShowVO showVO = (ShowVO)object;
		String BoardName = "";

		if(showVO.getBbsTy().equals("0")){
			BoardName = "행사안내";
		}else if(showVO.getBbsTy().equals("1")){
			BoardName = "성공사례";
		}else if(showVO.getBbsTy().equals("2")){
			BoardName = "입찰공고";
		}else if(showVO.getBbsTy().equals("3")){
			BoardName = "보도자료";
		}else if(showVO.getBbsTy().equals("4")){
			BoardName = "정보마당";
		}else if(showVO.getBbsTy().equals("5")){
			BoardName = "상담문의";
		}else if(showVO.getBbsTy().equals("6")){
			BoardName = "우수기업선정";
		}
		
		return BoardName;
	}
	
	public String get_BoardFileName(Object object, Errors errors){

		ShowVO showVO = (ShowVO)object;
		String BoardFilePath = "";

		if(showVO.getBbsTy().equals("0")){
			BoardFilePath = "mn04/notice";
		}else if(showVO.getBbsTy().equals("1")){
			BoardFilePath = "mn04/success";
		}else if(showVO.getBbsTy().equals("2")){
			BoardFilePath = "mn04/bidding";
		}else if(showVO.getBbsTy().equals("3")){
			BoardFilePath = "mn04/report";
		}else if(showVO.getBbsTy().equals("4")){
			BoardFilePath = "mn04/info";
		}else if(showVO.getBbsTy().equals("5")){
			BoardFilePath = "mn04/advice";
		}else if(showVO.getBbsTy().equals("6")){
			BoardFilePath = "mn04/bestComp";
		}
		
		return BoardFilePath;
	}
}
