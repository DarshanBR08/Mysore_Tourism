package com.mysore.dao;

import java.util.ArrayList;

import com.mysore.dto.Packages;



public interface PackageDAO {
	public boolean insertpackage(Packages p);
	public ArrayList<Packages> getPackages();
	public Packages getPackages(String id);

}
