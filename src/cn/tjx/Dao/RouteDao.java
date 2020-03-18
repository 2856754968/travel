package cn.tjx.Dao;

import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import cn.tjx.entity.Route;
import cn.tjx.entity.RouteImg;

public class RouteDao {
	public Route detailed(String rid) throws Exception {
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "SELECT rid,rname,price,routeIntroduce,`count`,sid FROM tab_route WHERE rid=?";
		Route r = qr.query(sql, new BeanHandler<Route>(Route.class), rid);
		sql = "SELECT bigPic,smallPic FROM tab_route_img WHERE rid=?";
		List<RouteImg> list = qr.query(sql, new BeanListHandler<RouteImg>(RouteImg.class), rid);
		r.setRouteImgList(list);
		return r;
	}
}
