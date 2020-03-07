package com.ezypay.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezypay.model.SubscriptionModel;

@Controller
public class SubscriptionController {
	@RequestMapping(value = "dashboard")
	public String getDashboard(@ModelAttribute("subscriptionModel") SubscriptionModel subscriptionModel, Model model) {
	System.out.println("Check dashboard");
	return "subscriptions"; // navigate to customer.jsp page
	}

	@RequestMapping(value = "createSubscription")
	public String addCustomer(@ModelAttribute("subscriptionModel") SubscriptionModel subscriptionModel, Model model) {
	System.out.println("Check Create Subscription");
	model.addAttribute("subscriptionModel", subscriptionModel);
	return "createSubscription";
	}
	@RequestMapping(value = "viewSubscription")
	public String showCustomer(@ModelAttribute("subscriptionModel") SubscriptionModel subscriptionModel, Model model) {
	System.out.println("Check View Subscription");
	System.out.println("Amount:"+subscriptionModel.getAmount());
	Date startDate = subscriptionModel.getStartDate();
	Date endDate = subscriptionModel.getEndDate();
	int subscriptionType = subscriptionModel.getSubscriptionType();
	List<Date> invoiceDate = new ArrayList<Date>();
	
	if(subscriptionType == 1) {
		Date tempDate = startDate;
		while(endDate.compareTo(tempDate) >= 0) {
			invoiceDate.add(tempDate);
			Calendar c = Calendar.getInstance();
	        c.setTime(tempDate);
	        c.add(Calendar.DAY_OF_MONTH, 1);
	        tempDate = c.getTime();
		}
	}else if(subscriptionType == 2) {
		Date tempDate = startDate;
		while(endDate.compareTo(tempDate) >= 0) {
			invoiceDate.add(tempDate);
			Calendar c = Calendar.getInstance();
	        c.setTime(tempDate);
	        c.add(Calendar.DAY_OF_MONTH, 7);
	        tempDate = c.getTime();
		}
	}else if(subscriptionType == 3) {
		Date tempDate = startDate;
		while(endDate.compareTo(tempDate) >= 0) {
			invoiceDate.add(tempDate);
			Calendar c = Calendar.getInstance();
	        c.setTime(tempDate);
	        c.add(Calendar.MONTH, 1);
	        tempDate = c.getTime();
		}
	}
	
	model.addAttribute("invoiceDate", invoiceDate);
	model.addAttribute("subscriptionModel", subscriptionModel);
	return "viewSubscription";
	}
	
	@InitBinder
	private void dateBinder(WebDataBinder binder) {
	    //The date format to parse or output your dates
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	    //Create a new CustomDateEditor
	    CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
	    //Register it as custom editor for the Date type
	    binder.registerCustomEditor(Date.class, editor);
	}

}
