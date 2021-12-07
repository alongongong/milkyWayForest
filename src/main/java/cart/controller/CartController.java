package cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cart.bean.CartDTO;
import cart.service.CartService;


@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	
	@GetMapping("/cart")
	public String cart(Model model) {
		model.addAttribute("display", "cart/cart.jsp");
		return "/index";
	}
	
	//
	@PostMapping(value="/cart/cartInsert")
	@ResponseBody
	public void cartInsert(@ModelAttribute CartDTO cartDTO) {
		cartService.cartInsert(cartDTO);
		
	}
	
	@GetMapping(value="/cart/cart")
	public String cart(@ModelAttribute CartDTO cartDTO) {
		return "/cart/cart";
		
	}
	
	@PostMapping(value="/cart/cartSelect")
	@ResponseBody
	public List<CartDTO> cartSelect(@RequestParam String id) {
		return cartService.cartSelect(id);
	}
	
}
