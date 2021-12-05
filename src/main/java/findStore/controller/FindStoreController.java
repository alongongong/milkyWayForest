package findStore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import findStore.bean.FindStoreDTO;
import findStore.service.FindStoreService;

@Controller
public class FindStoreController {
	
	@Autowired
	private FindStoreService findStoreService;
	
	@GetMapping("/findStore")
	public String findStore(Model model) {
		model.addAttribute("display", "findStore/findStoreForm.jsp");
		return "/index";
	}
	
	@PostMapping("/findStore/getStore")
	@ResponseBody
	public List<FindStoreDTO> getStore(@RequestParam double now_x, @RequestParam double now_y) {
		return findStoreService.getStore(now_x, now_y);
	}
}
