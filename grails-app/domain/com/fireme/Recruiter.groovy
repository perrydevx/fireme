package com.fireme

class Recruiter {

    String orgName
    String orgPhone
    User user

    static mapping = {
        version false
    }

    static constraints = {
        user nullable: true
    }

	@Override
	public String toString() {
		return "Recruiter [user=" + user + "]";
	}	
	
}
