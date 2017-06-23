package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import bean.Stock;

public class ActionServlet extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String uri=request.getRequestURI();
		String action=uri.substring(uri.lastIndexOf("/"),
				uri.lastIndexOf("."));
		if(action.equals("/quoto")){
			//模拟生成八只水果的价格信息
			//然后。将这些信息转换成json字符串，并
			//发送到客户端
		
				List<Stock> smore=new ArrayList<Stock>();
				Random r=new Random();
				DecimalFormat df=new DecimalFormat("#.##");
				for(int i=0;i<10;i++){	
					Stock s=new Stock();
					s.setName("西瓜"+r.nextInt(20));
					s.setCode("1000"+r.nextInt(20));
					double price=1+r.nextInt(1)+r.nextDouble();
					s.setPrice(Double.parseDouble(df.format(price)));
					smore.add(s);			
				}
				JSONArray arr=JSONArray.fromObject(smore);
				//System.out.println(arr.toString());//这里只是控制台输出
				out.println(arr.toString());//输出返回到ajax对象
		
		}
		out.close();
	}

}
