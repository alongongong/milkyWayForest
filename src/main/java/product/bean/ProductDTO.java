package product.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ProductDTO {
	private String productCode;
	private String productName;
	private String category;
	private String productOption;
	private int productUnit;
	private int productRate;
	private int enterCount;
	private int sellCount;
	private int wishCount;
	private String productEngName;
	private String productSmallInfo;
	private String productDetailInfo;
}
