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

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.srinathavan.mwb.entity.Blog;
import com.srinathavan.mwb.entity.Item;

/**
 * @author Avancha
 * In Spring every repository works with each entiry
 * Every repository extends {@link JpaRepository} of type entity and 
 * primary field variable
 */
public interface ItemRepository extends JpaRepository<Item	, Integer> {

	/**
	 * @param blog
	 * @return
	 */
	List<Item> findByBlog(Blog blog);
	
	/**
	 * 
	 * @param blog
	 * @param pageable
	 * @return
	 */
	List<Item> findByBlog(Blog blog, Pageable pageable);
}