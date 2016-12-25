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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.srinathavan.mwb.service.UserService;

/**
 * @author Avancha
 *
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	/**
	 * Method to fetch all the users and redirect to users view file with model data 
	 * list of users
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
	 * @param id path variable {id} is dynamic part of url
	 * @return
	 */
	@RequestMapping("/users/{id}")
	public String userDetail(Model model, @PathVariable int id){
		model.addAttribute("user", userService.findOne(id));
		return "user-detail";
	}
}
