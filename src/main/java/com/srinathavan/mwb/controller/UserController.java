/**
 *  
 *   *  
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *
 */
package com.srinathavan.mwb.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.srinathavan.mwb.entity.Blog;
import com.srinathavan.mwb.entity.User;
import com.srinathavan.mwb.service.BlogService;
import com.srinathavan.mwb.service.UserService;

/**
 * @author Avancha
 *
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private BlogService blogService;

	/**
	 * we bind this object to <form:form modelAttribute="user" ...> Which will
	 * create a object of type user this way object is bound to spring
	 * controller using @Modelattribute
	 * 
	 * @return
	 */
	@ModelAttribute("user")
	public User constructUser() {
		return new User();
	}

	/**
	 * 
	 * @return
	 */
	@ModelAttribute("blog")
	public Blog constructBlog() {
		return new Blog();
	}

	/**
	 * Method to fetch all the users and redirect to users view file with model
	 * data list of users
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/users")
	public String users(Model model) {
		model.addAttribute("users", userService.findAll());
		return "users";
	}

	/**
	 * 
	 * @param model
	 * @param id
	 *            path variable {id} is dynamic part of url
	 * @return
	 */
	@RequestMapping("/users/{id}")
	public String userDetail(Model model, @PathVariable int id) {
		/* model.addAttribute("user", userService.findOne(id)); */
		/* implementing lazy loading with repository */
		model.addAttribute("user", userService.findOneWithBlog(id));
		return "user-detail";
	}

	/**
	 * show registration screen
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/register")
	public String showRegister(Model model) {
		return "user-register";
	}

	/**
	 * Spring takes the data inserted into form and create User object data and
	 * put into model object
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String doRegister(@ModelAttribute("user") User user) {
		userService.save(user);
		return "redirect:/register.html?success=true";
	}

	/**
	 * Mehod to handle my account details
	 * 
	 * @param model
	 * @param principle
	 * @return
	 */
	@RequestMapping("/account")
	public String showAccount(Model model, Principal principle) {
		String name = principle.getName();
		model.addAttribute("user", userService.findOneWithBlog(name));
		return "my-account";
	}

	/**
	 * Method to model data for new blog object and save
	 * 
	 * @param blog
	 * @param principle
	 * @return
	 */
	@RequestMapping(value = "/account", method = RequestMethod.POST)
	public String doNewBlog(@ModelAttribute("blog") Blog blog, Principal principle) {
		blogService.save(blog, principle);
		return "redirect:/account.html";
	}

	/**
	 * Method to remove blog
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/blog/remove/{id}")
	public String removeBlog(@PathVariable int id) {
		Blog blog = blogService.findOneById(id);
		blogService.delete(blog);
		return "redirect:/account.html";
	}

	/**
	 * Method to remove user
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/users/remove/{id}")
	public String removeUser(@PathVariable int id) {
		userService.delete(id);
		return "redirect:/users.html";
	}
}
