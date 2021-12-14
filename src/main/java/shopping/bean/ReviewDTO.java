package shopping.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReviewDTO {
	private int reviewCode;
	private String productCode;
	private int reviewLike;
	private String id;
	private String reviewContent;
	private String reviewAnswer;
	private String reviewDate;
}
