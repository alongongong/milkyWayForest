package notice.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import notice.service.NoticeService;
import qnaBoard.bean.QnaBoardDTO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/notice/qnaBoard")
	public String qnaBoard(Model model) {
		model.addAttribute("display", "notice/qnaBoard.jsp");
		return "/index";
	}
	
	@GetMapping("/notice/noticeBoard")
	public String noticeBoard(Model model) {
		model.addAttribute("display", "notice/noticeBoard.jsp");
		return "/index";
	}
	
	@GetMapping("/notice/eventBoard")
	public String eventBoard(Model model) {
		model.addAttribute("display", "notice/eventBoard.jsp");
		return "/index";
	}
	
	@GetMapping("/notice/faqBoard")
	public String faqBoard(Model model) {
		model.addAttribute("display", "notice/faqBoard.jsp");
		return "/index";
	}
	
	@GetMapping("/notice/eventView")
	public String eventView(Model model) {
		model.addAttribute("display", "notice/eventView.jsp");
		return "/index";
	}
	
	@GetMapping("/notice/qnaBoardWriteForm")
	public String qnaBoardWriteForm(Model model) {
		model.addAttribute("display", "/notice/qnaBoardWriteForm.jsp");
		return "/index";
	}
	
	// ------------------------------------------------
	
	@PostMapping("/notice/qnaBoardWrite")
	@ResponseBody
	public void qnaBoardWrite(@ModelAttribute QnaBoardDTO qnaBoardDTO,
								@RequestParam MultipartFile[] img) {
		String filePath;
		String fileName;
		File file;
		
		noticeService.qnaBoardWrite(qnaBoardDTO);
	}
}
