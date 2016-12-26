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

import org.springframework.data.jpa.repository.JpaRepository;

import com.srinathavan.mwb.entity.User;

/**
 * @author Avancha
 * In Spring every repository works with each entiry
 * Every repository extends {@link JpaRepository} of type entity and 
 * primary field variable
 */
public interface UserRepository extends JpaRepository<User, Integer> {

	/**
	 * @param name
	 * @return
	 */
	User findByName(String name);

}
