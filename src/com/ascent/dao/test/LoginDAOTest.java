package com.ascent.dao.test;
import com.ascent.bean.Productuser;
import com.ascent.dao.LoginDAO;
import junit.framework.Assert;
import junit.framework.TestCase;
/**
 * ��¼������
 * @author ascent
 *
 */
public class LoginDAOTest extends TestCase {
	private LoginDAO loginDAO;
	/**
	 * �ڲ��Է���ִ��ǰִ��
	 */ 
	protected void setUp() throws Exception {
		loginDAO = new LoginDAO();
	}
	/**
	 * ִ�в��Է������ͷ���Դ
	 */
	protected void tearDown() throws Exception {
		loginDAO = null;
	}

	/**
	 * LoginDAO����login������Ӧ�ĵ�Ԫ���Է���
	 */
	public void testLogin() {
		//�û�ascentuser ����123456 ����
		Productuser pu = loginDAO.login("ascentuser","123456");	
		/**
		 * ����pu��Ϊnull�Ķ���,���puΪnull��¼��ѯʧ��
		 * ҵ�񷽷�����,����ʧ��,��ʾ����ѯ����
		 * ���������ȷ����ʾ��ɫ�ɹ�������
		 */
		Assert.assertNotNull("��ѯ����",pu);
	}

}
