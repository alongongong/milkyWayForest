package comment.bean;

import lombok.Data;

@Data
public class CommentDTO {
	private int commentCode;
	private int qnaCode;
	private String id;
	private String commentContent;
	private int commentRef;
	private int commentLev;
	private int commentStep;
	private int commentReply;
	private String commentDate;
}
