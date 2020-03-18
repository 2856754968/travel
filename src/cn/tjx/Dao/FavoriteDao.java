package cn.tjx.Dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

public class FavoriteDao {
	public boolean collect(String rid, String date, String uid) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "INSERT tab_favorite VALUES(?,?,?)";
		int add = qr.update(sql, rid, date, uid);
		int update = 0;
		if (add > 0) {
			sql = "UPDATE tab_route SET `count`=`count`+1 WHERE rid=?";
			update = qr.update(sql, rid);
		}
		return update > 0 ? true : false;
	}
	
	public boolean count(String uid,String rid) throws SQLException{
		QueryRunner qr = new QueryRunner(JDBCUrl.getDataSource());
		String sql = "DELETE FROM tab_favorite WHERE rid=? AND uid =? ";
		int del = qr.update(sql,rid,uid);
		int update = 0;
		if(del>0){
			sql = "UPDATE tab_route SET `count`=`count`-1 WHERE rid=?";
			update = qr.update(sql,rid);
		}
		return update > 0 ? true : false;
	}

}
