package com.niit.ecommerce.FrontEndMain.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.ecommerce.Backend.dao.CartDao;
import com.niit.ecommerce.Backend.dao.CartItemDao;
import com.niit.ecommerce.Backend.dao.CategoryDao;
import com.niit.ecommerce.Backend.dao.PaymentDao;
import com.niit.ecommerce.Backend.dao.ProductDao;
import com.niit.ecommerce.Backend.dao.ReviewsDao;
import com.niit.ecommerce.Backend.dao.UserDao;
import com.niit.ecommerce.Backend.entity.Cart;
import com.niit.ecommerce.Backend.entity.CartItem;
import com.niit.ecommerce.Backend.entity.Category;
import com.niit.ecommerce.Backend.entity.Payment;
import com.niit.ecommerce.Backend.entity.Product;
import com.niit.ecommerce.Backend.entity.Reviews;
import com.niit.ecommerce.Backend.entity.User;

@Controller
public class Controller1 {

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

	@Autowired
	PaymentDao payementDao;

	Category category;
	Product product;
	User user;
	Cart cart;
	CartItem cartItem;
	Reviews reviews;
	Payment payment;

	@RequestMapping(value = { "/", "/index", "/home" })
	public String index(Principal principal, Model model) {

		if (principal != null) {

			user = userDao.getUserByUsername(principal.getName());
			if (user.getRole().equalsIgnoreCase("Admin")) {
				List<Product> productList = productDao.getAllProductList();
				List<User> userList1 = userDao.getAllUsers();
				List<User> userList = new ArrayList<User>();
				for (User u : userList1) {
					if (u.getRole().equalsIgnoreCase("customer")) {
						userList.add(u);
					}

				}
				List<User> supplierList = new ArrayList<User>();
				for (User u : userList1) {
					if (u.getRole().equalsIgnoreCase("supplier")) {
						supplierList.add(u);
					}

				}
				// List<Supplier> supplierList = supplierDao.getAllSupplier();
				List<Reviews> reviewsList = reviewsDao.getAllReviews();
				model.addAttribute("email", principal.getName());
				model.addAttribute("user_firstName", user.getUser_firstName());
				model.addAttribute("user_lastName", user.getUser_lastName());
				model.addAttribute("productList", productList);
				model.addAttribute("userList", userList);
				model.addAttribute("supplierList", supplierList);
				model.addAttribute("reviewsList", reviewsList);

				return "admin/index";
			} else if (user.getRole().equalsIgnoreCase("Customer")) {
				if (user.isEnabled() && user.getUser_status() == 1) {
					List<Reviews> list = reviewsDao.getAllReviews();
					List<Reviews> list1 = new ArrayList<Reviews>();
					for (Reviews r : list) {
						if (r.isReview_enabled() == true) {
							if (r.getReview_stars() > 3) {
								list1.add(r);
							}
						}
					}
					model.addAttribute("reviewlist", list1);
					model.addAttribute("email", principal.getName());
					model.addAttribute("user_firstName", user.getUser_firstName());
					model.addAttribute("user_lastName", user.getUser_lastName());
					return "user/index";
				}
			} else {
				if (user.getRole().equalsIgnoreCase("supplier")) {
					Long user_id = user.getUser_id();
					List<Product> productList = productDao.getProductBySupplierId(user_id);
					model.addAttribute("productList", productList);
					model.addAttribute("email", principal.getName());
					model.addAttribute("user_firstName", user.getUser_firstName());
					model.addAttribute("user_firstName", user.getSupplier_brandName());
					return "supplier/index";
				}

			}
		} else

		{
			List<Reviews> list = reviewsDao.getAllReviews();
			List<Reviews> list1 = new ArrayList<Reviews>();
			for (Reviews r : list) {
				if (r.isReview_enabled() == true) {
					if (r.getReview_stars() > 3) {
						list1.add(r);
					}
				}
			}
			model.addAttribute("reviewlist", list1);
		}

		return "index";
	}

	// ------------------Controller For Login Error------------------
	@GetMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String msg, Model model) {
		if (error != null) {
			model.addAttribute("err", "Authentication Failed - Invalid Credentials!");
		}
		if (msg != null) {
			model.addAttribute("err", "You Have Been Succesfully Logged Out!");
		}
		return "Login";
	}

	// ------------------controller for login page------------------
	@RequestMapping(value = { "/login1" })
	public String loginpage() {
		return "Login";

	}

	// ------------------controller for error page------------------
	@RequestMapping(value = { "/AboutUs" })
	public String aboutus(Principal principal, Model map) {
		if (principal != null) {
			User user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
		}
		return "aboutus";

	}

	// ------------------controller for contact us page------------------
	@RequestMapping(value = { "/ContactUs" })
	public String ContactUs(Principal principal, Model map) {
		if (principal != null) {
			User user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
		}
		return "contactus";

	}

	// ------------------controller for dropdown list of text books / magazines
	// etc us page------------------
	@ModelAttribute("textbookList")
	public List<Category> gettextBookList(Principal principal, Model map) {
		List<Category> textbookList = categoryDao.getCategoryByCategoty_type("text books");
		map.addAttribute("textbookList", textbookList);
		if (principal != null) {
			User user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
		}
		return textbookList;
	}

	// ------------------controller for going to product page through dropdown
	// list of header us page------------------
	@RequestMapping(value = { "/textbooks", "/magazinesList", "/novelList", "/epicList" })
	public String textBooksbylevel(@RequestParam("name") String levelName, Principal principal, Model map) {
		category = categoryDao.getCategoryByCategory_level(levelName);
		System.out.println(category.getCategory_level());
		System.out.println(category.toString());
		List<Product> list = productDao.getProductByCategoryLevel(category);
		if (principal != null) {
			User user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
		}
		map.addAttribute("textbook", list);
		return "product";
	}

	// ------------------controller for dropdown list of text books / magazines
	// etc us page------------------
	@ModelAttribute("magazinesList")
	public List<Category> getmagazinesList(Model map) {
		List<Category> magazinesList = categoryDao.getCategoryByCategoty_type("magazines");
		map.addAttribute("magazinesList", magazinesList);
		return magazinesList;
	}

	// ------------------controller for dropdown list of text books / magazines
	// etc us page------------------
	@ModelAttribute("novelList")
	public List<Category> getnovelList(Model map) {
		List<Category> novelList = categoryDao.getCategoryByCategoty_type("novels");
		map.addAttribute("novelList", novelList);
		return novelList;
	}

	// ------------------controller for dropdown list of text books / magazines
	// etc us page------------------
	@ModelAttribute("epicList")
	public List<Category> getepicList(Model map) {
		List<Category> epicList = categoryDao.getCategoryByCategoty_type("epics");
		map.addAttribute("epicList", epicList);
		return epicList;
	}

	// ------------------controller for going to single product
	// page------------------
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = { "/singleproduct1" })
	public String getsingleproduct(@RequestParam("name") Long product_id, Principal principal, Model map) {
		product = productDao.getProductById((Long) product_id);
		if (principal != null) {
			user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());

			// product = productDao.getProductById((long) 35);
			if (product.isProduct_activeIs() == true) {
				List<Reviews> list = reviewsDao.getAllReviewsByProductId(product);
				int listlength = list.size();
				float totalReview = 0;
				int averagelistlength = 0;
				List<Reviews> list1 = null;
				list1 = new ArrayList<Reviews>();
				for (Reviews r : list) {
					if (r.isReview_enabled() == true) {

						list1.add(r);
						totalReview = totalReview + r.getReview_stars();
						averagelistlength = averagelistlength + 1;
						System.out.println("Hello :" + r.toString());
						map.addAttribute("reviewsList", list1);
					}
				}
				// map.addAttribute("reviewsList", list1);
				for (Reviews c : list1) {
					System.out.println("List :" + c.toString());
				}
				System.out.println("Hello :" + averagelistlength);
				totalReview /= averagelistlength;
				System.out.println("totalReview" + totalReview);
				int TotalReview = Math.round(totalReview);
				System.out.println("total average: " + TotalReview);
				int diff = 5 - TotalReview;
				reviews = reviewsDao.getReviewsByUserAndProduct(product, user);
				int i = 1;
				int a = 1;
				map.addAttribute("average", totalReview);
				map.addAttribute("average1", TotalReview);
				map.addAttribute("average2", diff);
				if (reviews != null) {
					i = 0;
					a = 0;
					map.addAttribute("editButton", a);
					map.addAttribute("reviewButton", i);
				} else {
					map.addAttribute("reviewButton", i);
				}
			}
		} else {
			user = new User();
			int c = 1;
			if (product.isProduct_activeIs() == true) {
				List<Reviews> list = reviewsDao.getAllReviewsByProductId(product);
				int listlength = list.size();
				float totalReview = 0;
				int averagelistlength = 0;
				List<Reviews> list1 = null;
				list1 = new ArrayList<Reviews>();
				for (Reviews r : list) {
					if (r.isReview_enabled() == true) {

						list1.add(r);
						totalReview = totalReview + r.getReview_stars();
						averagelistlength = averagelistlength + 1;
						System.out.println("Hello :" + r.toString());
					}
				}
				map.addAttribute("reviewsList", list1);

				System.out.println("Hello :" + averagelistlength);
				totalReview /= averagelistlength;
				System.out.println("totalReview" + totalReview);
				int TotalReview = Math.round(totalReview);
				System.out.println("total average: " + TotalReview);
				int diff = 5 - TotalReview;
				map.addAttribute("average", totalReview);
				map.addAttribute("average1", TotalReview);
				map.addAttribute("average2", diff);
				map.addAttribute("login", c);
			}

		}

		map.addAttribute("product", product);
		return "singleproduct";
	}

	// ------------------controller for add to cart by checking login and
	// product is already or not if not then add if yes then +
	// 1------------------
	@SuppressWarnings("unused")
	@RequestMapping(value = { "/user/product" })
	public String addtocart(@RequestParam("name") Long product_id, Model map, Principal principal,
			HttpServletRequest request) {

		if (principal != null) {

			User user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());

			String refer = request.getHeader("Referer");
			System.out.println("Referer" + refer);
			user = userDao.getUserByUsername(principal.getName());
			cart = user.getCart();
			product = productDao.getProductById((Long) product_id);
			cartItem = cartItemDao.getCartItemByCartIdAndProductId(cart, product);
			Boolean check = product.isProduct_activeIs();
			if (product.getProduct_quantity() == 0 || check.equals(false)) {
				map.addAttribute("productadded", "Sorry !! this product is out of stock");
				return "redirect:" + refer;
			} else {
				if (cartItem == null) {
					cartItem = new CartItem();
					cartItem.setCart(cart);
					int availQty = product.getProduct_quantity();
					int sellqty = 1;
					if (sellqty <= availQty) {
						cartItem.setProduct(product);
						cartItem.setSell_quantity(sellqty);
						cartItem.setTotal_price(cartItem.getSell_quantity() * product.getProduct_price());
						boolean cartItemadded = cartItemDao.addCartItem(cartItem);
						int NewQty = availQty - sellqty;
						product.setProduct_quantity(NewQty);
						boolean productupdate = productDao.update(product);
						Long grandTotal = cartItemDao.getGrandTotal(cart);
						int cartItemCount = cartItemDao.getTotalQuantity(cart);
						cart.setGrandTotal(grandTotal);
						cart.setCartItemCount(cartItemCount);
						boolean updateCart = cartDao.updateCart(cart);
						map.addAttribute("productadded", "Product added to cart");
						return "redirect:" + refer;
					} else {
						map.addAttribute("productadded",
								"SORRY !!!! mr. You can buy only :- " + product.getProduct_quantity()
										+ " units of this product. Please change your choice. ");
						return "redirect:" + refer;
					}
				}

				else {
					int availQty = product.getProduct_quantity();
					int sellingQty = cartItem.getSell_quantity();
					sellingQty += 1;
					// System.out.println("helo"+product.isProduct_activeIs());
					if (1 <= availQty) {
						cartItem.setSell_quantity(sellingQty);
						cartItem.setTotal_price(cartItem.getSell_quantity() * product.getProduct_price());
						boolean cartItemadded = cartItemDao.updateCartItem(cartItem);
						int NewQty = availQty - 1;
						product.setProduct_quantity(NewQty);
						boolean productupdate = productDao.update(product);
						Long grandTotal = cartItemDao.getGrandTotal(cart);
						int cartItemCount = cartItemDao.getTotalQuantity(cart);
						cart.setGrandTotal(grandTotal);
						cart.setCartItemCount(cartItemCount);
						boolean updateCart = cartDao.updateCart(cart);
						map.addAttribute("productadded", "Product added to cart with one more quantity");
						return "redirect:" + refer;
					} else {
						map.addAttribute("productadded",
								"SORRY !!!!  You can buy only :- " + product.getProduct_quantity()
										+ " units of this product. Please change your choice. ");
						System.out.println("SORRY !!!!  You can buy only :- " + product.getProduct_quantity()
								+ " units of this product. Please change your choice. ");
						return "redirect:" + refer;
					}

				}
			}

		}
		return "user/product";
	}

	@RequestMapping(value = { "/search" })
	public String searchproductfor(@RequestParam("searchfor") String product_name, Principal principal, Model map) {
		List<Product> product = productDao.searchProductByProductName(product_name);
		if (principal != null) {
			User user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
		}
		// System.out.println(product.toString() + "hello");
		map.addAttribute("textbook", product);
		return "product";
	}

	// -------controller for displaying user cart------------
	@RequestMapping(value = { "/user/usercart" })
	public String cart(Principal principal, Model map) {

		if (principal != null) {
			User user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
		}

		User user = userDao.getUserByUsername(principal.getName());
		product = new Product();
		cart = user.getCart();
		List<CartItem> list = cartItemDao.cartItemGetByCart(cart);
		map.addAttribute("cartitems", list);
		int cartItemCount = cartItemDao.getTotalQuantity(cart);
		long grandTotal = cartItemDao.getGrandTotal(cart);
		cart.setCartItemCount(cartItemCount);
		cart.setGrandTotal(grandTotal);
		@SuppressWarnings("unused")
		boolean check = cartDao.updateCart(cart);
		cart = user.getCart();
		map.addAttribute("cart", cart);
		return "user/usercart";
	}

	// ----controller for plus button at cart -----------
	@SuppressWarnings("unused")
	@RequestMapping(value = { "/plusbutton" })
	public String plusbutton(@RequestParam("name") Long product_id, Principal principal, Model map,
			HttpServletRequest request) {

		if (principal != null) {

			user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());

			String refer = request.getHeader("Referer");
			cart = user.getCart();
			product = productDao.getProductById((Long) product_id);
			cartItem = cartItemDao.getCartItemByCartIdAndProductId(cart, product);
			int availQty = product.getProduct_quantity();
			int sellingQty = cartItem.getSell_quantity();
			sellingQty += 1;
			Boolean check = product.isProduct_activeIs();
			if (1 <= availQty && check.equals(true)) {
				cartItem.setSell_quantity(sellingQty);
				cartItem.setTotal_price(cartItem.getSell_quantity() * product.getProduct_price());
				boolean updatecartItem = cartItemDao.updateCartItem(cartItem);
				int NewQty = availQty - 1;
				product.setProduct_quantity(NewQty);
				boolean updateProduct = productDao.update(product);
				int cartItemCount = cartItemDao.getTotalQuantity(cart);
				long grandTotal = cartItemDao.getGrandTotal(cart);
				cart.setCartItemCount(cartItemCount);
				cart.setGrandTotal(grandTotal);
				boolean updatecart = cartDao.updateCart(cart);
				cart = user.getCart();
				// map.addAttribute("cart", cart);
				return "redirect:" + refer;

			} else {
				map.addAttribute("error", "SORRY !!!!  This product is out of stock");
				return "redirect:" + refer;
			}
		}
		return "user/product";
	}

	// ----controller for minus button at cart -----------
	@SuppressWarnings("unused")
	@RequestMapping(value = { "/minusbutton" })
	public String minusbutton(@RequestParam("name") Long product_id, Principal principal, Model map,
			HttpServletRequest request) {
		if (principal != null) {

			user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());

			String refer = request.getHeader("Referer");
			cart = user.getCart();
			product = productDao.getProductById((Long) product_id);
			cartItem = cartItemDao.getCartItemByCartIdAndProductId(cart, product);
			int availQty = product.getProduct_quantity();
			int sellingQty = cartItem.getSell_quantity();
			if (sellingQty > 0) {
				sellingQty -= 1;

				cartItem.setSell_quantity(sellingQty);
				cartItem.setTotal_price(cartItem.getSell_quantity() * product.getProduct_price());
				boolean updateCartItem = cartItemDao.updateCartItem(cartItem);
				int NewQty = availQty + 1;
				product.setProduct_quantity(NewQty);
				boolean updateProduct = productDao.update(product);
				int cartItemCount = cartItemDao.getTotalQuantity(cart);
				long grandTotal = cartItemDao.getGrandTotal(cart);
				cart.setCartItemCount(cartItemCount);
				cart.setGrandTotal(grandTotal);
				boolean updatecart = cartDao.updateCart(cart);
				cart = user.getCart();

				return "redirect:" + refer;
			} else {
				// System.out.println("You cant further delete this product");
				map.addAttribute("error", "You cant further delete this product");
				return "redirect:" + refer;
			}

		}
		return "user/product";

	}

	// ----controller for remove button at cart -----------
	@SuppressWarnings("unused")
	@RequestMapping(value = { "/removebutton" })
	public String removebutton(@RequestParam("name") Long product_id, Principal principal, Model map,
			HttpServletRequest request) {
		if (principal != null) {

			user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());

			String refer = request.getHeader("Referer");
			cart = user.getCart();

			product = productDao.getProductById((Long) product_id);
			cartItem = cartItemDao.getCartItemByCartIdAndProductId(cart, product);
			if (cartItem == null) {
				map.addAttribute("error", "This product is not present in your Cart");
				return "redirect:" + refer;
			} else {
				Long cartItem_Id = cartItem.getCartItem_Id();

				int availQty = product.getProduct_quantity();
				int sellingQty = cartItem.getSell_quantity();
				availQty += sellingQty;
				product.setProduct_quantity(availQty);
				System.out.println(availQty + "............." + sellingQty);
				boolean deleteCartItem = cartItemDao.deleteCartItem(cartItem_Id);
				boolean updateProduct = productDao.update(product);
				int cartItemCount = cartItemDao.getTotalQuantity(cart);
				long grandTotal = cartItemDao.getGrandTotal(cart);
				cart.setCartItemCount(cartItemCount);
				cart.setGrandTotal(grandTotal);
				boolean updatecart = cartDao.updateCart(cart);
				cart = user.getCart();
				map.addAttribute("error", "Product is removed from your Cart");
				return "redirect:" + refer;

			}

		}
		return "user/product";
	}

	// ----controller for coming to change password page -------
	@RequestMapping(value = { "/user/changePassword" })
	public String changepassword(Principal principal, Model map) {
		user = userDao.getUserByUsername(principal.getName());

		map.addAttribute("user_firstName", user.getUser_firstName());
		map.addAttribute("user_lastName", user.getUser_lastName());

		map.addAttribute("user", user);
		return "user/activate";
	}

	// ----controller for changing the password and returning to same page------
	@SuppressWarnings("unused")
	@RequestMapping(value = { "/user/changepassword2" })
	public String changepassword2(@RequestParam("password") String pass, @RequestParam("password1") String pass1,
			Principal principal, Model map, HttpServletRequest request) {
		String refer = request.getHeader("Referer");
		user = userDao.getUserByUsername(principal.getName());
		user.setPassword(pass1);
		map.addAttribute("user_firstName", user.getUser_firstName());
		map.addAttribute("user_lastName", user.getUser_lastName());
		boolean updateUser = userDao.update(user);
		user = userDao.getUserByUsername(principal.getName());
		map.addAttribute("user", user);
		map.addAttribute("msg", "Password has been changed");
		return "redirect:" + refer;
	}

	// --controller for going to update profile page--------
	@RequestMapping(value = { "/user/updateProfile" })
	public String getProfile(Principal principal, Model map) {
		user = userDao.getUserByUsername(principal.getName());
		map.addAttribute("user_firstName", user.getUser_firstName());
		map.addAttribute("user_lastName", user.getUser_lastName());
		map.addAttribute("user", user);
		return "user/updateprofile";
	}

	// ---controller for updating profile------
	@SuppressWarnings("unused")
	@RequestMapping(value = { "/user/updateProfile1" })
	public String updateProfile(@RequestParam("user_firstName") String user_firstName,
			@RequestParam("user_lastName") String user_lastName, @RequestParam("address") String address,
			@RequestParam("user_state") String user_state, @RequestParam("contact") String contact, Principal principal,
			Model map, HttpServletRequest request) {
		if (user_state.equals("null")) {
			String refer = request.getHeader("Referer");

			user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
			map.addAttribute("user", user);
			map.addAttribute("msg", "Invalid State !! Please Choose a valid state");
			return "redirect:" + refer;
		} else {
			String refer = request.getHeader("Referer");
			user = userDao.getUserByUsername(principal.getName());
			user.setUser_firstName(user_firstName);
			user.setUser_lastName(user_lastName);
			user.setAddress(address);
			user.setContact(contact);
			user.setUser_state(user_state);
			boolean update = userDao.update(user);
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
			map.addAttribute("user", user);
			map.addAttribute("msg", "Profile updated successfully !!");
			return "redirect:" + refer;
		}
	}

	// ---controller for deactivating account-----
	@RequestMapping(value = { "/user/userdeactivate" })
	public String userLoginable(Principal principal, Model model, HttpServletRequest request) {
		if (principal != null) {
			user = userDao.getUserByUsername(principal.getName());
			String refer = request.getHeader("Referer");
			model.addAttribute("email", principal.getName());
			model.addAttribute("user_firstName", user.getUser_firstName());
			model.addAttribute("user_lastName", user.getUser_lastName());

			if (user.getUser_status() == 1) {
				user.setUser_status(0);
				model.addAttribute("msg", "User Updated Successfully");
				userDao.update(user);
			} else {
				user.setUser_status(1);
				model.addAttribute("msg", "User Updated Successfully");
				userDao.update(user);
			}

			return "redirect:" + refer;
		}
		return "user/index";
	}

	@RequestMapping(value = { "/user/giveReviewPageController" })
	public String giveReviewPage(@RequestParam("product_id") Long product_id,
			@RequestParam("review_stars") int review_stars, @RequestParam("review_message") String review_message,
			Principal principal, Model map, HttpServletRequest request) {
		String refer = request.getHeader("Referer");
		if (principal != null) {

			user = userDao.getUserByUsername(principal.getName());

			String refer1 = request.getHeader("Referer");
			map.addAttribute("email", principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
			if (user.getUser_status() == 1) {
				product = productDao.getProductById((Long) product_id);
				System.out.println("product hello" + product.getProduct_bookName());
				reviews = reviewsDao.getReviewsByUserAndProduct(product, user);
				if (reviews == null) {
					reviews = new Reviews();
					reviews.setReview_stars(review_stars);
					reviews.setReview_message(review_message);
					reviews.setUser(user);
					reviews.setProduct(product);
					map.addAttribute("user", user);
					map.addAttribute("product", product);
					reviewsDao.addReviews(reviews);
					map.addAttribute("msg", "Updated Successfully");
					return "redirect:" + refer1;
				}

			}

		}
		return "redirect:" + refer;
	}

	@RequestMapping(value = { "/user/editMyreview" })
	public String giveeditReviewPage(@RequestParam("product_id") Long product_id, Principal principal, Model map,
			HttpServletRequest request) {

		if (principal != null) {

			user = userDao.getUserByUsername(principal.getName());

			// String refer = request.getHeader("Referer");
			map.addAttribute("email", principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
			if (user.getUser_status() == 1) {
				product = productDao.getProductById((Long) product_id);
				reviews = reviewsDao.getReviewsByUserAndProduct(product, user);
				if (reviews == null) {
					map.addAttribute("reviewsnull", "You Didn't review this product ,Please add a new one !!!");
					map.addAttribute("reviews", reviews);
					return "user/editreview";
				} else {
					// map.addAttribute("reviewsnull","You Didn't review this
					// product ,Please add a new one !!!");
					map.addAttribute("reviews", reviews);
					return "user/editreview";
				}

			}
			return "user/activatemyaccount";

		}
		return null;

	}

	@RequestMapping(value = { "/user/giveReviewPageController1" })
	public String updateReview(@RequestParam("product_id") Long product_id,
			@RequestParam("review_stars") int review_stars, @RequestParam("review_message") String review_message,
			Principal principal, Model map, HttpServletRequest request) {
		String refer = request.getHeader("Referer");
		if (principal != null) {

			user = userDao.getUserByUsername(principal.getName());

			String refer1 = request.getHeader("Referer");
			map.addAttribute("email", principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
			if (user.getUser_status() == 1) {
				product = productDao.getProductById((Long) product_id);
				reviews = reviewsDao.getReviewsByUserAndProduct(product, user);

				reviews.setReview_stars(review_stars);
				reviews.setReview_message(review_message);
				reviews.setUser(user);
				reviews.setProduct(product);
				map.addAttribute("user", user);
				map.addAttribute("product", product);
				reviewsDao.updateReviews(reviews);
				map.addAttribute("msg", "Updated Successfully");
				return "redirect:" + refer1;

			}

		}
		return "redirect:" + refer;
	}

	// It's for providing User id to web flow in checkout
	@RequestMapping("/checkoutData")
	public String getCheckout(Principal principal) {
		user = userDao.getUserByUsername(principal.getName());
		System.out.println("Hello From Checkout" + user.getUser_id());
		return "redirect:/checkout?user_id=" + user.getUser_id();
	}

}
