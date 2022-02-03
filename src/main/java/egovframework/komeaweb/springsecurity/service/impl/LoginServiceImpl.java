package egovframework.komeaweb.springsecurity.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.komeaweb.springsecurity.service.KomeaUser;
import egovframework.komeaweb.springsecurity.service.LoginService;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	
	@Resource(name="loginMapper")
	private LoginMapper loginMapper;
	
	public KomeaUser getUsersByID(String username) throws Exception{
		return loginMapper.getUsersByID(username);
	}

}
