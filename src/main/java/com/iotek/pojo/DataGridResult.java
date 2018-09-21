package com.iotek.pojo;

import java.util.List;

public class DataGridResult<T> {
	private Integer total;
	private Integer CurrentPage;
	private Integer pageCount;
	private List<T> rows;

	public Integer getCurrentPage() {
		return CurrentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.CurrentPage = currentPage;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}


	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
}
