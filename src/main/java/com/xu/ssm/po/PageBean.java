package com.xu.ssm.po;

import java.util.List;

public class PageBean<T> {
	private int currPage;// ��ǰҳ��
	private int pageSize = 5;// ÿҳ��ʾ�ļ�¼��
	private int totalCount;// �ܼ�¼��
	private int totalPage;// ��ҳ��
	private List<T> listT;// ÿҳ����ʾ������

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		currPage = currPage < 1 ? 1 : currPage;
		if(totalPage!=0)
		currPage = currPage < totalPage ? currPage : totalPage;
		this.currPage = currPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage() {
		this.totalPage = (int) Math.ceil((double)this.getTotalCount() / pageSize);
	}

	public List<T> getListT() {
		return listT;
	}

	public void setListT(List<T> listT) {
		this.listT = listT;
	}
}
