package cn.tjx.Dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.tjx.entity.Category;
import cn.tjx.entity.Route;

public class Initialize {

	// 主题旅游查询
	public List<Route> theme() {
		List<Route> list = null;
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		// 定义SQL语句
		String sql = "SELECT rid,rname,price,rimage FROM tab_route WHERE isThemeTour = 1;";
		try {
			list = qr.query(sql, new BeanListHandler<Route>(Route.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 人气旅游
	public List<Route> PopularTourist() {
		List<Route> list = null;
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "SELECT rid,rname,price,rimage FROM tab_route ORDER BY `count` DESC LIMIT 4 ";
		try {
			list = qr.query(sql, new BeanListHandler<Route>(Route.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// 最新
	public List<Route> Newest() {
		List<Route> list = null;
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "SELECT rid,rname,price,rimage FROM tab_route ORDER BY rdate DESC LIMIT 4 ";
		try {
			list = qr.query(sql, new BeanListHandler<Route>(Route.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// 导航栏
	public List<Category> NavigationBar() {
		List<Category> list = null;
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "SELECT cid,cname FROM tab_category ORDER BY cid";
		try {
			list = qr.query(sql, new BeanListHandler<Category>(Category.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// 国内游板块
	public List<Route> DomesticTravel() {
		List<Route> list = null;
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "SELECT rid,rname,price,rimage FROM tab_route WHERE cid = 5 LIMIT 40,8";
		try {
			list = qr.query(sql, new BeanListHandler<Route>(Route.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
