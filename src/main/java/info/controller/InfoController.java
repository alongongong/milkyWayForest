package info.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import info.service.InfoService;

@Controller
public class InfoController {
	//ResponseBody => index가 돌아갈 필요가 없을때, 쓴다
	@Autowired
	private InfoService infoService;
	
	@GetMapping("/info/componyInfo")
	public String componyInfo(Model model) {
		model.addAttribute("display", "Info/companyInfo.jsp");
		return "/index";
	}
}
