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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Avancha
 *
 */

@Controller
public class IndexController {

	/**
	 * 
	 */
	public IndexController() {
		// TODO Auto-generated constructor stub
	}	
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	@RequestMapping("/denied")
	public String denied() {
		return "denied";
	}
}
