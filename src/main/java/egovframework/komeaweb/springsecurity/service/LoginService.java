package egovframework.komeaweb.springsecurity.service;

public interface LoginService {

	//KomeaUser findById(int id);
	
	KomeaUser getUsersByID(String username) throws Exception;
	
}
