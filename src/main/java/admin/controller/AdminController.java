package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/admin/pAllMenu", method=RequestMethod.GET)
	public String pAllMenu(Model model) { 
		model.addAttribute("display", "admin/pAllMenu.jsp");
		return "/adminIndexTemplate";
	}
	
}
