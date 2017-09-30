package com.niit.ecommerce.FrontEndMain.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.function.Supplier;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

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
public class SaveImage {
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
	Cart cart;
	CartItem cartItem;
	Reviews reviews;
	private static final String UPLOAD_DIRECTORY = "resources/Images";

	@RequestMapping("/uploadImage")
	public String upload() {
		return "uploadImage";
	}

	@RequestMapping(value = "/supplier/savefile", method = RequestMethod.POST)
	public String saveimage(Model map, @RequestParam CommonsMultipartFile file, @RequestParam("pid") Long pid,
			HttpSession session, Principal p, HttpServletRequest req) throws Exception {
		String refer = req.getHeader("Referer");
		user = userDao.getUserByUsername(p.getName());
		ServletContext context = session.getServletContext();
		String path = context.getRealPath(UPLOAD_DIRECTORY) + "\\" + user.getSupplier_companyName() + "_"
				+ user.getSupplier_brandName() + "_" + user.getUser_id();
		File dir = new File(path);
		if (dir.exists()) {
			product = productDao.getProductById(pid);
			String filename = file.getOriginalFilename();
			filename = product.getProduct_bookName() + filename;
			String imgpath = "/resources/Images/" + user.getSupplier_companyName() + "_" + user.getSupplier_brandName()
					+ "_" + user.getUser_id() + "/" + filename;

			// TO SAVE IMAGE TO LOCATION
			byte[] bytes = file.getBytes();

			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(new File(path + File.separator + filename)));
			stream.write(bytes);
			stream.flush();
			stream.close();

			product.setProduct_imgUrl(imgpath);
			productDao.update(product);
			map.addAttribute("err", "Product Successfully Added....");
			return "supplier/productadded";
		} else {
			dir.mkdir();
			product = productDao.getProductById(pid);
			String filename = file.getOriginalFilename();
			filename = product.getProduct_bookName() + filename;
			String imgpath = "/resources/Images/" + user.getSupplier_companyName() + "_" + user.getSupplier_brandName()
					+ "_" + user.getUser_id() + "/" + filename;
			// System.out.println(imgpath);

			// TO SAVE IMAGE TO LOCATION
			byte[] bytes = file.getBytes();
			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(new File(path + File.separator + filename)));
			stream.write(bytes);
			stream.flush();
			stream.close();

			product.setProduct_imgUrl(imgpath);
			productDao.update(product);
			map.addAttribute("err", "Product Successfully Added....");
			return "supplier/productadded";
		}
	}
}
