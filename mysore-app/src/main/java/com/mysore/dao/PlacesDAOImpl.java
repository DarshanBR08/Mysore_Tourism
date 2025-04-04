package com.mysore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysore.connector.connector;
import com.mysore.dto.Places;
import com.mysore.dto.User;

public class PlacesDAOImpl implements PlacesDAO{
	 private Connection con;
	    
	    public PlacesDAOImpl() {
	    	this.con=connector.requestConnection();
	    }
	@Override
	public boolean insertplaces(Places p) {
		int i=0;
		String query="insert into places values(0,?,?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, p.getPlacename());
			ps.setString(2, p.getPlacedescription());
			ps.setString(3,p.getPlaceimage());
			ps.setString(4,p.getPlacehistory());
			ps.setString(5,p.getPlacecategory());
			ps.setString(6,p.getPlacemonth());
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
	public ArrayList<Places> getPlaces() {
		String query="select * from places";
		ArrayList<Places> list=new ArrayList<>();
		Places p=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p=new Places();
				p.setPlaceid(rs.getInt(1));
				p.setPlacename(rs.getString(2));
				p.setPlacedescription(rs.getString(3));
				p.setPlaceimage(rs.getString(4));
				p.setPlacehistory(rs.getString(5));
				p.setPlacecategory(rs.getString(6));
				p.setPlacemonth(rs.getString(7));;
                list.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public ArrayList<Places> getFilteredPlacesList(String month, String category) {
		ArrayList<Places> placesList = new ArrayList<>();
	    String query = "SELECT * FROM places WHERE 1=1";
	    Places p = null;

	    // Filtering conditions
	    if (month != null && !month.equals("all")) {
	        query += " AND placesmonth = ?";
	    }
	    if (category != null && !category.equals("all")) {
	        query += " AND placescategory = ?";
	    }	    

	    try (PreparedStatement stmt = con.prepareStatement(query)) {
	        int index = 1;
	        if (month != null && !month.equals("all")) {
	            stmt.setString(index++, month);
	        }
	        if (category != null && !category.equals("all")) {
	            stmt.setString(index++, category);
	        }

	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	        	p=new Places();
				p.setPlaceid(rs.getInt(1));
				p.setPlacename(rs.getString(2));
				p.setPlacedescription(rs.getString(3));
				p.setPlaceimage(rs.getString(4));
				p.setPlacehistory(rs.getString(5));
				p.setPlacecategory(rs.getString(6));
				p.setPlacemonth(rs.getString(7));
				placesList.add(p);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return  placesList;
	}
	@Override
	public Places getPlaces(int placeid) {
		Places p=null;
		String query="select * from places where place_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, placeid);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				p=new Places();
				p.setPlaceid(rs.getInt(1));
				p.setPlacename(rs.getString(2));
				p.setPlacedescription(rs.getString(3));
				p.setPlaceimage(rs.getString(4));
				p.setPlacehistory(rs.getString(5));
				p.setPlacecategory(rs.getString(6));
				p.setPlacemonth(rs.getString(7));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

}
