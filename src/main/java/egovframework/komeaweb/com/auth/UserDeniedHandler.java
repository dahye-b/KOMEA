package egovframework.komeaweb.com.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class UserDeniedHandler implements AccessDeniedHandler{
	private static final Logger LOGGER = LoggerFactory.getLogger(UserDeniedHandler.class);
	
	public void handle(HttpServletRequest req, HttpServletResponse res, AccessDeniedException ade) throws IOException, ServletException {
		
		LOGGER.info("LocalizedMessage : {}", ade.getLocalizedMessage());
		LOGGER.info("Message : {}", ade.getMessage());
		LOGGER.info("StackTrace : {}", ade.getStackTrace());

		req.setAttribute("msg", "로그인에 실패했습니다. \n아이디와 비밀번호를 다시 확인하세요.");
		req.getRequestDispatcher("/komea/login.jsp").forward(req, res);
		
	}
}