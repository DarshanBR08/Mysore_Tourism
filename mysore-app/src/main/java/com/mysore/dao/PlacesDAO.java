package com.mysore.dao;

import java.util.ArrayList;

import com.mysore.dto.Places;

public interface PlacesDAO {
public boolean insertplaces(Places p);
public ArrayList<Places> getPlaces(); 
public ArrayList<Places> getFilteredPlacesList(String type, String category);
public Places getPlaces(int parameter);
}
