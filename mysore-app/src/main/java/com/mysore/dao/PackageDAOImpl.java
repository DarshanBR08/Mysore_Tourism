package com.mysore.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysore.connector.connector;
import com.mysore.dto.Packages;


public class PackageDAOImpl implements PackageDAO{
	 private Connection con;
	    
	    public PackageDAOImpl() {
	    	this.con=connector.requestConnection();
	    }
	@Override
	public boolean insertpackage(Packages p) {
		int i=0;
		String query="insert into package values(0,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, p.getPackagename());
			ps.setString(2, p.getDescription());
			ps.setString(3,p.getCategory());
			ps.setDouble(4,p.getAmount());
			ps.setInt(5,p.getNo_of_days());
			ps.setInt(6,p.getNo_of_nights());
			ps.setDate(7, Date.valueOf(p.getStartdate()));
			ps.setDate(8, Date.valueOf(p.getEnddate()));
			ps.setDate(9, Date.valueOf(p.getLastdate()));
			ps.setString(10,p.getPackageimage());
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
	public ArrayList<Packages> getPackages() {
		String query="select * from package";
		ArrayList<Packages> list=new ArrayList<>();
		Packages p=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p=new Packages();
				p.setPackageid(rs.getInt(1));
				 p.setPackagename(rs.getString(2));
				 p.setDescription(rs.getString(3));
				p.setCategory(rs.getString(4));
				p.setAmount(rs.getInt(5));
				p.setNo_of_days(rs.getInt(6));
				p.setNo_of_nights(rs.getInt(7));
				p.setStartdate(rs.getDate(8) != null ? rs.getDate(8).toLocalDate() : null);
	            p.setEnddate(rs.getDate(9) != null ? rs.getDate(9).toLocalDate() : null);
	            p.setLastdate(rs.getDate(10) != null ? rs.getDate(10).toLocalDate() : null);
	            p.setPackageimage(rs.getString(11));
                list.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public Packages getPackages(String id) {
		Packages p=null;
		String query="select * from package where package_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, id);
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				p=new Packages();
				p.setPackageid(rs.getInt(1));
				 p.setPackagename(rs.getString(2));
				 p.setDescription(rs.getString(3));
				p.setCategory(rs.getString(4));
				p.setAmount(rs.getInt(5));
				p.setNo_of_days(rs.getInt(6));
				p.setNo_of_nights(rs.getInt(7));
				p.setStartdate(rs.getDate(8) != null ? rs.getDate(8).toLocalDate() : null);
	            p.setEnddate(rs.getDate(9) != null ? rs.getDate(9).toLocalDate() : null);
	            p.setLastdate(rs.getDate(10) != null ? rs.getDate(10).toLocalDate() : null);
	            p.setPackageimage(rs.getString(11));
	            return p;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}
	

}
