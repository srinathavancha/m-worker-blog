/**
 *  
 *   *  
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *
 */
package com.srinathavan.mwb.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.srinathavan.mwb.entity.Blog;
import com.srinathavan.mwb.entity.User;
import com.srinathavan.mwb.repository.BlogRepository;
import com.srinathavan.mwb.repository.UserRepository;

/**
 * @author Avancha
 *
 */
@Service
public class BlogService {
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private UserRepository userRepository;

	/**
	 * @param blog
	 * @param principle
	 */
	public void save(Blog blog, Principal principle) {
		String username = principle.getName();
		User user = userRepository.findByName(username);
		blog.setUser(user);
		blogRepository.save(blog);	
	}

	/**
	 * @param id
	 */
	public void delete(int id) {
		blogRepository.delete(id);
	}
	
	
}
