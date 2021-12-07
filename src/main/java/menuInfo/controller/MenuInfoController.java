package menuInfo.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import menuInfo.bean.MenuInfoDTO;
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
	
	@GetMapping("/menuInfo/menuInfo")
	public String menuInfo(@RequestParam String category, @RequestParam String menuCode, @RequestParam int pg, Model model) {
		model.addAttribute("smallMenu", category);
		model.addAttribute("menuCode", menuCode);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "menuInfo/allMenuInfo.jsp");
		return "/index";
	}
	
	@GetMapping("/menuInfo/menuDetail")
	public String menuDetail(@RequestParam String category, @RequestParam String menuCode, Model model) {
		model.addAttribute("category", category);
		model.addAttribute("menuCode", menuCode);
		model.addAttribute("display", "menuInfo/menuDetail.jsp");
		return "/index";
	}
	
	//----------------------------------------------
	
	@PostMapping("/menuInfo/getDrink")
	@ResponseBody
	public List<MenuInfoDTO> getDrink() {
		return menuInfoService.getDrink();
	}
	
	@PostMapping("/menuInfo/getFood")
	@ResponseBody
	public List<MenuInfoDTO> getFood() {
		return menuInfoService.getFood();
	}
	
	@PostMapping("/menuInfo/getTea")
	@ResponseBody
	public List<MenuInfoDTO> getTea() {
		return menuInfoService.getTea();
	}
	
	@PostMapping("/menuInfo/getCoffee")
	@ResponseBody
	public List<MenuInfoDTO> getCoffee() {
		return menuInfoService.getCoffee();
	}
	
	@PostMapping("/menuInfo/getFoodAll")
	@ResponseBody
	public List<MenuInfoDTO> getFoodAll(@RequestParam String menuCode) {
		return menuInfoService.getFoodAll(menuCode);
	}
	
	@PostMapping("/menuInfo/getMenuInfo")
	@ResponseBody
	public JSONObject getMenuInfo(@RequestParam String menuCode, @RequestParam int pg) {
		return menuInfoService.getMenuInfo(menuCode, pg);
	}
	
	@PostMapping("/menuInfo/getMenuDetail")
	@ResponseBody
	public MenuInfoDTO getMenuDetail(@RequestParam String menuCode) {
		return menuInfoService.getMenuDetail(menuCode);
	}
	
}
