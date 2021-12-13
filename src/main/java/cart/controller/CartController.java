package cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public void cartInsert(@ModelAttribute CartDTO cartDTO, HttpSession session) {
		cartDTO.setId(session.getAttribute("memId")+"");
		cartService.cartInsert(cartDTO);
	}
	
	@PostMapping(value="/cart/cartInsertList")
	@ResponseBody
	public void cartInsertList(@RequestParam String[] productCode, @RequestParam String[] cartOption, @RequestParam int[] cartQty, HttpSession session) {
		CartDTO cartDTO = new CartDTO();
		cartDTO.setId(session.getAttribute("memId")+"");
		
		for(int i=0; i<productCode.length; i++) {
			cartDTO.setProductCode(productCode[i]);
			cartDTO.setCartOption(cartOption[i]);
			cartDTO.setCartQty(cartQty[i]);
			
			cartService.cartInsert(cartDTO);
		}
	}

	//장바구니 정보 디비에서 가져오기
	@PostMapping(value="/cart/cartSelect")
	@ResponseBody
	public List<CartDTO> cartSelect(HttpSession session ) {
		return cartService.cartSelect(session.getAttribute("memId")+"");
	}
	
	
	//장바구니 구매수량
	@PostMapping(value="/cart/cartQty")
	@ResponseBody
	public void cartQty(@RequestParam Map<String,Integer> map) {  //리퀘스트 파람이 자동으로 내가 보낸 카트코드와 구매수량(cartQty)을 받아온다 . 그래서 두개 객체를 따로 기재해줄 필요가 없다.
		//System.out.println( map );
		
		cartService.cartQty(map);
		
	}
	
	//전체선택삭제
	@PostMapping(value="/cart/cartAllDelete")
	@ResponseBody
	public void cartAllDelete(HttpSession session) {
		cartService.cartAllDelete(session.getAttribute("memId")+"");
	}
	
	//선택삭제
	@PostMapping(value="/cart/cartSelectDelete")
	@ResponseBody
	public void cartSelectDelete(HttpSession session,@RequestParam String[] check) {  //우리가 체크한 항목이 2개면 2개가 오니까 배열로 받아온다(3개면 3개로)  이런식으로 시리얼라즈로 주소값으로 넘어옴.>id=yun&check=~~22&check=~~23
//		System.out.println(id);
//		System.out.println(check[0]);
//		System.out.println(check[1]);
		cartService.cartSelectDelete(session.getAttribute("memId")+"",check);
		
	}

}
