package payment.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PaymentDTO {
	private String paymentCode;
	private String productCode;
	private String productOption;
	private int payQty;
	private int payPrice;
	private int payRate;
	private String payShipNickName;
	private String payShipReceiver;
	private String payTel1;
	private String payTel2;
	private String payTel3;
	private String payShipZipcode;
	private String payShipAddr1;
	private String payShipAdde2;
}
