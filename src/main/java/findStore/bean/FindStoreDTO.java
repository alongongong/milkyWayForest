package findStore.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class FindStoreDTO {
	private String storeCode;
	private String storeName;
	private String storeLocation;
	private String storeX;
	private String storeY;
}
