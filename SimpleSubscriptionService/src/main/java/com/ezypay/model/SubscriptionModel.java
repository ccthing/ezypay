package com.ezypay.model;

import java.math.BigDecimal;
import java.util.Date;

public class SubscriptionModel {
	
	private BigDecimal amount;
	private int subscriptionType;
	private String paymentDayOrWeek;
	private Date startDate;
	private Date endDate;
	
	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public int getSubscriptionType() {
		return subscriptionType;
	}

	public void setSubscriptionType(int subscriptionType) {
		this.subscriptionType = subscriptionType;
	}

	public String getPaymentDayOrWeek() {
		return paymentDayOrWeek;
	}

	public void setPaymentDayOrWeek(String paymentDayOrWeek) {
		this.paymentDayOrWeek = paymentDayOrWeek;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
	return "SubscriptionModel [amount=" + amount + ", subscriptionType=" + subscriptionType + 
			", paymentDayOrWeek=" + paymentDayOrWeek + ", startDate=" + startDate+ ", endDate=" + endDate + "]";
	} 

}
