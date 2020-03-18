package cn.tjx.entity;

import java.util.List;

/**
 * 分页实体
 * @author tjx
 * @version 2020/01/02
 *
 */
public class pageBean<T> {
	private int pageSize;//每页显示数
	private int pageCode;//当前页
	private int totalSize;//总页数
	private List<Route> beanList;
	private String url;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCode() {
		return pageCode;
	}
	public void setPageCode(int pageCode) {
		this.pageCode = pageCode;
	}
	public int getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	public List<Route> getBeanList() {
		return beanList;
	}
	public void setBeanList(List<Route> beanList) {
		this.beanList = beanList;
	}
	public pageBean() {
		
	}
	public pageBean(int pageSize, int pageCode, int totalSize, List<Route> beanList) {
		this.pageSize = pageSize;
		this.pageCode = pageCode;
		this.totalSize = totalSize;
		this.beanList = beanList;
	}
	
	//总页数=总记录数/每页显示数
	public int totalPage(){
		return totalSize%pageSize==0?totalSize/pageSize:(totalSize/pageSize)+1;
		
	}
	@Override
	public String toString() {
		return "pageBean [pageSize=" + pageSize + ", pageCode=" + pageCode + ", totalSize=" + totalSize + ", beanList="
				+ beanList + "]";
	}
	
}
