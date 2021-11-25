package qnaBoard.bean;

import java.util.Date;

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
	private Date qnaDate;
}
