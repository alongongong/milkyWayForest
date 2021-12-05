package menuInfo.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MenuInfoDTO {
	private String menuCode;
	private String menuName;
	private String menuEngName;
	private String menuImg;
	private int menuKcal;
	private int menuFat;
	private int menuProtein;
	private int menuSodium;
	private int menuSugar;
	private int menuCaffeine;
	private String menuFactor;
	private String menuDetail;
}
