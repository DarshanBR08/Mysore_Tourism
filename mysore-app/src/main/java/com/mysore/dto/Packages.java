package com.mysore.dto;
import java.time.LocalDate;

public class Packages {
private int packageid;
private String packagename;
private String description;
private String category;
private double amount;
private int no_of_days;
private int no_of_nights;
private LocalDate startdate;
private LocalDate enddate;
private LocalDate lastdate;
private String packageimage;
public int getPackageid() {
	return packageid;
}
public void setPackageid(int packageid) {
	this.packageid = packageid;
}
public String getPackagename() {
	return packagename;
}
public void setPackagename(String packagename) {
	this.packagename = packagename;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public double getAmount() {
	return amount;
}
public void setAmount(double amount) {
	this.amount = amount;
}
public int getNo_of_days() {
	return no_of_days;
}
public void setNo_of_days(int no_of_days) {
	this.no_of_days = no_of_days;
}
public LocalDate getStartdate() {
	return startdate;
}
public void setStartdate(LocalDate startdate) {
	this.startdate = startdate;
}
public LocalDate getEnddate() {
	return enddate;
}
public void setEnddate(LocalDate enddate) {
	this.enddate = enddate;
}
public int getNo_of_nights() {
	return no_of_nights;
}
public void setNo_of_nights(int no_of_nights) {
	this.no_of_nights = no_of_nights;
}
public LocalDate getLastdate() {
	return lastdate;
}
public void setLastdate(LocalDate lastdate) {
	this.lastdate = lastdate;
}
public String getPackageimage() {
	return packageimage;
}
public void setPackageimage(String packageimage) {
	this.packageimage = packageimage;
}


}
