package cn.tjx.Dao;

import java.sql.SQLException;

/**
 * 商家dao层
 * @author tjx
 */
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.tjx.entity.Seller;

// 查询商家信息
public class SellerDao {
	public Seller findAll(int sid) {
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "SELECT sname,consphone,address FROM tab_seller WHERE sid=?";
		Seller seller = null;
		try {
			seller = qr.query(sql, new BeanHandler<Seller>(Seller.class), sid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return seller;
	}
}
