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

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.srinathavan.mwb.entity.Blog;
import com.srinathavan.mwb.entity.BlogEntry;
import com.srinathavan.mwb.entity.Role;
import com.srinathavan.mwb.entity.User;
import com.srinathavan.mwb.repository.BlogRepository;
import com.srinathavan.mwb.repository.ItemRepository;
import com.srinathavan.mwb.repository.RoleRepository;
import com.srinathavan.mwb.repository.UserRepository;

/**
 * @author Avancha
 *
 */
@Service
@Transactional
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private ItemRepository itemRepository;

	/**
	 * @return
	 */
	public List<User> findAll() {
			return userRepository.findAll();
	}

	/**
	 * @param id
	 * @return
	 */
	public User findOne(int id) {
		return userRepository.findOne(id);
	}

	/**
	 * @param id
	 * @return
	 */
	@Transactional
	public User findOneWithBlog(int id) {
		User user = findOne(id);
		if(null != user){
			List<Blog> blogs = blogRepository.findByUser(user);
			for (Iterator iterator = blogs.iterator(); iterator.hasNext();) {
				Blog blog = (Blog) iterator.next();
				/*List<BlogEntry> items = itemRepository.findByBlog(blog);*/
				List<BlogEntry> blogEntries = itemRepository.findByBlog(blog, (Pageable) new PageRequest(0, 10, Direction.DESC, "publishedDate"));
				blog.setItems(blogEntries);
			}
			user.setBlogs(blogs);			
		}
		return user;
	}

	/**
	 * Save entity
	 * @param user
	 */
	public void save(User user) {
		//enable user
		user.setEnabled(Boolean.TRUE);
		//encode password
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));
		//assign user role
		List<Role> roles = new ArrayList<Role>();
		roles.add(roleRepository.findByName("ROLE_USER"));
		user.setRoles(roles);		
		userRepository.save(user);
	}

	/**
	 * @param name
	 * @return
	 */
	public User findOneWithBlog(String name) {
		User user = userRepository.findByName(name);
		return findOneWithBlog(user.getId());
	}

	/**
	 * @param id
	 */
	public void delete(int id) {
		userRepository.delete(id);
	}
	
}
