package cn.tjx.Dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCUrl {
	private static ComboPooledDataSource ds = new ComboPooledDataSource();

	public static Connection getConnection() {
		try {
			return ds.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException("连接异常");
		}
	}

	public static DataSource getDataSource() {
		return ds;
	}

}
