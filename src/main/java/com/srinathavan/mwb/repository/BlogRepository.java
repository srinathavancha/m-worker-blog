/**
 *  
 *   *  
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *
 */
package com.srinathavan.mwb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.srinathavan.mwb.entity.Blog;
import com.srinathavan.mwb.entity.User;

/**
 * @author Avancha
 * In Spring every repository works with each entiry
 * Every repository extends {@link JpaRepository} of type entity and 
 * primary field variable
 */
public interface BlogRepository extends JpaRepository<Blog, Integer> {
	/**
	 * User is an attribute in Blog entity
	 * Spring Data JPA will generate implementation of this method
	 * which will be select all blogs which are associate with this user entity.
	 * 
	 * @param user
	 * @return
	 */
	List<Blog> findByUser(User user	);
}
