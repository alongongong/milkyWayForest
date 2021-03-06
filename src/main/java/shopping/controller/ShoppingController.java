package shopping.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shopping.bean.ReviewDTO;
import shopping.bean.ShoppingDTO;
import shopping.service.ShoppingService;


@Controller
public class ShoppingController {// 컨트롤러-> 서비스-> DAO -> 맵퍼 -> 에이작스(그럼 내가 만든폼에 스크립트에 만들기) 
	@Autowired					// 에이작스를 쓸때는 거의 리스판스바디를 쓴다(인덱스로 돌아갈 필요가 없을때는)
	private ShoppingService shoppingService;
	
	//관리자페이지에서 해당 페이지 주소로 연결
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
	
	@GetMapping("/shopping/shoppingDetail")
	public String shoppingDetail(@RequestParam String productCode,  Model model) {
		model.addAttribute("display", "/shopping/shoppingDetail.jsp");
		model.addAttribute("productCode", productCode);
		return "/index";
		
	}
	
	
	//shopping.jsp 에이작스
	@PostMapping(value="/shopping/getShoppingList")
	@ResponseBody
	public List<ShoppingDTO> getShoppingList() {
		return shoppingService.getShoppingList(); 
	}
	
	@PostMapping(value="/shopping/getShoppingList2")
	@ResponseBody
	public List<ShoppingDTO> getShoppingList2() {
		return shoppingService.getShoppingList2(); 
	}
	
	//beanNTea.jsp 에이작스
	@PostMapping(value="/shopping/getBeanNTeaList")
	@ResponseBody
	public List<ShoppingDTO> getBeanNTeaList() {
		return shoppingService.getBeanNTeaList(); 
	}
	
	@PostMapping(value="/shopping/getBeanNTeaList2")
	@ResponseBody
	public List<ShoppingDTO> getBeanNTeaList2() {
		return shoppingService.getBeanNTeaList2(); 
	}
	
	//beanList.jsp 에이작스
	@PostMapping(value="/shopping/getBeanList")
	@ResponseBody
	public List<ShoppingDTO> getBeanList() {
		return shoppingService.getBeanList(); 
	}
	
	//teaList.jsp 에이작스
	@PostMapping(value="/shopping/getTeaList")
	@ResponseBody
	public List<ShoppingDTO> getTeaList() {
		return shoppingService.getTeaList(); 
	}
	
	//product.jsp 에이작스
	@PostMapping(value="/shopping/getProductList")
	@ResponseBody
	public List<ShoppingDTO> getProductList() {
		return shoppingService.getProductList(); 
	}
	
	@PostMapping(value="/shopping/getProductList2")
	@ResponseBody
	public List<ShoppingDTO> getProductList2() {
		return shoppingService.getProductList2(); 
	}
	
	@PostMapping(value="/shopping/getProductList3")
	@ResponseBody
	public List<ShoppingDTO> getProductList3() {
		return shoppingService.getProductList3(); 
	}
	
	@PostMapping(value="/shopping/getProductList4")
	@ResponseBody
	public List<ShoppingDTO> getProductList4() {
		return shoppingService.getProductList4(); 
	}
	
	@PostMapping(value="/shopping/getProductList5")
	@ResponseBody
	public List<ShoppingDTO> getProductList5() {
		return shoppingService.getProductList5(); 
	}
	
	@PostMapping(value="/shopping/getProductList6")
	@ResponseBody
	public List<ShoppingDTO> getProductList6() {
		return shoppingService.getProductList6(); 
	}
	
	//mugList.jsp 에이작스
	@PostMapping(value="/shopping/getMugList")
	@ResponseBody
	public List<ShoppingDTO> getMugList() {
		return shoppingService.getMugList(); 
	}
	
	//glassList.jsp 에이작스
	@PostMapping(value="/shopping/getGlassList")
	@ResponseBody
	public List<ShoppingDTO> getGlassList() {
		return shoppingService.getGlassList(); 
	}
	
	
	//plasticTumblrList.jsp 에이작스
	@PostMapping(value="/shopping/getPlasticTumblrList")
	@ResponseBody
	public List<ShoppingDTO> getPlasticTumblrList() {
		return shoppingService.getPlasticTumblrList(); 
	}
	
	//stainlessTumblrList.jsp 에이작스
	@PostMapping(value="/shopping/getStainlessTumblrList")
	@ResponseBody
	public List<ShoppingDTO> getStainlessTumblrList() {
		return shoppingService.getStainlessTumblrList(); 
	}
	
	//thermosList.jsp 에이작스
	@PostMapping(value="/shopping/getThermosList")
	@ResponseBody
	public List<ShoppingDTO> getThermosList() {
		return shoppingService.getThermosList(); 
	}
	
	//coffeeEtcList.jsp 에이작스
	@PostMapping(value="/shopping/getCoffeeEtcList")
	@ResponseBody
	public List<ShoppingDTO> getCoffeeEtcList() {
		return shoppingService.getCoffeeEtcList(); 
	}
	

	//shoppingDetail.jsp  에이작스
	@PostMapping(value="/shopping/getShoppingDetail")
	@ResponseBody
	public List<ShoppingDTO> getShoppingDetail(@RequestParam String productCode) {  
		//머그 같은 사진들은 productCode당 사진이 여러장이라서(앞,뒤,옆)그 같은 프로덕트에 해당하는 사진들을 모두 가져오기위해 List로 묶은것.
		//(티같이 하나만 사진이 있었다면 List로 묶지 않아도 되었음)
		//System.out.println(shoppingDTO.getProductCode());
		return shoppingService.getShoppingDetail(productCode);
	}
	
	//clickImg (이미지 클릭했을때 프로덕트코드 셀렉트해서 가져가기)
	@PostMapping(value="/shopping/clickImg")
	@ResponseBody
	public ShoppingDTO clickImg(@RequestParam String productCode) {
		return shoppingService.clickImg(productCode);
	}
	
	
	//장바구니 상품코드 확인
	@PostMapping(value="/shopping/productSelect")
	@ResponseBody
	public int productSelect(HttpSession session, @RequestParam String productCode) {
		return shoppingService.productSelect(session.getAttribute("memId")+"", productCode);
	}
	
	@PostMapping("/shopping/getReview")
	@ResponseBody
	public JSONObject getReview(@RequestParam String productCode, @RequestParam int pg) {
		return shoppingService.getReview(productCode, pg);
	}
	
	@PostMapping("/shopping/reviewInsert")
	@ResponseBody
	public void reviewInsert(@ModelAttribute ReviewDTO reviewDTO, HttpSession session) {
		System.out.println(reviewDTO.getProductCode());
		System.out.println(reviewDTO.getReviewContent());
		System.out.println(reviewDTO.getReviewLike());
		
		
		reviewDTO.setId(session.getAttribute("memId")+"");
		shoppingService.reviewInsert(reviewDTO);
	}
	
	@PostMapping("/shopping/insertWishList")
	@ResponseBody
	public void insertWishList(@RequestParam String productCode, HttpSession session) {
		String id = session.getAttribute("memId") + "";
		shoppingService.insertWishList(productCode, id);
	}
	
	@PostMapping("/shopping/getWishProduct")
	@ResponseBody
	public String getWishProduct(@RequestParam String productCode, HttpSession session) {
		return shoppingService.getWishProduct(productCode, session.getAttribute("memId")+"");
	}
}

