package com.niit.Apple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.appleproduct.dao.BuyDAO;
import com.niit.appleproduct.models.Buy;
import com.niit.appleproduct.models.Cart;
import com.niit.appleproduct.models.User;

@Controller
public class BuyController {
	
	@Autowired
	private BuyDAO buyDAO;
	@Autowired
	private Buy buy;
	@Autowired
	private User user;
	
	@RequestMapping("/buy")
	public String buy(Model model){
		model.addAttribute("buy", buy); 
		model.addAttribute("isbuyClickedRegisterHere", "true"); 
		return "/buy";
	}

	@RequestMapping(value = "/buy", method = RequestMethod.POST)
	public ModelAndView buypost(@ModelAttribute("buy") Buy buy,HttpSession session,HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String loggedInUser=req.getRemoteUser();
		if(req.getRemoteUser()!=null){
		System.out.println("hai");
		buyDAO.saveOrUpdate(buy);
		mv.addObject("successbuy", "You are successfully purchased");
        mv.setViewName("Home");
		}
		else{
			mv.addObject("logincart", "Please Login to buy");
			mv.setViewName("login");
		}
       	return mv;
	}
	/*
	@RequestMapping("/proceded")
	public String proceded() {
		return "proceded";
	}
	*/
	
}