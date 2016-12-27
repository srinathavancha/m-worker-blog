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
import org.springframework.security.access.method.P;
import org.springframework.security.access.prepost.PreAuthorize;
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
	 * @return
	 */
	public Blog findOneById(int id) {
		return blogRepository.findOne(id);
	}


	/**
	 * @param id
	 */
	public void delete(int id) {
		blogRepository.delete(id);
	}
	
	/**
	 * Using preAuthorize we can be able to restrict user by username to access only self records
	 * @param blog
	 */
	@PreAuthorize("#blog.user.name == authentication.name or hasRole('ROLE_ADMIN')")
	public void delete(@P("blog") Blog blog) {
		blogRepository.delete(blog);
	}
	
	
}
