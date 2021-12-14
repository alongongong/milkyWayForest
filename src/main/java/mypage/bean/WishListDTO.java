package mypage.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class WishListDTO {
	private String wishListCode;
	private String id;
	private String productCode;
	private String wishDate;
	private String productName;
	private String productOption;
	private String productImageName;
}
