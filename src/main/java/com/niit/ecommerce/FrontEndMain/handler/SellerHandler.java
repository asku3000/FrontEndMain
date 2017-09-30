package com.niit.ecommerce.FrontEndMain.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

import com.niit.ecommerce.Backend.dao.UserDao;
import com.niit.ecommerce.Backend.entity.User;

@Component
public class SellerHandler {
	@Autowired
	UserDao userDao;

	public User initFlow() {
		return (new User());
	}
	
	public String validateDetails(User user, MessageContext messageContext) {
		String status = "success";

		if (user.getUser_firstName().isEmpty()) {
			messageContext.addMessage(new MessageBuilder().error().source("user_firstName")
					.defaultText("First Name cannot be Empty").build());
			status = "failure";
		}

		if (user.getUser_lastName().isEmpty()) {
			messageContext.addMessage(new MessageBuilder().error().source("user_lastName")
					.defaultText("Last Name cannot be Empty").build());
			status = "failure";
		}
		if (user.getSupplier_companyName().isEmpty()) {
			messageContext.addMessage(new MessageBuilder().error().source("supplier_companyName")
					.defaultText("Comapny Name cannot be Empty").build());
			status = "failure";
		}
		if (user.getSupplier_brandName().isEmpty()) {
			messageContext.addMessage(new MessageBuilder().error().source("supplier_brandName")
					.defaultText("Company Brand Name cannot be Empty").build());
			status = "failure";
		}

		if (user.getEmail().isEmpty()) {
			messageContext.addMessage(
					new MessageBuilder().error().source("email").defaultText("Email cannot be Empty").build());
			status = "failure";
		}

		if (user.getAddress().isEmpty()) {
			messageContext.addMessage(
					new MessageBuilder().error().source("address").defaultText("Address cannot be Empty").build());
			status = "failure";
		}

		if (user.getPassword().isEmpty()) {
			messageContext.addMessage(
					new MessageBuilder().error().source("password").defaultText("Password cannot be Empty").build());
			status = "failure";
		}

		if (user.getContact().isEmpty()) {
			messageContext.addMessage(
					new MessageBuilder().error().source("contact").defaultText("Contact cannot be Empty").build());
			status = "failure";
		}

		if (user.getUser_dob().isEmpty()) {
			messageContext.addMessage(new MessageBuilder().error().source("user_dob")
					.defaultText("Date Of Birth cannot be Empty").build());
			status = "failure";
		}

		if (user.getUser_state().equals("null")) {
			messageContext.addMessage(
					new MessageBuilder().error().source("user_state").defaultText("State cannot be Empty").build());
			status = "failure";
		}

		if (user.getUser_gender().equals("null")) {
			messageContext.addMessage(
					new MessageBuilder().error().source("user_gender").defaultText("Gender cannot be empty").build());
			status = "failure";
		}
		return status;

	}
	public String saveUser(User user) {
		String status = "success";
		String fname = user.getUser_firstName();
		String lname = user.getUser_lastName();
		fname = fname.trim();
		fname = fname.toLowerCase();
		lname = lname.trim();
		lname = lname.toLowerCase();
		user.setUser_firstName(fname);
		user.setUser_lastName(lname);
		String coname = user.getSupplier_companyName();
		String brandname = user.getSupplier_brandName();
		coname = coname.trim();
		coname = coname.toLowerCase();
		brandname = brandname.trim();
		brandname = brandname.toLowerCase();
		user.setEnabled(true);
		user.setRole("supplier");
		Boolean b = userDao.add(user);
		if (b) {
			status = "success";
		} else {
			status = "failure";
		}
		return status;
	}

}
