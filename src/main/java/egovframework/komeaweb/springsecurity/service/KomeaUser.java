package egovframework.komeaweb.springsecurity.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


public class KomeaUser implements UserDetails{
	
	private String username;
	private String password;
	
	public Collection<? extends GrantedAuthority> getAuthorities(){
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		
		return authorities;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public boolean isAccountNonExpired(){
		return true;
	}
	
	public boolean isAccountNonLocked(){
		return true;
	}
	
	public boolean isCredentialsNonExpired(){
		return true;
	}
	
	public boolean isEnabled(){
		return true;
	}

}
