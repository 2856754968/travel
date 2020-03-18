package cn.tjx.entity;

public class Category {

	private int cid;// 分类id
	private String cname;// 分类名称

	public Category() {
		
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Category(int cid, String cname) {
		this.cid = cid;
		this.cname = cname;
	}

	public String toString() {
		return "Category [cid=" + cid + ", cname=" + cname + "]";
	}

}
