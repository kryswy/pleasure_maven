package com.pleasure.controller;

import java.io.UnsupportedEncodingException;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pleasure.dto.PClass;
import com.pleasure.dto.Product;
import com.pleasure.dto.User;
import com.pleasure.service.ClassService;
import com.pleasure.service.ProductService;


@Controller
public class ProductController {

	@Resource
	private ProductService productService;
	@Resource
	private ClassService classProductService;
	@RequestMapping("/getProductsByClassID.do")
	public String getProductsByClassId(Integer classID, ModelMap map,
			HttpSession session) {
		if(classID==null){
			return "redirect:index.do";
		}else{
			List<Product> plist = productService.getProductsByClassId(classID);
			int pID = classProductService.getParentClassID(classID);
			if (classProductService.getParentClassID(pID) == 0) {
				map.addAttribute("pClass", classProductService.getClassByID(pID));
				session.setAttribute("lastPClass",
						classProductService.getClassByID(pID));
			} else {
				map.addAttribute("pClass", classProductService
						.getClassByID(classProductService.getParentClassID(pID)));
				session.setAttribute("lastPClass", classProductService
						.getClassByID(classProductService.getParentClassID(pID)));
			}
			map.addAttribute("classID", classID);
			map.addAttribute("plist", plist);
			return "forward:products.jsp";
		}
		
		
	}
	@RequestMapping("/getTop10.do")
	public String getTop10(ModelMap mm) {
		List<Product> plist = productService.getProductsTop10();
		Product no1 = plist.get(0);
		Product no2 = plist.get(1);
		plist.remove(no1);
		plist.remove(no2);
		mm.addAttribute("no1", no1);
		mm.addAttribute("no2", no2);
		mm.addAttribute("plist", plist);
		return "forward:index.jsp";
	}
	@RequestMapping("/index.do")
	public String goIndex(HttpSession session) {
		String realPath=this.getClass().getResource("/").getPath();
		int index=realPath.lastIndexOf("/WEB");
		realPath=realPath.substring(1,index);
		session.setAttribute("projectPath", realPath);
		return "getTop10.do";
	}
	@RequestMapping("/searchProduct.do")
	public String searchProduct(Integer class1, Integer class2, Integer class3,
			String range, ModelMap mm, HttpSession session) {
		int minPrice = Integer.parseInt(range.split("-")[0]);
		int maxPrice = Integer.parseInt(range.split("-")[1]);
		// System.out.println("class1:"+class1+"\nclass2:"+class2+"\nclass3:"+class3+"\namount:"+range+"\nminPrice:"+minPrice+"\nmaxPrice:"+maxPrice);
		PClass pClass = (PClass) session.getAttribute("lastPClass");
		mm.addAttribute("pClass", pClass);
		mm.addAttribute("classID", 0);
		List<Product> plist = new ArrayList<Product>();

		if (class1 == null && class2 == null && class3 == null) {
			if(pClass==null){
				plist=productService.getProductsByDSQL(null, null, null, minPrice, maxPrice);
			}else{
				List<PClass> clist1 = classProductService.getChildsById(pClass
						.getClassID());
				for (PClass c : clist1) {
					List<Product> plist1 = productService.getProductsByClassId(c
							.getClassID());
					for (Product p : plist1) {
						if (p.getPrice() >= minPrice && p.getPrice() <= maxPrice
								&& p.getClass1() == c.getClassID())
							plist.add(p);
					}
					List<PClass> clist2 = classProductService.getChildsById(c
							.getClassID());
					for (PClass cc : clist2) {
						List<Product> plist2 = productService
								.getProductsByClassId(cc.getClassID());
						for (Product p : plist2) {
							if (p.getPrice() >= minPrice
									&& p.getPrice() <= maxPrice
									&& p.getClass1() == cc.getClassID())
								plist.add(p);
						}
					}
				}
			}
			
		} else {
			plist = productService.getProductsByDSQL(class1, class2, class3,
					minPrice, maxPrice);
		}
		mm.addAttribute("plist", plist);
		// System.out.println(plist);

		return "forward:products.jsp";
	}
	@RequestMapping("/unconditional.do")
	public String getProductByUnconditional(int parentID, ModelMap map) {
		List<PClass> clist = classProductService.getAllChildProducts(parentID);
		List<Product> allProducts = productService.getAllProducts();
		List<Product> resultList = new ArrayList<Product>();
		for (PClass c : clist) {
			for (Product p : allProducts) {
				if (c.getClassID() == p.getClass1()) {
					resultList.add(p);
				}
			}
		}
		map.addAttribute("pClass", classProductService.getClassByID(parentID));
		map.addAttribute("classID", 0);
		map.addAttribute("plist", resultList);
		return "forward:products.jsp";
	}
	@RequestMapping("pricesection.do")
	public String getProductsByPriceSection(ModelMap map, String type,
			int left, int right) {

		if (right == 0) {
			right = 9999;
		}

		List<PClass> clist = null;
		List<Product> allProducts = productService.getAllProducts();
		List<Product> resultList = new ArrayList<Product>();

		if ("food".equals(type)) {
			clist = classProductService.getAllChildProducts(1);
			map.addAttribute("pClass", classProductService.getClassByID(1));
		} else if ("hotel".equals(type)) {
			clist = classProductService.getAllChildProducts(2);
			map.addAttribute("pClass", classProductService.getClassByID(2));
		}

		for (PClass c : clist) {
			for (Product p : allProducts) {
				if (c.getClassID() == p.getClass1()) {
					if (p.getPrice() >= left && p.getPrice() <= right) {
						resultList.add(p);
					}
				}
			}
		}

		map.addAttribute("classID", 0);
		map.addAttribute("plist", resultList);
		return "forward:products.jsp";
	}
	@RequestMapping("/searchByStr.do")
	public String searchByStr(String searchStr, ModelMap mm) throws UnsupportedEncodingException {
		if(searchStr==null){
			return "redirect:index.do";
		}
		searchStr=new String(searchStr.getBytes("ISO-8859-1"),"utf-8");
		List<Product> list = productService.SearchByStr(searchStr);
		//System.out.println("str:"+searchStr+"\nlist:"+list);
		mm.addAttribute("plist", list);
		return "forward:products.jsp";
	}
	
	@RequestMapping("addProduct.do")
	public String addProduct(Product product) {
		product.setImageURL1(product.getImageURL1().substring(product.getImageURL1().lastIndexOf('/')+1));
		product.setImageURL2(product.getImageURL2().substring(product.getImageURL2().lastIndexOf('/')+1));
		product.setImageURL3(product.getImageURL3().substring(product.getImageURL3().lastIndexOf('/')+1));
		productService.addProduct(product);
		return "redirect:admin.do";
	}
	@RequestMapping("getProductByID.do")
	public String getProductByID(Integer id, ModelMap map) {
		Product p = productService.getProductById(id);
		if(p==null){
			return "redirect:index.do";
		}
		map.addAttribute("pclass", classProductService.getClassByID(p.getClass1()));
		map.addAttribute("product", p);
		return "forward:single.jsp";
	}
	@RequestMapping("/adminSearchProduct.do")
	@ResponseBody
	public List<Product> searchProduct(String search) throws UnsupportedEncodingException {
		//search=new String(search.getBytes("ISO-8859-1"),"utf-8"); 
		System.out.println(search);
		ArrayList<Product> list = productService.searchProduct(search);
		return list;
	}
	@RequestMapping("deleteProductByID.do")
	public String deleteProductByID(int id) {
		productService.deleteProductByID(id);
		return "redirect:admin.do";
	}
	@RequestMapping("updateProduct.do")
	public String updateProduct(Product product) {
		productService.updateProduct(product);
		return "redirect:admin.do";
	}
	@RequestMapping("updateProductByID.do")
	public String updateProductByID(int id,ModelMap mm){
		Product p=productService.getProductById(id);
		mm.addAttribute("product", p);
		return "forward:updateProduct.jsp";
	}
	@RequestMapping("collection.do")
	public String getCollections(HttpSession session,ModelMap map){
		User user=(User) session.getAttribute("user");
		if(user==null){
			return "redirect:error.jsp?type=2";
		}
		List<Product> list = productService.getCollections(user);
		map.addAttribute("plist", list);
		return "forward:collect.jsp";
	}
	@RequestMapping("addProcductToCollection.do")
	public void addProcductToCollection(int productID, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user!=null){
			int userID = user.getUserID();
			productService.addProcductToCollection(productID, userID);
		}
	}
	@RequestMapping("deleteProcductFromCollection.do")
	public void deleteProcductFromCollection(int productID, HttpSession session){
		User user = (User) session.getAttribute("user");
		if(user!=null){
			int userID = user.getUserID();
			productService.deleteProcductFromCollection(productID,userID);
		}
	}
}
