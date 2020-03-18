package cn.tjx.Dao;

/**
 * 分页Dao
 * @author tjx
 * 2020-01-10
 */
import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import cn.tjx.entity.Route;
import cn.tjx.entity.pageBean;

public class pageDao {
	public pageBean<Route> findAll(int pageSize, int pageCode, String rid, String rname) throws Exception {
		pageBean<Route> pb = new pageBean<Route>();
		pb.setPageSize(pageSize);// 设置每页显示数
		pb.setPageCode(pageCode);// 设置当前页
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "SELECT COUNT(*) FROM tab_route where rname like ?";// 定义查询总页数的sql语句
		Number num = qr.query(sql, new ScalarHandler<>(), "%" + rname + "%");
		pb.setTotalSize(num.intValue());// 设置总记录数
		// 查询当前页显示的内容
		if (rid == null && rname != null) {
			pb.setBeanList(search(rname, pageSize, pageCode));
		} else {
			pb.setBeanList(search1(rid));
		}
		return pb;
	}

	public List<Route> search(String rname, int pageSize, int pageCode) {
		List<Route> list = null;
		String sql = "SELECT rid,rname,price,routeIntroduce,rimage FROM tab_route WHERE rname LIKE ? LIMIT ?,?";
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		try {
			list = qr.query(sql, new BeanListHandler<Route>(Route.class), "%" + rname + "%", (pageCode - 1) * pageSize,
					pageSize);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Route> search1(String rid) {
		List<Route> r = null;
		String sql = "SELECT rid,rname,price,routeIntroduce,rimage FROM tab_route WHERE rid=? ";
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		try {
			r = qr.query(sql, new BeanListHandler<>(Route.class), rid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return r;
	}

	public pageBean<Route> cateGoryAll(int pageSize, int pageCode, String cid) {
		pageBean<Route> pb = new pageBean<Route>();
		pb.setPageSize(pageSize);// 设置每页显示数
		pb.setPageCode(pageCode);// 设置当前页
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "SELECT COUNT(*) FROM tab_route  WHERE cid = ?";
		try {
			Number num = qr.query(sql, new ScalarHandler<>(), cid);
			pb.setTotalSize(num.intValue());
		} catch (SQLException e) {
			throw new RuntimeException("查询cid分页异常");
		}
		// 查询每页显示数
		sql = "SELECT rid,rname,price,routeIntroduce,rimage FROM tab_route WHERE cid = ? LIMIT ?,?";
		try {
			List<Route> list = qr.query(sql, new BeanListHandler<Route>(Route.class), cid, (pageCode - 1) * pageSize,
					pageSize);
			pb.setBeanList(list);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return pb;
	}

	public pageBean<Route> findAll(int pageSize, int pageCode, String uid) {
		pageBean<Route> pb = new pageBean<Route>();
		pb.setPageSize(pageSize);// 设置每页显示数
		pb.setPageCode(pageCode);// 设置当前页
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "SELECT COUNT(*) FROM tab_favorite WHERE uid=?";// 查询总记录数
		try {
			Number num = qr.query(sql, new ScalarHandler<>(), uid);
			pb.setTotalSize(num.intValue());
			sql = "SELECT tab_route.rid,rname,price,rimage FROM tab_route "
					+ "JOIN tab_favorite ON tab_route.rid = tab_favorite.rid WHERE uid = ? LIMIT ?,?";
			List<Route> list = qr.query(sql, new BeanListHandler<Route>(Route.class), uid, (pageCode - 1) * pageSize,
					pageSize);
			pb.setBeanList(list);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return pb;
	}

	public pageBean<Route> collect(int ps, int pc, String rname, int begin, int end) {
		pageBean<Route> pb = new pageBean<Route>();
		pb.setPageSize(ps);// 设置每页显示数
		pb.setPageCode(pc);// 设置当前页
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "select count(*) from tab_route where rname like ? AND price BETWEEN ? AND ?";// 根据条件查询出总记录数
		try {
			Number num = qr.query(sql, new ScalarHandler<>(), "%" + rname + "%", begin, end);
			System.out.println(num.intValue());
			pb.setTotalSize(num.intValue());// 设置总记录数
			sql = "select rid,rname,price,rimage,`count` from tab_route where rname like ? AND price BETWEEN ? AND ? ORDER BY `count` DESC LIMIT ?,?";
			List<Route> list = qr.query(sql, new BeanListHandler<Route>(Route.class), "%" + rname + "%", begin, end,
					(pc - 1) * ps, ps);
			pb.setBeanList(list);// 设置每页显示数
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pb;
	}

	public pageBean<Route> collect(int ps, int pc) {
		pageBean<Route> pb = new pageBean<Route>();
		pb.setPageSize(ps);// 设置每页显示数
		pb.setPageCode(pc);// 设置当前页
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "select count(*) from tab_route ";// 查询出所有总记录数
		try {
			Number num = qr.query(sql, new ScalarHandler<>());
			pb.setTotalSize(num.intValue());// 设置总记录数
			sql = "select rid,rname,price,rimage,`count` from tab_route  ORDER BY `count` DESC LIMIT ?,?";
			List<Route> list = qr.query(sql, new BeanListHandler<Route>(Route.class), (pc - 1) * ps, ps);
			pb.setBeanList(list);// 设置每页显示数
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pb;
	}
}
