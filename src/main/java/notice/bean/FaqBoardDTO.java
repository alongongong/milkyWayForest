package notice.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class FaqBoardDTO {
	private String faqCode;
	private String faqSubject;
	private String id;
	private String faqContent;
	private int faqHit;
	private String faqDate;
}
