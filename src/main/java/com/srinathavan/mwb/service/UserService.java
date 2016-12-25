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

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.srinathavan.mwb.entity.Blog;
import com.srinathavan.mwb.entity.Item;
import com.srinathavan.mwb.entity.User;
import com.srinathavan.mwb.repository.BlogRepository;
import com.srinathavan.mwb.repository.ItemRepository;
import com.srinathavan.mwb.repository.UserRepository;

/**
 * @author Avancha
 *
 */
@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
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
		List<Blog> blogs = blogRepository.findByUser(user);
		for (Iterator iterator = blogs.iterator(); iterator.hasNext();) {
			Blog blog = (Blog) iterator.next();
			/*List<Item> items = itemRepository.findByBlog(blog);*/
			List<Item> items = itemRepository.findByBlog(blog, (Pageable) new PageRequest(0, 10, Direction.DESC, "publishedDate"));
			blog.setItems(items);
		}
		user.setBlogs(blogs);
		return user;
	}
	
}
