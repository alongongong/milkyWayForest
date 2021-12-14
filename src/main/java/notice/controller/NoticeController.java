package notice.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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

import comment.bean.CommentDTO;
import notice.bean.EventBoardDTO;
import notice.bean.NoticeBoardDTO;
import notice.service.NoticeService;
import qnaBoard.bean.QnaBoardDTO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/notice/qnaBoard")
	public String qnaBoard(@RequestParam int pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "notice/qnaBoard.jsp");
		return "/index";
	}
	
	@GetMapping("/notice/noticeBoard")
	public String noticeBoard(@RequestParam int pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "notice/noticeBoard.jsp");
		return "/index";
	}
	
	@GetMapping("/notice/eventBoard")
	public String eventBoard(Model model) {
		model.addAttribute("display", "notice/eventBoard.jsp");
		return "/index";
	}
	
	@GetMapping("/notice/faqBoard")
	public String faqBoard(@RequestParam int pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "notice/faqBoard.jsp");
		return "/index";
	}
	
	@GetMapping("/notice/eventView")
	public String eventView(@RequestParam String eventCode, Model model) {
		model.addAttribute("eventCode", eventCode);
		model.addAttribute("display", "notice/eventView.jsp");
		return "/index";
	}
	
	@GetMapping("/notice/qnaBoardWriteForm")
	public String qnaBoardWriteForm(Model model) {
		model.addAttribute("display", "notice/qnaBoardWriteForm.jsp");
		return "/index";
	}
	
	@GetMapping("/notice/noticeView")
	public String noticeView(@RequestParam String noticeCode, @RequestParam int pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("noticeCode", noticeCode);
		model.addAttribute("display", "notice/noticeBoardView.jsp");
		return "/index";
		
	}
	
	// ------------------------------------------------
	
	@PostMapping("/notice/qnaBoardWrite")
	@ResponseBody
	public void qnaBoardWrite(@ModelAttribute QnaBoardDTO qnaBoardDTO,
								@RequestParam MultipartFile[] img,
								Model model, HttpSession session) {
		String filePath = "D:\\Spring\\workspace\\milkyWayForest\\src\\main\\webapp\\storage";
		// String filePath = "C:\\study\\Spring\\workspace\\milkyWayForest\\src\\main\\storage";
		String fileName;
		File file;
		qnaBoardDTO.setId(session.getAttribute("memId")+"");
		
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

		noticeService.qnaBoardWrite(qnaBoardDTO);

	}
	
	@PostMapping("/notice/getQnaBoard")
	@ResponseBody
	public JSONObject getQnaBoard(@RequestParam int pg) {
		return noticeService.getQnaBoard(pg);
	}
	
	@PostMapping("/notice/getNoticeBoard")
	@ResponseBody
	public JSONObject getNoticeBoard(@RequestParam int pg, Model model) {
		model.addAttribute("pg", pg);
		return noticeService.getNoticeBoard(pg);
	}
	
	@PostMapping("/notice/getNoticeView")
	@ResponseBody
	public NoticeBoardDTO getNoticeView(@RequestParam String noticeCode) {
		return noticeService.getNoticeView(noticeCode);
	}
	
	@PostMapping("/notice/getEventBoard")
	@ResponseBody
	public List<EventBoardDTO> getEventBoard() {
		return noticeService.getEventBoard();
	}
	
	@PostMapping("/notice/getEventView")
	@ResponseBody
	public List<EventBoardDTO> getEventView(@RequestParam String eventCode) {
		return noticeService.getEventView(eventCode);
	}
	
	@PostMapping("/notice/getFaqBoard")
	@ResponseBody
	public JSONObject getFaqBoard(@RequestParam int pg) {
		return noticeService.getFaqBoard(pg);
	}
	
	@PostMapping("/notice/noticeSearch")
	@ResponseBody
	public List<NoticeBoardDTO> noticeSearch(@RequestParam String search) {
		return noticeService.noticeSearch(search);
	}
	
	@PostMapping("/notice/getQnaComment")
	@ResponseBody
	public List<CommentDTO> getQnaComment(@RequestParam int qnaCode) {
		return noticeService.getQnaComment(qnaCode);
	}
}