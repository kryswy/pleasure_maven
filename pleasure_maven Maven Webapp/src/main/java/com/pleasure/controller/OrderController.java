package com.pleasure.controller;




import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pleasure.dto.Cart;
import com.pleasure.dto.Order;
import com.pleasure.dto.Product;
import com.pleasure.dto.User;
import com.pleasure.service.CartService;
import com.pleasure.service.OrderService;
import com.pleasure.service.ProductService;
import com.pleasure.service.UserService;




import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/30.
 */
@Controller
public class OrderController {

	@Resource
    CartService cartOrderService;
	@Resource
    OrderService orderService;
	@Resource 
    ProductService productService;
	@Resource
    UserService userService;
    @RequestMapping("/cartbuy.do")
    @ResponseBody
    public Integer createOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	User user = (User) request.getSession().getAttribute("user");
    	if(user.getActivate().equals("0")){
    		return 0;
    	}else{
    		int cartID = Integer.parseInt(request.getParameter("cartID"));
            Cart cart = cartOrderService.getCartByCartID(cartID);
            List<Map<String, Integer>> productList = cartOrderService.getProductList(cartID);

            Order order = new Order(cart.getUserID(), (new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(new Date()), cart.getPrice());
            orderService.createOrder(order);
            Order lastOrder = orderService.getLastOrder();

            for (Map<String, Integer> map:productList){
                orderService.addProducts(lastOrder.getOrderID(),map.get("productID"),map.get("amount"));
                productService.UpdateProductHot(map.get("productID"),map.get("amount"));
            }

          
            cartOrderService.emptyCart(cartID);
            
            return 1;
    	}
        
     
    }
    @RequestMapping("/getOrderByID.do")
	@ResponseBody
	public String getOrderByID(int id,HttpServletRequest request){
		
		Order o=orderService.getOrderByID(id);
		if(o==null){
			return null;
		}
		int UserID =o.getUserID();
		User u = userService.getUserById(UserID);
		ArrayList<Integer> productsID = orderService.getProductsIDByID(id);
		String html="";
		html+="<div class=\"oneOrder\" style=\"background-color:#efefef;\">";
		html+="	<div class=\"orderOrder\" style=\"height:36px;\">";
		html+="		<div style=\"float:left;\"><a style=\"color:#555555;\">&nbsp;&nbsp;&nbsp;�µ�ʱ�䣺"+o.getDate()+"</a></div>";
		html+="		<div style=\"float:right;\"><a style=\"color:#555555; \">�����ţ�"+o.getOrderID()+"&nbsp;&nbsp;&nbsp;</a><br></div>";
		html+="	</div>";
		for (int i = 0; i < productsID.size(); i++) {
			Product p=productService.getProductById(productsID.get(i));
			if(i!=0){
				html+="<div class=\"clearfix\"></div>";
				html+="<p style=\" height:20px; background-color:#cccccc;\"></p>";
			}
		html+="	<div class=\"orderProduct\" width:60%; height:230px;\">";
		html+="		<div style=\"float:left;  width:18%; height:230px;\">";
		html+="			<img src=\"productimgs/"+p.getImageURL1()+"\" width=\"230px\" height=\"230px\">";
		html+="			</div>";
		html+="		<div style=\"float:left;  width:42%; height:230px;\">";
		html+="			<p style=\" height:60px; font-size: 18px;\"><a  style=\"color:#555555;\">��Ʒ��ƣ�"+p.getName()+"</a></p><br>";
		html+="			<p style=\" height:60px; font-size: 18px;\"><a style=\"color:#555555;\">��Ʒ�۸�"+p.getPrice()+"Ԫ</a></p><br> ";
		html+="			<p style=\" height:110px;\"><a style=\"color:#555555;\">��Ʒ������"+p.getDescription()+"</a> </p><br>";
		html+="		</div>";
		html+="	</div>";
		}
		
		html+="	<div class=\"orderUser\" style=\"float:right; width:36%; height:230px;\">";
		html+="		<p style=\" height:60px; font-size: 18px;\"><a style=\"color:#333333;\">�û���"+u.getUserName()+"</a></p><br> ";
		html+="		<p style=\" height:60px; font-size: 18px;\"><a style=\"color:#333333;\">����"+u.getFirstName()+u.getLastName()+"</a></p><br> ";
		html+="		<p style=\" height:60px; font-size: 18px;\"><a style=\"color:#333333;\">�û����䣺heheda@sina.com</a></p><br> ";
		html+="	</div>";
		html+="<div class=\"clearfix\"></div>";
		html+="<p style=\" height:16px; background-color:#cccccc;\"></p>";
		html+="	<div class=\"orderOrder\" style=\"background-color:#cccccc;\">";
		html+="		<a href=\" deleteOrderByIDInAdmin.do?id="+o.getOrderID()+"\" style=\"color:#555555;\">ɾ��˶���</a>";
		html+="		<div style=\"float:right;\"></datalist><a style=\"color:#555555;\">�ܼۣ�"+o.getPrice()+"Ԫ&nbsp;&nbsp;&nbsp;</a><br> <br></div>";
		html+="	</div>";
		html+="</div>";
		
		return html;
	}
	@RequestMapping("/getOrderByUserID.do")
	public ModelAndView getOrderBuUserID(int id,HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		String html="";
		
		ArrayList<Integer> OrdersID=orderService.getOrderByUserID(id);
		System.out.println("OrdersID:"+OrdersID);
		for(int i=0;i<OrdersID.size();i++){
			Order o=orderService.getOrderByID(OrdersID.get(i));
			ArrayList<Integer> productsID = orderService.getProductsIDByID(o.getOrderID());
			//System.out.println("productsID:"+productsID);
			html+="<p style=\" height:30px; background-color:#ffffff;;\"></p>";
			html+="<div class=\"oneOrder\" style=\"background-color:#efefef;\">";
			html+="	<div class=\"orderOrder\" style=\"height:36px;\">";
			html+="		<div style=\"float:left;\"><a style=\"color:#555555;\">&nbsp;&nbsp;&nbsp;�µ�ʱ�䣺"+o.getDate()+"</a></div>";
			html+="		<div style=\"float:right;\"><a style=\"color:#555555; \">�����ţ�"+o.getOrderID()+"&nbsp;&nbsp;&nbsp;</a><br></div>";
			html+="	</div>";
			for (int j = 0; j < productsID.size(); j++) {
				Product p=productService.getProductById(productsID.get(j));
				if(j!=0){
					html+="<div class=\"clearfix\"></div>";
					html+="<p style=\" height:20px; background-color:#cccccc;\"></p>";
				}
			html+="	<div class=\"orderProduct\" width:60%; height:230px;\">";
			html+="	<div style=\"float:left;  width:18%; height:230px;\">";
			html+="		<img src=\"productimgs/"+p.getImageURL1()+"\" width=\"230px\" height=\"230px\">";
			html+="		</div>";
			html+="	<div style=\"float:left;  width:42%; height:230px;\">";
			html+="		<p style=\" height:60px; font-size: 18px;\"><a style=\"color:#555555;\">��Ʒ��ƣ�"+p.getName()+"</a></p><br>";
			html+="		<p style=\" height:60px; font-size: 18px;\"><astyle=\"color:#555555;\">��Ʒ�۸�"+p.getPrice()+"Ԫ</a></p><br> ";
			html+="		<p style=\" height:110px;\"><a style=\"color:#555555;\">��Ʒ������"+p.getDescription()+"</a> </p><br>";
			html+="	</div>";
			html+="</div>";
			}
			html+="<div class=\"clearfix\"></div>";
			html+="<p style=\" height:16px; background-color:#cccccc;\"></p>";
			html+="<div class=\"orderOrder\" style=\"background-color:#cccccc;\">";
			html+="<a href=\" deleteOrderByIDInUser.do?id="+o.getOrderID()+"&userID="+id+"\" style=\"color:#555555;\">ɾ��˶���</a>";
			html+="	<div style=\"float:right;\"></datalist><a style=\"color:#555555;\">�ܼۣ�"+o.getPrice()+"Ԫ&nbsp;&nbsp;&nbsp;</a><br> <br></div>";
			html+="</div>";
			html+="</div>";
		}
		
		mv.addObject("html", html);
		mv.setViewName("myOrders.jsp");
		return mv;
	}
	@RequestMapping("/deleteOrderByIDInAdmin.do")
	public String deleteOrderByIDInAdmin(int id){
		orderService.deleteOrderByID(id);
		return "redirect:admin.do";
	}
	@RequestMapping("/deleteOrderByIDInUser.do")
	public String deleteOrderByIDInUser(int id,int userID){
		orderService.deleteOrderByID(id);
		return "redirect:getOrderByUserID.do?id="+userID;
	}
	
}
