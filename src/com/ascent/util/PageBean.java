package com.ascent.util;
import java.util.ArrayList;
/**
 * @author Administrator
 * @version ����ҳ����Ƶ� JavaBean
 */
public class PageBean {			
	public int currentPage;				// ��ǰҳ��
	public int totalPage;				// ��ҳ��
	public int totalRows;				// ������
	public int rowsPage = 5;			// ÿҳ��ʾ������
	public ArrayList data;				// ��װҳ����ʾ������
	public PageBean(){}
	public void countTotalPage(){		// ������ҳ��
		if(totalRows%rowsPage==0){
			this.totalPage = totalRows/rowsPage;
		}
		else{
			this.totalPage = totalRows/rowsPage + 1;
		}
	}
	public ArrayList getData(){		
		return data;
	}
	
	public PageBean(int totalRows){
		this.totalRows = totalRows;
		this.countTotalPage();
	}
}
