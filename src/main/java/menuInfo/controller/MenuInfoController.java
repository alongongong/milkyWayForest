package menuInfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import menuInfo.service.MenuInfoService;

@Controller
public class MenuInfoController {
	@Autowired
	private MenuInfoService menuInfoService;
	
	@GetMapping("/menuInfo")
	public String menuInfo(Model model) {
		model.addAttribute("display", "menuInfo/menuInfo.jsp");
		return "/index";
	}
	
	@GetMapping("/menuInfo/drinkInfo")
	public String drinkInfo(Model model) {
		model.addAttribute("display", "menuInfo/drinkInfo.jsp");
		return "/index";
	}
	
	@GetMapping("/menuInfo/foodInfo")
	public String foodInfo(Model model) {
		model.addAttribute("display", "menuInfo/foodInfo.jsp");
		return "/index";
	}
	
	@GetMapping("/menuInfo/teaInfo")
	public String teaInfo(Model model) {
		model.addAttribute("display", "menuInfo/teaInfo.jsp");
		return "/index";
	}
}
