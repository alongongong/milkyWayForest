package cart.bean;

import lombok.Data;

@Data
public class CartDTO {
	private String cartCode;
	private String id;
	private String productCode;
	private String cartOption;
	private int cartQty;
	private String productName;
	private int productUnit;
	private int productRate;
	private String productImageName;
	
}
