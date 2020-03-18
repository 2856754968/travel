package cn.tjx.Servlet;
/**
 * 智能搜索匹配
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.eclipse.jdt.internal.compiler.parser.Scanner;

import com.alibaba.fastjson.JSON;

import cn.tjx.Dao.JDBCUrl;
import cn.tjx.Dao.pageDao;
import cn.tjx.entity.Category;
import cn.tjx.entity.Route;
import cn.tjx.entity.Seller;
import cn.tjx.service.FavoriteService;
import cn.tjx.service.RouteService;
import cn.tjx.service.SellerService;


public class searchServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		PrintWriter out = response.getWriter();
		pageDao rs = new pageDao();
		if("index".equals(type)){
			String rname = request.getParameter("rname");
			List<Route> search = rs.search(rname, 10, 1);
			String json = JSON.toJSONString(search);
			out.print(json);
		}else if("detailed".equals(type)){
			String rid = request.getParameter("rid");
			RouteService rs1 = new RouteService();
			SellerService sls = new SellerService();
			try {
				Route detailed = rs1.detailed(rid);
				Seller seller = sls.findAll(detailed.getSid());
				detailed.setSeller(seller);
				request.setAttribute("r",detailed);
				request.getRequestDispatcher("/route_detail.jsp").forward(request, response);
			} catch (Exception e) {
				throw new RuntimeException("详细信息异常"+e.getMessage());
			}
		}else if("collect".equals(type)){
			FavoriteService fs = new FavoriteService();
			String rid = request.getParameter("rid");
			String date = request.getParameter("date");
			String uid = request.getParameter("uid");
			try {
				boolean collect = fs.collect(rid, date, uid);
				out.print(collect);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("collection".equals(type)){
			String uid = request.getParameter("uid");
			String rid = request.getParameter("rid");
			try {
				String collection = this.collection(uid, rid);
				out.print(collection);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("count".equals(type)){
			String uid = request.getParameter("uid");
			String rid = request.getParameter("rid");
			FavoriteService fs = new FavoriteService();
			try {
				boolean count = fs.count(uid, rid);
				out.print(count);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		out.flush();
		out.close();
	}
	
	
	public String collection(String uid,String rid) throws SQLException{
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "SELECT COUNT(*) FROM tab_favorite WHERE rid = ? AND uid = ?";
		Number query = qr.query(sql, new ScalarHandler<>(),rid,uid);
		sql = "SELECT `count` FROM tab_route WHERE rid = ?";
		Route route = qr.query(sql, new BeanHandler<Route>(Route.class),rid);
		String json = "[{\"sp\":"+query.intValue()+",\"count\":"+route.getCount()+"}]";
		return json;	
	}

}
