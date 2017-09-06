package com.grad.net;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grad.net.vo.MemberVo;


@Controller
public class HomeController {
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model, MemberVo memberVo) {	
		model.addAttribute("MemberVo", memberVo);		
		return "home";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String home1(Locale locale, Model model, @RequestBody MemberVo memberVo) {
		System.out.println(memberVo.getEmail());		
		
		
		
		
		return "home";
	}
	

	
	
	
}
