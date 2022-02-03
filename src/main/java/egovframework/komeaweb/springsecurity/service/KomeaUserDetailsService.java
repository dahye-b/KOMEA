package egovframework.komeaweb.springsecurity.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class KomeaUserDetailsService implements UserDetailsService{

	@Autowired
	private LoginService loginService;
	
	@Override
	public UserDetails loadUserByUsername(String j_username) throws UsernameNotFoundException {
		
		System.out.println(j_username);

		KomeaUser komeaUser = new KomeaUser();
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		UserDetails user = null;
		
		try{
			komeaUser = loginService.getUsersByID(j_username);
			roles.add(new SimpleGrantedAuthority("ROLE_USER"));
			
			if(komeaUser==null){
				System.out.println("User not found");
				throw new UsernameNotFoundException("입력한 사용자를 찾을수 없습니다: "+ j_username);
			}
		}catch(Exception e){
			
		}
		System.out.println("User : "+komeaUser);


		user = new User(komeaUser.getUsername(),komeaUser.getPassword(), roles);
				
		return user;
	}

}
