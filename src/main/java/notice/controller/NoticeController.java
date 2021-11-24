package notice.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
		model.addAttribute("display", "notice/qnaBoardWriteForm.jsp");
		return "/index";
	}
	
	// ------------------------------------------------
	
	@PostMapping("/notice/qnaBoardWrite")
	public String qnaBoardWrite(@ModelAttribute QnaBoardDTO qnaBoardDTO,
								@RequestParam MultipartFile[] img,
								Model model) {
		System.out.println("check1");
		String filePath = "C:\\study\\Spring\\workspace\\milkyWayForest\\src\\main\\storage";
		String fileName;
		File file;
		
		if(img[0] != null) {
			fileName = img[0].getOriginalFilename();
			file = new File(filePath, fileName);
			
			try {
				FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			qnaBoardDTO.setQnaImage1(fileName);
		} else {
			qnaBoardDTO.setQnaImage1("");
		}
		System.out.println("check2");
		if(img[1] != null) {
			fileName = img[1].getOriginalFilename();
			file = new File(filePath, fileName);
			
			try {
				FileCopyUtils.copy(img[1].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			qnaBoardDTO.setQnaImage2(fileName);
		} else {
			qnaBoardDTO.setQnaImage2("");
		}
		System.out.println("check3");
		noticeService.qnaBoardWrite(qnaBoardDTO);
		
		model.addAttribute("display", "notice/qnaBoard.jsp");
		return "/index";
	}
	
}
