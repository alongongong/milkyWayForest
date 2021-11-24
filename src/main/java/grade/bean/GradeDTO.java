package grade.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class GradeDTO {
	private String gradeName;
	private String gradeBenefit;
}
