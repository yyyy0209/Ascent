package com.ascent.util;

import java.util.HashMap;

import com.ascent.bean.Product;

public class ShopCart {
	
	private HashMap<String,Product> hashmap;

	
    public HashMap<String, Product> getHashmap() {
		return hashmap;
	}

	public void setHashmap(HashMap<String, Product> hashmap) {
		this.hashmap = hashmap;
	}

	public ShopCart ()
    {hashmap= new HashMap(); }
    
    /**
	 * ���hashmap���Ƿ����˸�pid��Ӧ�Ķ��󷽷�
	 * @param pid
	 * @return true����   false����
	 */
    
     public boolean CheckHashMapid(String pid)
     {
    	 boolean b=false;
    	 if(hashmap.containsKey(pid))
    	 {
    		b=true; 
    	 }
    	 return b;
     }
     /**
      * ���ﳵ�����Ʒ����
 	 * ���ж�hashmap��û��pid��Ӧ��Ʒ��Ϊfalse��������product
 	 * @param pid
 	 * @param product
 	 */
 	public void addProduct(String pid,Product product){
 		if(hashmap==null){
 			hashmap= new HashMap();
 		}
 		if(hashmap.containsKey(pid)==false)//���ﳵ�в����ڸ���Ʒ
    	 {
 			hashmap.put(pid, product);
    	 }
 		 
 	}
     
     /**
 	 * ����idɾ��hashmap�е�product
 	 * @param pid
 	 */
     public void removeHashMap(String pid)
     {
    	 hashmap.remove(pid);
     }

     /**
 	 * �޸�hashmap��pid��Ӧproduct������
 	 * @param pid
 	 * @param quantity
 	 */
     public void UpdateProductNumbedr(String pid,String quantity)
     {
    	  hashmap.get(pid).setQuantity(quantity);
     }
     
     /**
 	 * ������ﳵ
 	 */
     public void emptyCart()
     {
    	 hashmap.clear();
     }
}
