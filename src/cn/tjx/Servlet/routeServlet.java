package cn.tjx.Servlet;

/**
 * 搜索结果并跳转到显示页面
 */
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.tjx.Dao.JDBCUrl;
import cn.tjx.Dao.pageDao;
import cn.tjx.entity.Route;
import cn.tjx.entity.pageBean;
import cn.tjx.service.RouteService;

public class routeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		if ("searchRname".equals(type)) {
			//根据旅游线路名称来模糊查询并分页
			String rname = request.getParameter("rname");
			rname = new String(rname.getBytes("ISO-8859-1"), "UTF-8");
			int pc = getPc(request);
			// 设置ps每页显示多少条记录
			int ps = 10;
			pageDao pd = new pageDao();
			pageBean<Route> all = null;
			try {
				all = pd.findAll(ps, pc, null, rname);
				String url = subUrl(request);
				all.setUrl(url);
			} catch (Exception e) {
				e.printStackTrace();
			}
			List<Route> top = this.initTop();
			request.setAttribute("list", all);
			request.setAttribute("top", top);
			request.getRequestDispatcher("/route_list.jsp").forward(request, response);
		} else if ("cateCid".equals(type)) {
			//根据分类id来分页显示
			String cid = request.getParameter("cid");
			int pc = this.getPc(request);
			// 设置ps每页显示多少条记录
			int ps = 10;
			pageDao pd = new pageDao();
			pageBean<Route> all = pd.cateGoryAll(ps, pc, cid);
			String url = subUrl(request);
			all.setUrl(url);
			request.setAttribute("list", all);
			List<Route> top = this.initTop();
			request.setAttribute("top", top);
			request.getRequestDispatcher("/route_list.jsp").forward(request, response);
		} else if ("cateUid".equals(type)) {
			String uid = request.getParameter("uid");
			int pc = this.getPc(request);
			int ps = 10;
			pageDao pd = new pageDao();
			pageBean<Route> all = pd.findAll(ps, pc, uid);
			all.setUrl(this.subUrl(request));
			request.setAttribute("list", all);
			request.getRequestDispatcher("/myfavorite.jsp").forward(request, response);
		} else if ("collect".equals(type)) {
			String rname = request.getParameter("rname");
			rname = new String(rname.getBytes("ISO-8859-1"), "UTF-8");
			Integer begin = Integer.parseInt(request.getParameter("begin"));
			Integer end = Integer.parseInt(request.getParameter("end"));
			int pc = this.getPc(request);
			// 设置ps每页显示多少条记录
			int ps = 10;
			pageDao pd = new pageDao();
			pageBean<Route> all = pd.collect(ps, pc, rname, begin, end);
			all.setUrl(this.subUrl(request));
			request.setAttribute("list", all);
			request.getRequestDispatcher("/favoriterank.jsp").forward(request, response);
		} else if ("collect1".equals(type)) {
			int pc = this.getPc(request);
			// 设置ps每页显示多少条记录
			int ps = 10;
			pageDao pd = new pageDao();
			pageBean<Route> all = pd.collect(ps, pc);
			all.setUrl(this.subUrl(request));
			request.setAttribute("list", all);
			request.getRequestDispatcher("//favoriterank.jsp").forward(request, response);
		}
	}

	// 获取当前页
	public int getPc(HttpServletRequest request) {
		int pc = 0;
		String value = request.getParameter("pc");
		if (value == null || value.trim() == "") {
			pc = 1;
		} else {
			pc = Integer.parseInt(value);
		}
		return pc;
	}

	// 获取项目的访问地址是否带参数
	public String subUrl(HttpServletRequest request) {
		String contextPath = request.getContextPath();// 获取项目名称
		String servlePath = request.getServletPath();// 获取Servlet名称
		String queryString = request.getQueryString();// 获取参数部分
		if (queryString != null) {// 判断参数个数
			if (queryString.contains("&pc=")) {
				int index = queryString.lastIndexOf("&pc=");// 获取pc对应的下标
				queryString = queryString.substring(0, index);// 获取分页条件
			}
			return contextPath + servlePath + "?" + queryString;
		} else {
			return contextPath + servlePath + "?";
		}
	}
	
	public List<Route> initTop(){
		List<Route> list = null;
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "SELECT rid,rname,price,rimage FROM tab_route ORDER BY `count` DESC LIMIT 5 ";
		try {
			list = qr.query(sql, new BeanListHandler<Route>(Route.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
