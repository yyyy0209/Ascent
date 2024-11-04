package com.ascent.dao.test;

import java.sql.SQLException;
import java.util.List;

import junit.framework.TestCase;
import junit.framework.Assert;
import com.ascent.dao.OrderDAO;
/**
 * ������Ԫ������
 * @author ascent
 *
 */
public class OrderDAOTest extends TestCase {
	private OrderDAO orderDAO;
	protected void setUp() throws Exception {
		orderDAO = new OrderDAO();
	}

	protected void tearDown() throws Exception {
		orderDAO = null;
	}
	//��ѯ���ж������Է���
	public void testOrderAllList() {
		List list=null;
		try {
			list = orderDAO.OrderAllList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		/**
		 * ���ݿ��ж���Ϊ3��  ����ֵ3
		 */
		Assert.assertEquals(3, list.size());
	}

}
