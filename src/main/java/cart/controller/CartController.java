package cart.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {
	
	@GetMapping("/cart")
	public String cart(Model model) {
		model.addAttribute("display", "cart/cart.jsp");
		return "/index";
	}
}
