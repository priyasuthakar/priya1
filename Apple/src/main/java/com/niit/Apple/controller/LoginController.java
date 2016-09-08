package com.niit.Apple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.appleproduct.dao.BuyDAO;
import com.niit.appleproduct.dao.CartDAO;
import com.niit.appleproduct.dao.CatagoryDAO;
import com.niit.appleproduct.dao.ProductDAO;
import com.niit.appleproduct.models.Buy;
import com.niit.appleproduct.models.Cart;
import com.niit.appleproduct.models.Catagory;
import com.niit.appleproduct.models.Product;

@Controller
public class LoginController {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private Product product;
	@Autowired
	private CatagoryDAO catagoryDAO;
	@Autowired
	private Catagory catagory;
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private Cart cart;

	@RequestMapping("/")
	public String home() {
		return "Home";
	}

	/*@RequestMapping("/Home")
	public String home1() {
		return "Home";
	}*/
	
	@RequestMapping("/portfolio")
	public String portfolio() {
		return "portfolio";
	}
	
	@RequestMapping("/about")
	public String aboutus() {
		return "about";
	}
	
	@RequestMapping("/contactus")
	public String contactus() {
		return "contactus";
	}

	/*@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}*/
	
	@RequestMapping("/product1")
	    
	    public ModelAndView listPrdct(HttpServletRequest req) {
			String catname=req.getParameter("catname"); 
			Catagory catagory = catagoryDAO.getByName(catname);
			ModelAndView mv=new ModelAndView("product1");
			String loggedInUser =req.getRemoteUser();
			List <Cart> cartList=cartDAO.list(loggedInUser);
			mv.addObject("cartSize", cartList.size());
			List <Product> plist = productDAO.getByCatagory(catagory.getId());
			Gson gson=new Gson();
			String listp=gson.toJson(plist);
			System.out.println(listp);
			mv.addObject("listp", listp);
	         return mv;
		}		 
	 @RequestMapping("/productinfo")
	 public ModelAndView pdtinfo(HttpServletRequest req)
	 {
			System.out.println("Displaying");
			String pdid=req.getParameter("pdid"); 
	    	product=productDAO.get(Integer.parseInt(pdid));
			ModelAndView mv=new ModelAndView("productinfo");
			String loggedInUser =req.getRemoteUser();
			List <Cart> cartList=cartDAO.list(loggedInUser);
			mv.addObject("cartSize", cartList.size());
			List <Product> pro=productDAO.getByProduct(product.getId());
			System.out.println("ProdctList"+ pro);
			mv.addObject("productinfo", pro);
	         return mv;
			
	 
	 }
		
}
