package com.mysore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.mysore.connector.connector;
import com.mysore.dto.User;

public class userDAOImpl implements userDAO{
	  private Connection con;
	    
	    public userDAOImpl() {
	    	this.con=connector.requestConnection();
	    }
	@Override
	public boolean insertuser(User u) {
		// TODO Auto-generated method stub
		int i=0;
		String query="insert into user1 values(0,?,?,?,?,'Bengaluru',CURRENT_TIMESTAMP,'profile')";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getEmail());
			ps.setLong(3,u.getPhone());
			ps.setString(4,u.getPassword());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
		
	}

	@Override
	public User getuser(String email, String password) {
		User u=null;
		String query="select * from user1 where email=? and password=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				u=new User();
				u.setUserid(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPhone(rs.getLong(4));	
				u.setPassword(rs.getString(5));
				u.setAddress(rs.getString(6));
				u.setDate(rs.getString(7));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
	@Override
	public ArrayList<User> getUser() {
		String query="select * from user1 where user_id!=1";
		ArrayList<User> list=new ArrayList<>();
		User u=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				u=new User();
				u.setUserid(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPhone(rs.getLong(4));
				u.setPassword(rs.getString(5));
				u.setAddress(rs.getString(6));
				u.setDate(rs.getString(7));
                list.add(u);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public ArrayList<User> searchUser(String name, String sortBy) {
		String query = "SELECT * FROM user1 where user_id!=1 ";

	   
	    if (name != null && !name.trim().isEmpty()) {
	        query += " and name LIKE ?";
	    }

	    
	    if ("recent".equals(sortBy)) {
	        query += " ORDER BY user_id DESC"; // Newest first
	    } else if ("previous".equals(sortBy)) {
	        query += " ORDER BY user_id ASC"; // Oldest first
	    }

	    ArrayList<User> list = new ArrayList<>();
	    try {
	        PreparedStatement ps = con.prepareStatement(query);

	       
	        if (name != null && !name.trim().isEmpty()) {
	            ps.setString(1, name + "%");
	        }

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            User u = new User();
	            u.setUserid(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPhone(rs.getLong(4));
				u.setPassword(rs.getString(5));
				u.setAddress(rs.getString(6));
				u.setDate(rs.getString(7));
                list.add(u);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	
	@Override
	public boolean updateUser(User u) {
		int i=0;
		String query="update user set name=?, phone=?, email=?, address=?, password=? where user_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, u.getUsername());
			ps.setLong(2, u.getPhone());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getAddress());
			ps.setString(5,u.getPassword());
			ps.setInt(6 , u.getUserid());
			 i=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
        return false;
	}
}
}