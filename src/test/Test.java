package test;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.sun.org.apache.xerces.internal.impl.dv.xs.DecimalDV;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import bean.Stock;

public class Test {
	//{"code":"1000","name":"�ײ�","price":1.2}
	//code和name顺序反了没关系
	//java对象转换成json字符串
	public static void test1(){
		Stock s=new Stock();
		s.setName("西瓜");
		s.setCode("1000");
		s.setPrice(1.2);
		
		JSONObject obj=JSONObject.fromObject(s);
		System.out.println(obj.toString());
	}
	/*
	 * java对象组成的集合转换成一个json字符串
	 */
	public static void test2(){
		List<Stock> smore=new ArrayList<Stock>();
		Random r=new Random();
		DecimalFormat df=new DecimalFormat("#.##");
		for(int i=0;i<3;i++){	
			Stock s=new Stock();
			s.setName("西瓜"+r.nextInt(10));
			s.setCode("1000"+r.nextInt(10));
			double price=r.nextInt(10)+r.nextDouble();
			s.setPrice(Double.parseDouble(df.format(price)));
			smore.add(s);			
		}
		JSONArray arr=JSONArray.fromObject(smore);
		System.out.println(arr.toString());
	}
	/*
	 * java对象组成的数组转换成一个json字符串
	 */
	public static void test3(){
		Stock[] smore=new Stock[3];
		Random r=new Random();
		DecimalFormat df=new DecimalFormat("#.##");
		for(int i=0;i<3;i++){	
			Stock s=new Stock();
			s.setName("西瓜"+r.nextInt(10));
			s.setCode("1000"+r.nextInt(10));
			double price=r.nextInt(10)+r.nextDouble();
			s.setPrice(Double.parseDouble(df.format(price)));
			smore[i]=s;
		}
		JSONArray arr=JSONArray.fromObject(smore);
		System.out.println(arr.toString());
	}
	
	public static void main(String[] args) {
		test1();
		test2();
		test3();
	}
}
