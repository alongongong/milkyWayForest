package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/write")
public class MemberWriteController {

	@GetMapping(value="/memberAgree")
	public String writeAgreeForm(Model model) {
		model.addAttribute("display", "write/writeAgreeForm.jsp");
		return "/index";
	}
	@GetMapping(value="memberWrite")
	public String memberWrite(Model model) {
		model.addAttribute("display", "write/memberWrite.jsp");
		return "/index";
	}

}
