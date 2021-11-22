package shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class shoppingController {
	
	@RequestMapping(value="/shopping/beanNTea" , method=RequestMethod.GET)
	public String beanNTea(Model model) {
		model.addAttribute("display", "/shopping/beanNTea.jsp");
		return "/index";
	}
	
	@GetMapping("/shopping/beanList")
	public String beanList(Model model) {
		model.addAttribute("display", "/shopping/beanList.jsp");
		return "/index";
	}
	
	
	@GetMapping("/shopping/teaList")
	public String teaList(Model model) {
		model.addAttribute("display", "/shopping/teaList.jsp");
		return "/index";
	}
	
	@GetMapping("/shopping/product")
	public String product(Model model) {
		model.addAttribute("display", "/shopping/product.jsp");
		return "/index";
	}
	
	@GetMapping("/shopping/mugList")
	public String mugList(Model model) {
		model.addAttribute("display", "/shopping/mugList.jsp");
		return "/index";
	}
	
	@GetMapping("/shopping/glassList")
	public String glassList(Model model) {
		model.addAttribute("display", "/shopping/glassList.jsp");
		return "/index";
	}
	
	@GetMapping("/shopping/plasticTumblrList")
	public String plasticTumblrList(Model model) {
		model.addAttribute("display", "/shopping/plasticTumblrList.jsp");
		return "/index";
	}
	
	@GetMapping("/shopping/stainlessTumblrList")
	public String stainlessTumblrList(Model model) {
		model.addAttribute("display", "/shopping/stainlessTumblrList.jsp");
		return "/index";
	}
	
	@GetMapping("/shopping/thermosList")
	public String thermosList(Model model) {
		model.addAttribute("display", "/shopping/thermosList.jsp");
		return "/index";
	}
	
	@GetMapping("/shopping/coffeeEtcList")
	public String coffeeEtcList(Model model) {
		model.addAttribute("display", "/shopping/coffeeEtcList.jsp");
		return "/index";
	}
}
