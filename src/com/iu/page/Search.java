package com.iu.page;

public class Search {
	
	private String kind;
	private String search;
	
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
		if(kind==null || kind.equals("")) {
		this.kind = "title";
		}
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
		if(search==null) {
			this.search="";
		}
	}
	

}
