package payment.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PaymentDTO {
	private String paymentCode;
	private String id;
	private String productCode;
	private String productName;
	private String productOption;
	private int paymentSavedMoney;
	private int newSavedMoney;
	private String paymentCoupon;
	private int payQty;
	private int payPrice;
	private int payRate;
	private int shipPay;
	private String paymentMethod;
	private String deliveryInfo;
	private String payShipNickname;
	private String payShipReceiver;
	private String payShipTel1;
	private String payShipTel2;
	private String payShipTel3;
	private String payShipZipcode;
	private String payShipAddr1;
	private String payShipAddr2;
	private String shipMemo;
	private String payDate;
	private String productImageName;
	private String reason;
	private String detailReason;
}
