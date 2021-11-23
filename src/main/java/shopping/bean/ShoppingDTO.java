package shopping.bean;

import lombok.Data;

@Data
public class ShoppingDTO {
	private String productCode;
	private String productName;
	private String category;
	private String productOption;
	private int productUnit;
	private int productRate;
	private int enterCount;
	private int sellCount;
	private int wishCount;
	
}
