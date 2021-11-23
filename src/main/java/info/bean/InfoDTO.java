package info.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class InfoDTO {
	private String gradeName;
	private String gradeBenefit;
}
