package menuInfo.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MenuInfoDTO {
	private String menuCode;
	// B : 브레드
	// C : 커피
	// D : 샐러드
	// K : 케이크
	// S : 샌드위치
	// T : 차
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
	private String menuCategory;
}
