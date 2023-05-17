package com.login.model;

public class StudentInfo {
    private String fullname;
    private String registration;
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getRegistration() {
		return registration;
	}
	public void setRegistration(String registration) {
		this.registration = registration;
	}
	@Override
	public String toString() {
		return "StudentInfo [fullname=" + fullname + ", registration=" + registration + "]";
	}
    
}
