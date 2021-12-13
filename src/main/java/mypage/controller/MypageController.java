package mypage.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import comment.bean.CommentDTO;
import member.bean.MemberDTO;
import mypage.bean.MemberRatingDTO;
import mypage.bean.MypageShipmentDTO;
import mypage.service.MypageService;
import net.sf.json.JSONObject;
import payment.bean.PaymentDTO;
import qnaBoard.bean.QnaBoardDTO;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	@Autowired
	private MypageService mypageService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
    BCryptPasswordEncoder passwordEncoder;

	
	//마이페이지 메인 창
	@GetMapping(value="/mypageMain")
	public String mypageMain(Model model) {
		model.addAttribute("display", "mypage/mypageMain.jsp");
		return "/index";
	}
	
	//비밀번호 확인 창
	@GetMapping(value="/mypagePwdForm")
	public String mypagePwdForm(Model model) {
		model.addAttribute("display", "mypage/mypagePwdForm.jsp");
		return "/index";
	}
	
	//비밀번호 확인 창
	@GetMapping(value="/mypagePwdForm2")
	public String mypagePwdForm2(Model model) {
		model.addAttribute("display", "mypage/mypagePwdForm2.jsp");
		return "/index";
	}
	
	//비밀번호 확인 
	@PostMapping(value="/mypagePwdCheck")
	@ResponseBody
	public String mypagePwdCheck(@ModelAttribute MemberDTO memberDTO) {
		MemberDTO memberDTO2 = mypageService.mypagePwdCheck(memberDTO);
		
		String inputPwd = memberDTO.getPwd();
		String dbPwd = memberDTO2.getPwd();
		
		if(! passwordEncoder.matches(inputPwd, dbPwd)) {
			return "";
			
		}else {
			return memberDTO2.getId();
		}
	}
	
	//회원정보 변경/탈퇴 창
	@GetMapping(value="/mypageMyInfo")
	public String mypageMyInfo(Model model) {
		model.addAttribute("display", "mypage/mypageMyInfo.jsp");
		return "/index";
	}
	
	//회원정보 불러오기
	@PostMapping(value="/getMypageMyInfo")
	@ResponseBody
	public MemberDTO getMypageMyInfo(String id) {
		return mypageService.getMypageMyInfo(id);
	}
	
	//이메일 발송
	@GetMapping(value = "/mypageEmailSend")
	@ResponseBody
    public String mypageEmailSend(String email) throws Exception{
		System.out.println("MypageController 인증 이메일 : "+email);
		
		int checkNum = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		System.out.println("MypageController 인증번호 : " + checkNum);
		
		//이메일 보내기
        String setFrom = "milkywayforest11@gmail.com";
        String toMail = email;
        String title = "이메일 인증번호가 발급되었습니다.";
        String content = 
                "안녕하세요. 은하숲입니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {    
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = checkNum + "";
        
        return num;
    }
	
	//회원정보 수정
	@PostMapping(value="/mypageMyInfoUpdate")
	@ResponseBody
	public void mypageMyInfoUpdate(@ModelAttribute MemberDTO memberDTO) {
		//비밀번호 암호화
		memberDTO.setPwd(passwordEncoder.encode(memberDTO.getPwd()));
		
		//선택정보 값
		if(memberDTO.getIdPwdQuestion() != "false" && memberDTO.getIdPwdAnswer() != "") {
			
		}else {	
			memberDTO.setIdPwdQuestion("false");
			memberDTO.setIdPwdAnswer("false");
		}

		System.out.println(memberDTO.getIdPwdQuestion());
		System.out.println(memberDTO.getIdPwdAnswer());

		mypageService.mypageMyInfoUpdate(memberDTO);
	}
	
	//회원정보 삭제 
	@PostMapping(value="/mypageMyInfoDelete")
	@ResponseBody
	public void mypageMyInfoDelete(@ModelAttribute MemberDTO memberDTO) {
		//비밀번호 암호화
		memberDTO.setPwd(passwordEncoder.encode(memberDTO.getPwd()));
		
		mypageService.mypageMyInfoDelete(memberDTO);
	}

	//게시글 관리 창
	@GetMapping("/mypageMyPost")
	public String mypageMyPost(@RequestParam int pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "mypage/mypageMyPost.jsp");
		return "/index";
	}
	
	//문의글 목록 불러오기
	@PostMapping("/getMyQnaList")
	@ResponseBody
	public JSONObject getMyQnaList(@RequestParam int pg, HttpSession session) {
		String id = (String) session.getAttribute("memId");
		
		return mypageService.getMyQnaList(id, pg);
	}
	
	//문의글 보기 창
	@GetMapping("/MyQnaView")
	public String MyQnaView(@RequestParam String qnaCode, @RequestParam int pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("qnaCode", qnaCode);
		model.addAttribute("display", "mypage/mypageMyQnaView.jsp");
		return "/index";
	}
	
	//문의글 내용 불러오기
	@PostMapping("/getMyQnaView")
	@ResponseBody
	public QnaBoardDTO getMyQnaView(@RequestParam String qnaCode) {
		return mypageService.getMyQnaView(qnaCode);
	}
	
	//문의글 수정 창
	@GetMapping("/updateMyQnaViewForm")
	public String updateMyQnaViewForm(@RequestParam String qnaCode, @RequestParam int pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("qnaCode", qnaCode);
		model.addAttribute("display", "mypage/updateMyQnaViewForm.jsp");
		return "/index";
	}
	
	//문의글 수정
	@GetMapping("/updateMyQnaView")
	@ResponseBody
	public void qnaBoardWrite(@RequestParam int qnaCode, @ModelAttribute QnaBoardDTO qnaBoardDTO) {
		qnaBoardDTO.setQnaCode(qnaCode);
		mypageService.updateMyQnaView(qnaBoardDTO);
	}

	//문의글 댓글 불러오기
	@PostMapping("/getMyQnaComment")
	@ResponseBody
	public List<CommentDTO> getMyQnaComment(@RequestParam int qnaCode) {
		return mypageService.getMyQnaComment(qnaCode);
	}

	//문의글 삭제
	@GetMapping("/deleteMyQnaView")
	@ResponseBody
	public void deleteMyQnaView(@RequestParam int qnaCode) {
		mypageService.deleteMyQnaView(qnaCode);
	}
	
	//배송지 관리
	@GetMapping(value="/mypageShpMng")
	public String mypageShpMng(Model model) {
		model.addAttribute("display", "mypage/mypageShpMng.jsp");
		return "/index";
	}
	
	@PostMapping(value="/mypageShpMngWrite")
	@ResponseBody
	public void mypageShpMngWrite(@ModelAttribute MypageShipmentDTO mypageShipmentDTO,HttpSession session) {
		String id = (String) session.getAttribute("memId");
		
		mypageShipmentDTO.setId(id);
		if(mypageShipmentDTO.getBaseShip() != 1) {
			mypageShipmentDTO.setBaseShip(0);
			mypageService.mypageShpMngWrite(mypageShipmentDTO);
		}else if(mypageShipmentDTO.getBaseShip() == 1) {
			mypageService.mypageShpMngWrite1(mypageShipmentDTO);
		}	
	}

	//배송상품 주문정보 불러오기
	@PostMapping("/getMainPaymentInfo")
	@ResponseBody
	public JSONObject getMainPaymentInfo(HttpSession session) {
		String id = (String) session.getAttribute("memId");
		return mypageService.getMainPaymentInfo(id);
	}
		
	//배송상품 주문정보 불러오기
	@PostMapping("/getPaymentInfo")
	@ResponseBody
	public JSONObject getPaymentInfo(HttpSession session) {
		String id = (String) session.getAttribute("memId");
		return mypageService.getPaymentInfo(id);
	}
	
	//전체 주문내역 창
	@GetMapping("/mypageOrderList")
	public String mypageOrderList(@RequestParam int pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "mypage/mypageOrderList.jsp");
		return "/index";
	}
	
	//전체 주문내역 불러오기
	@PostMapping("/getOrderList")
	@ResponseBody
	public JSONObject getOrderList(@RequestParam int pg, HttpSession session) {
		String id = (String) session.getAttribute("memId");
		return mypageService.getOrderList(id, pg);
	}
	
	//주문내역 상세 페이지
	@GetMapping("/MyOrderView")
	public String MyOrderView(@RequestParam String paymentCode, HttpSession session, Model model) {
		String id = (String) session.getAttribute("memId");
		model.addAttribute("id", id);
		model.addAttribute("paymentCode", paymentCode);
		model.addAttribute("display", "mypage/mypageMyOrderView.jsp");
		return "/index";
	}
	
	//주문내역 상세내용 불러오기
	@PostMapping("/getMyOrderInfo")
	@ResponseBody
	public JSONObject getMyOrderInfo(@RequestParam String paymentCode) {
		return mypageService.getMyOrderInfo(paymentCode);
	}
	
	//주문 취소 신청 창
	@GetMapping("/myOrderCancel")
	public String myOrderCancel(@RequestParam String paymentCode, @RequestParam String request, Model model) {
		model.addAttribute("paymentCode", paymentCode);
		model.addAttribute("request", request);
		model.addAttribute("display", "mypage/mypageOrderCancel.jsp");
		return "/index";
	}
	
	//주문 취소 DB 업데이트
	@PostMapping("/updateMyOrderCancel")
	@ResponseBody
	public void updateMyOrderCancel(@ModelAttribute PaymentDTO paymentDTO) {
		mypageService.updateMyOrderCancel(paymentDTO);
	}
	
	//주문 교환 DB 업데이트
	@PostMapping("/updateMyOrderExchange")
	@ResponseBody
	public void updateMyOrderExchange(@ModelAttribute PaymentDTO paymentDTO) {
		mypageService.updateMyOrderExchange(paymentDTO);
	}
	
	//주문 반품 DB 업데이트
	@PostMapping("/updateMyOrderReturn")
	@ResponseBody
	public void updateMyOrderReturn(@ModelAttribute PaymentDTO paymentDTO) {
		mypageService.updateMyOrderReturn(paymentDTO);
	}
	
	//주문취소내역 불러오기
	@PostMapping("/getMyOrderCancelInfo")
	@ResponseBody
	public PaymentDTO getMyOrderCancelInfo(@RequestParam String paymentCode) {
		return mypageService.getMyOrderCancelInfo(paymentCode);
	}

	//주문취소/교환/반품 내역 창
	@GetMapping("/mypageCancelList")
	public String mypageCancelList(@RequestParam int pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "mypage/mypageCancelList.jsp");
		return "/index";
	}
	
	//전체 취소/교환/반품내역 불러오기
	@PostMapping("/getCancelList")
	@ResponseBody
	public JSONObject getCancelList(@RequestParam int pg, HttpSession session) {
		String id = (String) session.getAttribute("memId");
		return mypageService.getCancelList(id, pg);
	}
	
	//주문/배송조회 창
	@GetMapping("/mypageShipmentList")
	public String mypageShipmentList(@RequestParam int pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "mypage/mypageShipmentList.jsp");
		return "/index";
	}
	
	//전체 주문배송내역 불러오기
	@PostMapping("/getShipmentList")
	@ResponseBody
	public JSONObject getShipmentList(@RequestParam int pg, HttpSession session) {
		String id = (String) session.getAttribute("memId");
		return mypageService.getShipmentList(id, pg);
	}
	
	@PostMapping(value="/getShpMngList")
	@ResponseBody
	public List<MypageShipmentDTO> getShpMngList(HttpSession session){
		String id = (String) session.getAttribute("memId");
		return mypageService.getShpMngList(id);
		
	}
	
	@PostMapping(value="/getShpMngModify")
	@ResponseBody
	public MypageShipmentDTO getShpMngModify(@RequestParam String shipCode) {
		return mypageService.getShpMngModify(shipCode);
	}
	
	@GetMapping(value="/mypageShpMngModifyForm")
	public String mypageShpMngModifyForm(@RequestParam String shipCode, Model model) {
		model.addAttribute("shipCode", shipCode);
		return "/mypage/mypageShpMngModifyForm";
	}
	
	@GetMapping(value="/mypageShpMngWriteForm")
	public String mypageShpMngWriteForm() {
		return "/mypage/mypageShpMngWriteForm";
	}
	
	@GetMapping(value="/updateShpMng")
	@ResponseBody
	public void updateShpMng(@RequestParam int shipCode, @ModelAttribute MypageShipmentDTO mypageShipmentDTO) {
		mypageShipmentDTO.setShipCode(shipCode);
		mypageService.updateShpMng(mypageShipmentDTO);
	}
	@GetMapping(value="/deleteShpMng")
	@ResponseBody
	public void deleteShpMng(@RequestParam String shipCode) {
		mypageService.deleteShpMng(shipCode);
	}
	@GetMapping(value="/mypageRating")
	public String mypageRating(Model model) {
		model.addAttribute("display", "mypage/mypageRating.jsp");
		return "/index";
	}
	
	@PostMapping(value="/getMypageRating")
	@ResponseBody
	public MemberRatingDTO getMypageRating(String id) {
		return mypageService.getMypageRating(id);
	}

}
