package com.niit.ecommerce.FrontEndMain.controller;

import java.security.Principal;
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
import com.niit.ecommerce.Backend.dao.ProductDao;
import com.niit.ecommerce.Backend.dao.SupplierDao;
import com.niit.ecommerce.Backend.dao.UserDao;
import com.niit.ecommerce.Backend.entity.Cart;
import com.niit.ecommerce.Backend.entity.CartItem;
import com.niit.ecommerce.Backend.entity.Category;
import com.niit.ecommerce.Backend.entity.Product;
import com.niit.ecommerce.Backend.entity.Supplier;
import com.niit.ecommerce.Backend.entity.User;

@Controller
public class Controller1 {

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	SupplierDao supplierDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	UserDao userDao;

	@Autowired
	CartItemDao cartItemDao;

	@Autowired
	CartDao cartDao;

	Category category;
	Product product;
	User user;
	Cart cart;
	CartItem cartItem;

	@RequestMapping(value = { "/", "/index", "/home" })
	public String index(Principal principal, Model model) {

		if (principal != null) {

			User user = userDao.getUserByUsername(principal.getName());
			if (user.getRole().equalsIgnoreCase("Admin")) {
				List<Product> productList = productDao.getAllProductList();
				List<User> userList = userDao.getAllUsers();
				List<Supplier> supplierList = supplierDao.getAllSupplier();
				model.addAttribute("email", principal.getName());
				model.addAttribute("user_firstName", user.getUser_firstName());
				model.addAttribute("user_lastName", user.getUser_lastName());
				model.addAttribute("productList", productList);
				model.addAttribute("userList", userList);
				model.addAttribute("supplierList", supplierList);

				return "admin/index";
			} else if (user.getRole().equalsIgnoreCase("Customer")) {
				if (user.isEnabled() && user.getUser_status() == 1) {

					model.addAttribute("email", principal.getName());
					model.addAttribute("user_firstName", user.getUser_firstName());
					model.addAttribute("user_lastName", user.getUser_lastName());
					return "user/index";
				} else {
					model.addAttribute("user_firstName", user.getUser_firstName());
					model.addAttribute("user_lastName", user.getUser_lastName());
					return "user/activatemyaccount";
				}
			}
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
	@RequestMapping(value = { "/singleproduct1" })
	public String getsingleproduct(@RequestParam("name") Long product_id, Principal principal, Model map) {
		product = productDao.getProductById((Long) product_id);
		if (principal != null) {
			User user = userDao.getUserByUsername(principal.getName());
			map.addAttribute("user_firstName", user.getUser_firstName());
			map.addAttribute("user_lastName", user.getUser_lastName());
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
}
