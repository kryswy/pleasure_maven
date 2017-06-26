package com.pleasure.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pleasure.dto.Cart;
import com.pleasure.dto.Product;
import com.pleasure.dto.User;
import com.pleasure.service.CartService;
import com.pleasure.service.ProductService;



import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/29.
 */
@Controller
public class CartController {

	@Resource
	private CartService cartService;

	@Resource
	private ProductService productCartService;
	
	@RequestMapping("/cart.do")
    public void goCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null){
            request.getRequestDispatcher("index.do").forward(request,response);

        }else {
            Cart cart = cartService.getCartByID(user.getUserID());
            if (cart==null){
                Date d = new Date();
                String date=(new SimpleDateFormat("yyyy-MM-dd")).format(d);
                int userID = user.getUserID();
                cartService.createCart(userID,date);
                cart = cartService.getCartByID(user.getUserID());
            }

            Map<Product,Integer> productAmountMap = new HashMap();
            List<Map<String,Integer>> idAmountList =  cartService.getProductList(cart.getCartID());

            for (Map<String,Integer> map:idAmountList){
                productAmountMap.put(productCartService.getProductById(map.get("productID")),map.get("amount"));
            }
            request.setAttribute("cart",cart);
            request.setAttribute("pmap",productAmountMap);
            request.setAttribute("plist",idAmountList);
            request.getRequestDispatcher("checkout.jsp").forward(request,response);
        }
    }
	
	@RequestMapping("/changeamount.do")
	public void changeAmount(HttpServletRequest request,
			HttpServletResponse response) {
		int cartID = Integer.parseInt(request.getParameter("cartID"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		int productID = Integer.parseInt(request.getParameter("productID"));
		cartService.changeAmount(cartID, productID, amount);
	}
	
	@RequestMapping("/deleteproduct.do")
	public void deleteProduct(HttpServletRequest request,
			HttpServletResponse response) {
		int cartID = Integer.parseInt(request.getParameter("cartID"));
		int productID = Integer.parseInt(request.getParameter("productID"));
		cartService.deleteProduct(cartID, productID);
	}
	
	@RequestMapping("/countprice.do")
	public void countPrice(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int cartID = Integer.parseInt(request.getParameter("cartID"));
		List<Map<String, Integer>> idAmountList = cartService
				.getProductList(cartID);
		double sum = 0;
		for (Map<String, Integer> map : idAmountList) {
			sum += productCartService.getProductById(map.get("productID"))
					.getPrice() * map.get("amount");
		}

		cartService.countPrice(sum, cartID);
		Double count = cartService.getCount(cartID);
		response.getWriter().print(count);
	}
	
	@RequestMapping("/addProcductToCart.do")
	public void addProcductToCart(int amount, int productID, HttpSession session) {
		User user = (User) session.getAttribute("user");
		int userID = user.getUserID();
		cartService.addProcductToCart(amount, productID, userID);
	}
}
