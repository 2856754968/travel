package cn.tjx.Dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.tjx.entity.User;

public class UserDao {

	// 注册用户
	public int Add(User u) {
		int result = 0;
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "INSERT tab_user VALUE(DEFAULT,?,?,?,?,?,?,?,?,?)";
		try {
			result = qr.update(sql, u.getUsername(), u.getPassword(), u.getName(), u.getBirthday(), u.getSex(),
					u.getTelephone(), u.getEmail(), u.getStatus(), u.getCode());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 验证用户
	public User login(String name, String pwd) {
		User u = null;
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "SELECT uid,username,`status` FROM tab_user WHERE username=? AND PASSWORD=?";
		try {
			u = qr.query(sql, new BeanHandler<User>(User.class), name, pwd);
			if (u != null) {
				u.setUsername(name);
				u.setPassword(pwd);
			}
		} catch (SQLException e) {
			throw new RuntimeException("验证用户异常");
		}
		return u;
	}

	// 激活码验证和激活
	public boolean activationCodeVerification(String code) throws Exception {
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "SELECT COUNT(*) FROM tab_user WHERE `code`=?";
		Number num = qr.query(sql, new ScalarHandler<>(), code);
		if (num.intValue() > 0) {
			sql = "UPDATE tab_user SET `status`='Y' WHERE `code`=?";
			int update = qr.update(sql, code);
			return update > 0 ? true : false;
		} else {
			return false;
		}
	}
}
