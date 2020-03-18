package cn.tjx.service;

import cn.tjx.Dao.UserDao;
import cn.tjx.entity.User;

public class UserService {
	public int Add(User u) {
		UserDao ud = new UserDao();
		return ud.Add(u);
	}
	
	public User login(String name,String pwd){
		UserDao ud = new UserDao();
		return ud.login(name, pwd);
	}
	
	public boolean activationCodeVerification(String code) throws Exception{
		UserDao ud = new UserDao();
		return ud.activationCodeVerification(code);
	}
}
