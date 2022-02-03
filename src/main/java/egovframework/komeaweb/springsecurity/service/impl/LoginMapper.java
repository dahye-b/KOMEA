package egovframework.komeaweb.springsecurity.service.impl;

import egovframework.komeaweb.springsecurity.service.KomeaUser;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("loginMapper")
public interface LoginMapper {
	
	public KomeaUser getUsersByID(String username) throws Exception;

}
