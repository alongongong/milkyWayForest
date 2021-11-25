package qnaBoard.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class QnaBoardDTO {
	private int qnaCode;
	private String qnaQuestionType;
	private String qnaSubject;
	private String id;
	private String qnaContent;
	private String qnaPwd;
	private int qnaHit;
	private String qnaImage1;
	private String qnaImage2;
	private String qnaAnswerCheck; // 답변 대기, 답변 완료
	private String qnaDate;
}
