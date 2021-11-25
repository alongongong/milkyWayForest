package info.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import grade.bean.GradeDTO;
import info.service.InfoService;

@Controller
public class InfoController {
	
	//ResponseBody => index가 돌아갈 필요가 없을때, 쓴다
	@Autowired
	private InfoService infoService;
	
	@GetMapping("/info/componyInfo")
	public String companyInfo(Model model) {
		model.addAttribute("display", "Info/companyInfo.jsp");
		//model.getAttribute(display);
		return "/index";
	}
	
	@PostMapping("/info/getBenefit")
	@ResponseBody
	public List<GradeDTO> getBenefit() {
		return infoService.getBenefit();
	}
	
	@GetMapping("/info/gradeBenefitInfo")
	public String gradeBenefitInfo(Model model) {
		model.addAttribute("display", "Info/gradeBenefit.jsp");
		return "/index";
	}
}
