package com.mysore.dao;

import java.util.ArrayList;
import com.mysore.dto.User;

public interface userDAO {
	public ArrayList<User> getUser();
public boolean insertuser(User u);
public User getuser(String email,String password);
public ArrayList<User> searchUser(String searchValue, String sortBy);
public boolean updateUser(User u);
}
