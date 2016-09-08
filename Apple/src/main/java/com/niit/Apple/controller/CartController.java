package com.niit.Apple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.appleproduct.dao.CartDAO;
import com.niit.appleproduct.dao.ProductDAO;
import com.niit.appleproduct.models.Cart;
import com.niit.appleproduct.models.Product;
import com.niit.appleproduct.models.User;

@Controller
public class CartController {
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private Product product;
	@Autowired
	private Cart cart;
	@Autowired
	private User user;
	@Autowired
	private ProductDAO productDAO;
			
	@RequestMapping("/cart{id}")
	public ModelAndView  addcart(@PathVariable("id") int id,HttpSession session,HttpServletRequest req) {
		ModelAndView mv= new ModelAndView(); 
		Product product = productDAO.get(id); 
	   Cart cart=new Cart();
		cart.setPrice(product.getPrice());
		cart.setPname(product.getName());
		String loggedInUser=req.getRemoteUser();
		if(req.getRemoteUser()!=null){
		cart.setUsername(loggedInUser);
		System.out.println("hai");
		cartDAO.saveOrUpdate(cart);
		List <Cart> cartList=cartDAO.list(loggedInUser);
		mv.addObject("cartSize", cartList.size());
        mv.setViewName("Home");
		}
		else{
			mv.addObject("logincart", "Please Login to save for wish list");
			mv.setViewName("login");
		}
       return mv;

	}
	@RequestMapping(value="/viewcart")
	public String viewcart(Model model,HttpSession session){
		model.addAttribute("cart",new Cart());
		String loggedInUser= (String) session.getAttribute("loggedInUser");
        model.addAttribute("cartList", cartDAO.list(loggedInUser));
	/*	model.addAttribute("totalAmount", cartDAO.getTotalsize(loggedInUser));
	*/	model.addAttribute("CartList", "CART LIST");
		return "viewcart";
		
	}
	@RequestMapping("/del{id}")
	public String deletecategory(@PathVariable("id") int id) {
		cartDAO.delete(id);
		return "redirect:/viewcart";
	}
	}