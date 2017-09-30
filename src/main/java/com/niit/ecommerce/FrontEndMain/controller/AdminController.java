package com.niit.ecommerce.FrontEndMain.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.ecommerce.Backend.dao.CartDao;
import com.niit.ecommerce.Backend.dao.CartItemDao;
import com.niit.ecommerce.Backend.dao.CategoryDao;
import com.niit.ecommerce.Backend.dao.ProductDao;
import com.niit.ecommerce.Backend.dao.ReviewsDao;
import com.niit.ecommerce.Backend.dao.UserDao;
import com.niit.ecommerce.Backend.entity.Cart;
import com.niit.ecommerce.Backend.entity.CartItem;
import com.niit.ecommerce.Backend.entity.Category;
import com.niit.ecommerce.Backend.entity.Product;
import com.niit.ecommerce.Backend.entity.Reviews;
import com.niit.ecommerce.Backend.entity.User;

@Controller
public class AdminController {
	@Autowired
	CategoryDao categoryDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	UserDao userDao;

	@Autowired
	CartItemDao cartItemDao;

	@Autowired
	CartDao cartDao;

	@Autowired
	ReviewsDao reviewsDao;

	Category category;
	Product product;
	User user;
	User user1;
	Cart cart;
	CartItem cartItem;

	Reviews reviews;

	@RequestMapping(value = { "/admin/userenableordelete" })
	public String userenableordelete(@RequestParam("user") Long user_id, Principal principal, Model model,
			HttpServletRequest request) {
		if (principal != null) {
			user1 = userDao.getUserByUsername(principal.getName());
			String refer = request.getHeader("Referer");
			model.addAttribute("email", principal.getName());
			model.addAttribute("user_firstName", user1.getUser_firstName());
			model.addAttribute("user_lastName", user1.getUser_lastName());
			user = userDao.getUserById((Long) user_id);
			if (user.isEnabled() == true) {
				user.setEnabled(false);
				model.addAttribute("msg", "Updated Successfully");
				userDao.update(user);
			} else {
				user.setEnabled(true);
				model.addAttribute("msg", "Updated Successfully");
				userDao.update(user);
			}

			return "redirect:" + refer;
		}
		return "admin/index";
	}

	@RequestMapping(value = { "/admin/productenableordelete" })
	public String productenableordelete(@RequestParam("product") Long product_id, Principal principal, Model model,
			HttpServletRequest request) {
		if (principal != null) {
			user1 = userDao.getUserByUsername(principal.getName());
			String refer = request.getHeader("Referer");
			model.addAttribute("email", principal.getName());
			model.addAttribute("user_firstName", user1.getUser_firstName());
			model.addAttribute("user_lastName", user1.getUser_lastName());
			product = productDao.getProductById((Long) product_id);
			if (product.isProduct_activeIs() == true) {
				product.setProduct_activeIs(false);
				model.addAttribute("msg", "Updated Successfully");
				productDao.update(product);
			} else {
				if (product.getUser().isEnabled() == true) {
					product.setProduct_activeIs(true);
					model.addAttribute("msg", "Updated Successfully");
					productDao.update(product);
				} else {
					if (product.getUser().isEnabled() == false) {
						// product.setProduct_activeIs(true);
						model.addAttribute("msg", "Supplier is deactivated You cant Active this product");
						// productDao.update(product);

					}
				}

				return "redirect:" + refer;
			}
			return "redirect:" + refer;
		}
		return "admin/index";
	}

	@RequestMapping(value = { "/admin/supplierenableordelete" })
	public String supplierenableordelete(@RequestParam("supplier") Long supplier_id, Principal principal, Model model,
			HttpServletRequest request) {
		if (principal != null) {
			user1 = userDao.getUserByUsername(principal.getName());
			String refer = request.getHeader("Referer");
			model.addAttribute("email", principal.getName());
			model.addAttribute("user_firstName", user1.getUser_firstName());
			model.addAttribute("user_lastName", user1.getUser_lastName());
			user = userDao.getUserById(supplier_id);
			List<Product> listProduct = productDao.getProductBySupplierId(user.getUser_id());
			if (user.isEnabled() == true) {
				user.setEnabled(false);
				model.addAttribute("msg", "Updated Successfully");
				for (Product p : listProduct) {
					p.setProduct_activeIs(false);
					p.toString();
					System.out.println(p.toString() + "hello");
					productDao.update(p);
				}
				userDao.update(user);
			} else {
				user.setEnabled(true);
				model.addAttribute("msg", "Updated Successfully");
				for (Product p : listProduct) {
					p.setProduct_activeIs(true);
					System.out.println(p.toString() + "hello");
					productDao.update(p);
				}
				userDao.update(user);
			}

			return "redirect:" + refer;
		}
		return "admin/index";
	}

	@RequestMapping(value = { "/admin/reviewEnableorDelete" })
	public String reviewEnableorDelete(@RequestParam("review_id") Long review_id, Principal principal, Model model,
			HttpServletRequest request) {
		if (principal != null) {
			user1 = userDao.getUserByUsername(principal.getName());
			String refer = request.getHeader("Referer");
			model.addAttribute("email", principal.getName());
			model.addAttribute("user_firstName", user1.getUser_firstName());
			model.addAttribute("user_lastName", user1.getUser_lastName());
			reviews = reviewsDao.getReviewById(review_id);

			if (reviews.isReview_enabled() == true) {
				reviews.setReview_enabled(false);
				model.addAttribute("msg", "Updated Successfully");
				reviewsDao.updateReviews(reviews);

			} else {
				reviews.setReview_enabled(true);
				model.addAttribute("msg", "Updated Successfully");
				reviewsDao.updateReviews(reviews);

			}

			return "redirect:" + refer;
		}
		return "admin/index";
	}

	@RequestMapping(value = { "/admin/userloginable" })
	public String userLoginable(@RequestParam("user") Long user_id, Principal principal, Model model,
			HttpServletRequest request) {
		if (principal != null) {
			user1 = userDao.getUserByUsername(principal.getName());
			String refer = request.getHeader("Referer");
			model.addAttribute("email", principal.getName());
			model.addAttribute("user_firstName", user1.getUser_firstName());
			model.addAttribute("user_lastName", user1.getUser_lastName());
			user = userDao.getUserById(user_id);
			if (user.getUser_status() == 1) {
				user.setUser_status(0);
				model.addAttribute("msg", "Updated Successfully");
				userDao.update(user);
			} else {
				user.setUser_status(1);
				model.addAttribute("msg", "Updated Successfully");
				userDao.update(user);
			}

			return "redirect:" + refer;
		}
		return "admin/index";
	}

	@RequestMapping(value = { "/admin/updateprofilecontroller" })
	public String updateProductepage(@RequestParam("product") Long product_id, Principal principal, Model map) {
		if (principal != null) {
			user = userDao.getUserByUsername(principal.getName());
			// String refer = request.getHeader("Referer");
			map.addAttribute("email", principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
			product = productDao.getProductById(product_id);
			map.addAttribute("product", product);
			return "admin/productupdate";
		}

		return "null";
	}

	@RequestMapping(value = { "/admin/updateproduct" })
	public String updateProduct(@RequestParam("product_Id") Long product_Id,
			@RequestParam("product_bookName") String product_bookName,
			@RequestParam("product_author") String product_author,
			@RequestParam("product_publisher") String product_publisher,
			@RequestParam("product_description") String product_description,
			@RequestParam("product_price") Long product_price, @RequestParam("product_quantity") int product_quantity,
			Principal principal, Model map, HttpServletRequest request) {

		user = userDao.getUserByUsername(principal.getName());
		String refer = request.getHeader("Referer");
		map.addAttribute("email", principal.getName());
		map.addAttribute("user_firstName", user.getUser_firstName());
		map.addAttribute("user_lastName", user.getUser_lastName());
		product = productDao.getProductById(product_Id);
		product.setProduct_bookName(product_bookName);
		product.setProduct_description(product_description);
		product.setProduct_author(product_author);
		product.setProduct_price(product_price);
		product.setProduct_publisher(product_publisher);
		product.setProduct_quantity(product_quantity);
		productDao.update(product);
		map.addAttribute("msg", "Updated Successfully");
		return "redirect:" + refer;

	}

	@RequestMapping(value = { "/admin/changePassword" })
	public String adminChangePassword(Principal principal, Model map) {
		if (principal != null) {
			user = userDao.getUserByUsername(principal.getName());
			// String refer = request.getHeader("Referer");
			map.addAttribute("email", principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());

			map.addAttribute("user", user);
			return "admin/adminchangepassword";
		}

		return "null";
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = { "/admin/changePassword2" })
	public String adminChangePassword2(@RequestParam("oldpassword") String pass,
			@RequestParam("password1") String pass1, Principal principal, Model map, HttpServletRequest request) {
		if (principal != null) {
			String refer = request.getHeader("Referer");
			user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
			if (pass.equals(user.getPassword())) {
				user.setPassword(pass1);
				map.addAttribute("msg1", "Updated Successfully");
				boolean updateUser = userDao.update(user);
			} else {
				user = userDao.getUserByUsername(principal.getName());
				map.addAttribute("user", user);
				map.addAttribute("msg", "Unable to Update");
			}
			return "redirect:" + refer;
		}

		return "null";
	}
}
