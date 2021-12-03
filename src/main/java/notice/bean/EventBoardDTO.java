package notice.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class EventBoardDTO {
	private String eventCode;
	private String eventSubject;
	private String id;
	private String eventStatus;
	private int eventHit;
	private String eventDate;
	private String imgName;
	private String category;
}
