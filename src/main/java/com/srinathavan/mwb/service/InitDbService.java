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
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
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
@Transactional
@Service
public class InitDbService {

	/**
	 * Spring will inject instance of some class it will generate and that class
	 * will implement this RoleRepository as that is an interface
	 * 
	 */
	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BlogRepository blogRepository;

	@Autowired
	private ItemRepository itemRepository;

	/**
	 * Lets create a method with @PostConstruct which means this method will
	 * called after -> spring context creation which is created during ->
	 * Application startup, during -> Deployment on the server
	 * 
	 * So anything we add inside this method will be called automatically during
	 * deployment.
	 * 
	 */
	@PostConstruct
	public void init() {
		Role roleUser = new Role();
		roleUser.setName("ROLE_USER");
		roleRepository.save(roleUser);

		Role roleAdmin = new Role();
		roleAdmin.setName("ROLE_ADMIN");
		roleRepository.save(roleAdmin);

		User userAdmin = new User();
		userAdmin.setName("admin");
		List<Role> roles = new ArrayList<Role>();
		roles.add(roleUser);
		roles.add(roleAdmin);
		userAdmin.setRoles(roles);
		userRepository.save(userAdmin);

		Blog blogTutor = new Blog();
		blogTutor.setName("Night Vale");
		blogTutor.setUrl("http://feeds.feedburner.com/welcometonightvale?format=xml");
		blogTutor.setUser(userAdmin);
		blogRepository.save(blogTutor);

		BlogEntry item1 = new BlogEntry();
		item1.setBlog(blogTutor);
		item1.setTitle("first");
		item1.setLink("http://www.welcometonightvale.com");
		item1.setPublishedDate(new Date());
		itemRepository.save(item1);

		BlogEntry item2 = new BlogEntry();
		item2.setBlog(blogTutor);
		item2.setTitle("second");
		item2.setLink("http://www.welcometonightvale.com");
		item2.setPublishedDate(new Date());
		itemRepository.save(item2);

	}
}
