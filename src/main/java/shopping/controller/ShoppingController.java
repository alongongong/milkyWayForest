package shopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shopping.bean.ShoppingDTO;
import shopping.service.ShoppingService;


@Controller
public class ShoppingController {// 컨트롤러-> 서비스-> DAO -> 맵퍼 -> 에이작스(그럼 내가 만든폼에 스크립트에 만들기) 
	@Autowired					// 에이작스를 쓸때는 거의 리스판스바디를 쓴다(인덱스로 돌아갈 필요가 없을때는)
	private ShoppingService shoppingService;
	
	@GetMapping("/shopping")
	public String shopping(Model model) {
	model.addAttribute("display", "/shopping/shopping.jsp");
	return "/index";
	}
	
	@RequestMapping(value="/shopping/beanNTea" , method=RequestMethod.GET)
	public String beanNTea(Model model) {
	model.addAttribute("display", "/shopping/beanNTea.jsp");
	return "/index";
	}
	
	@GetMapping("/shopping/beanList")  
	public String beanList(Model model) {  // 모델은 실어서 넘겨준다. 리퀘스트 같은것.
	model.addAttribute("display", "/shopping/beanList.jsp");  // 모델 어트리뷰트는 
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
	model.addAttribute("display", "/shopping/coffeeEtcList.jsp");  //모델이라는 객체안에 디스플레이를 넣는것. 그 디스플레이 안에는 파일주소값이 넣어져있고.
	return "/index";
	}
	
	@PostMapping(value="/shopping/getShoppingList")
	@ResponseBody
	public List<ShoppingDTO> getShoppingList() {
		return shoppingService.getShoppingList(); 
	}

	
}
