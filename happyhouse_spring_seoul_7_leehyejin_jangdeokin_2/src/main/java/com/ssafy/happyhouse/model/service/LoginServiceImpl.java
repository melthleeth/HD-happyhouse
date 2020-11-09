//package com.ssafy.happyhouse.model.service;
//
//import com.ssafy.happyhouse.model.dao.*;
//import com.ssafy.happyhouse.model.dto.MemberDto;
//
//public class LoginServiceImpl implements LoginService {
//	
//	LoginDao loginDao;
//	
//	public LoginServiceImpl() {
//		loginDao = new LoginDaoImpl();
//	}
//	
//	@Override
//	public MemberDto login(String username, String password) throws Exception{
//		if (username == null || password == null) return null;
//		return loginDao.login(username, password);
//	}
//}
