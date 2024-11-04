package com.ascent.dao.test;
import java.util.List;
import com.ascent.dao.ProductDAO;
import junit.framework.Assert;
import junit.framework.TestCase;
/**
 * ��Ʒģ�鹦��ʵ�ֲ�����
 * @author ascent
 *
 */
public class ProductDAOTest extends TestCase {
	private ProductDAO productDAO;
	/**
	 * ��Ԫ���Գ�ʼ��ִ�з���
	 */
	protected void setUp() throws Exception {
		productDAO = new ProductDAO();
	}
	/**
	 * ��Ԫ�����ͷ���Դ����
	 */
	protected void tearDown() throws Exception {
		productDAO = null;
	}
	/**
	 * ��ѯ������Ʒ��������
	 */
	public void testGetallProduct() {
		//���ò�ѯ������Ʒҵ�񷽷�
		List list = productDAO.getallProduct();
		/**
		 * ���ݿ�  ��Ʒ����һ��7����¼
		 * �ж�����ֵ7  �� ʵ��ֵlist.size()�Ƿ����
		 */
		Assert.assertEquals(7, list.size());
	}

}
