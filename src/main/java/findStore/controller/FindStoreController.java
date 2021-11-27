package findStore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FindStoreController {
	
	@GetMapping("/findStore")
	public String findStore(Model model) {
		model.addAttribute("display", "findStore/findStoreForm.jsp");
		return "/index";
	}
}
