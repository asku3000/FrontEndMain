package com.niit.ecommerce.FrontEndMain.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.ecommerce.Backend.dao.CategoryDao;
import com.niit.ecommerce.Backend.dao.ProductDao;
import com.niit.ecommerce.Backend.entity.Category;
import com.niit.ecommerce.Backend.entity.Product;

@Controller
public class Controller1 {

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	ProductDao productDao;

	Category category;

	@RequestMapping(value = { "/", "/index", "/home" })
	public String home() {
		return "index";

	}

	@RequestMapping(value = { "/AboutUs" })
	public String aboutus() {
		return "aboutus";

	}

	@RequestMapping(value = { "/ContactUs" })
	public String ContactUs() {
		return "contactus";

	}

	@RequestMapping(value = { "/login" })
	public String Login() {
		return "login";

	}

	@ModelAttribute("textbookList")
	public List<Category> gettextBookList(Model map) {
		List<Category> textbookList = categoryDao.getCategoryByCategoty_type("text books");
		map.addAttribute("textbookList", textbookList);
		return textbookList;
	}

	@RequestMapping(value = { "/textbooks", "/magazinesList", "/novelList", "/epicList" })
	public String textBooksbylevel(@RequestParam("name") String levelName, Model map) {
		category = categoryDao.getCategoryByCategory_level(levelName);
		System.out.println(category.getCategory_level());
		System.out.println(category.toString());
		List<Product> list = productDao.getProductByCategoryLevel(category);
		map.addAttribute("textbook", list);
		return "product";
	}

	@ModelAttribute("magazinesList")
	public List<Category> getmagazinesList(Model map) {
		List<Category> magazinesList = categoryDao.getCategoryByCategoty_type("magazines");
		map.addAttribute("magazinesList", magazinesList);
		return magazinesList;
	}

	@ModelAttribute("novelList")
	public List<Category> getnovelList(Model map) {
		List<Category> novelList = categoryDao.getCategoryByCategoty_type("novels");
		map.addAttribute("novelList", novelList);
		return novelList;
	}

	@ModelAttribute("epicList")
	public List<Category> getepicList(Model map) {
		List<Category> epicList = categoryDao.getCategoryByCategoty_type("epics");
		map.addAttribute("epicList", epicList);
		return epicList;
	}
/*
	@RequestMapping(value = { "/epicList" })
	public String epicsByLevel(@RequestParam("name") String levelName, Model map) {
		category = categoryDao.getCategoryByCategory_level(levelName);
		System.out.println(category.getCategory_level());
		System.out.println(category.toString());
		List<Product> list = productDao.getProductByCategoryLevel(category);
		map.addAttribute("textbook", list);
		return "product";
	}

	@RequestMapping(value = { "/magazinesList" })
	public String magazinesByLevel(@RequestParam("name") String levelName, Model map) {
		category = categoryDao.getCategoryByCategory_level(levelName);
		System.out.println(category.getCategory_level());
		System.out.println(category.toString());
		List<Product> list = productDao.getProductByCategoryLevel(category);
		map.addAttribute("textbook", list);
		return "product";
	}

	@RequestMapping(value = { "/novelList" })
	public String novelsByLevel(@RequestParam("name") String levelName, Model map) {
		category = categoryDao.getCategoryByCategory_level(levelName);
		System.out.println(category.getCategory_level());
		System.out.println(category.toString());
		List<Product> list = productDao.getProductByCategoryLevel(category);
		map.addAttribute("textbook", list);
		return "product";
	}*/
}
