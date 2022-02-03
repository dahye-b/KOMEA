package egovframework.komeaweb.com.auth;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.ui.ModelMap;

import egovframework.komeaweb.com.service.MberService;
import egovframework.komeaweb.com.service.MberVO;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Resource(name="mberService")
	private MberService mberService;
	
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException{
		HttpSession session = request.getSession(false);
		ModelMap model = new ModelMap();
		
		MberVO mberVO = new MberVO();
		mberVO.setId(auth.getName());
		
		String url = "";
		
		try{
			MberVO resultVO = mberService.SelectMber(mberVO);
			System.out.println("------------- Login Start -------------");
			System.out.println("@ mberCd : "+resultVO.getMberCd());
			System.out.println("@ ssbyp : "+resultVO.getSsbyp());
			System.out.println("@ sbscrbConfmYn : "+resultVO.getSbscrbConfmYn());
			System.out.println("------------- Login End -------------");
			
			if(resultVO != null){
				//if(resultVO.getId().equals("komec")){
				if(resultVO.getCompLevel().equals("A")){//관리자
					request.getSession().setAttribute("isAdmin", Boolean.valueOf(true));
				}
				//승인여부
				if(resultVO.getSbscrbConfmYn().equals("N")){
					url = "/komea/login.do?flag=failConfm";
				}else{
					if(resultVO.getSsbyp().equals("2")){
						//기업회원인 경우 업데이트한다
						mberService.UpdateLevel(resultVO);
					}
					request.getSession().setAttribute("authYn", "Y");
					request.getSession().setAttribute("loginInfo", resultVO);
					model.addAttribute("srvStat", "I");
					
					url = "/komeaMain.do";
					System.out.println("------------- Login Success!! -------------");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("------------- Login Fail!! -------------");
			System.out.println("LoginSuccessHandler Exception : onAuthenticationSuccess Error!");
		}
		
		response.sendRedirect(request.getContextPath()+url);
	}
}
