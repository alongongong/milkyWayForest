package cart.bean;

import lombok.Data;

@Data
public class CartDTO {
	private int cateCode;
	private String id;
	private String productCode;
	private String cartOption;
	private int cartQty;
	private String productName;
	private String productUnit;
	
}
