package com.skilldistillery.ghostkitchen.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.ghostkitchen.entities.Restaurant;
import com.skilldistillery.ghostkitchen.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User authenticateUser(String username, String password) {
		User user = null;

		try {
			String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw AND u.enabled = true";
			user = em.createQuery(jpql, User.class).setParameter("un", username).setParameter("pw", password)
					.getSingleResult();
		} catch (Exception e) {
			System.err.println("Invalid login: " + username);
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public User register(User user) {
		user.setEnabled(true); 
//		if(user.getImageUrl().equals("")|| user.getImageUrl()==null) {
//			user.setImageUrl("imageURL");
//    	}
		em.persist(user);
		em.flush();
		return user;

	}

	@Override
	public User updateUser(int id, User user) {
		User managedUser = em.find(User.class, id); 
		managedUser.setFirstName(user.getFirstName());
		managedUser.setLastName(user.getLastName());
		managedUser.setEmail(user.getEmail());
		managedUser.setImageUrl(user.getImageUrl());
		managedUser.setAboutMe(user.getAboutMe());
		return managedUser; 
	}


}
