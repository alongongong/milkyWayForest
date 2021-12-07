package cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//메인화면
	@GetMapping("/cart")
	public String cart(Model model) {
		model.addAttribute("display", "cart/cart.jsp");
		return "/index";
	}
	
	//장바구니 정보 자동입력
	@PostMapping(value="/cart/cartInsert")
	@ResponseBody
	public void cartInsert(@ModelAttribute CartDTO cartDTO) {
		cartService.cartInsert(cartDTO);
		
	}

	//장바구니 정보 디비에서 가져오기
	@PostMapping(value="/cart/cartSelect")
	@ResponseBody
	public List<CartDTO> cartSelect(@RequestParam String id) {
		return cartService.cartSelect(id);
	}
	
	//장바구니 구매수량
//	@PostMapping(value="/cart/cartQty")
//	@ResponseBody
//	public void cartQty(@RequestParam Map<String,Integer> map, ModelMap modelMap) {
//		modelMap.put("cartCode", map.get("cartCode"));
//		modelMap.put("cartQty", map.get("cartQty"));
//		
//		cartService.cartQty(modelMap);
//	}
	
	//장바구니 구매수량
	@PostMapping(value="/cart/cartQty")
	@ResponseBody
	public void cartQty(@RequestParam Map<String,Integer> map) {  //리퀘스트 파람이 자동으로 내가 보낸 카트코드와 구매수량(cartQty)을 받아온다 . 그래서 두개 객체를 따로 기재해줄 필요가 없다.
		System.out.println( map );
		
		cartService.cartQty(map);
		
	}
	
	 
	
}
