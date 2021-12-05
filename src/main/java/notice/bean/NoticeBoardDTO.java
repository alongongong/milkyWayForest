package notice.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class NoticeBoardDTO {
	private String noticeCode;
	private String noticeSubject;
	private String id;
	private String noticeContent;
	private int noticeHit;
	private String noticeDate;
	private String imgName;
	private String category;
}
