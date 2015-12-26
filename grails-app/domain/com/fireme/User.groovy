package com.fireme

class User {

    String username
    String password
    String userEmail
    String firstName
    String lastName
    String userType
    Date birthdate

    static hasOne = [applicant:Applicant, recruiter:Recruiter]

    static mapping = {
        version false
    }
    static constraints = {
        username blank: false, maxSize: 30
        password blank: false, maxSize: 30
        firstName blank: false, maxSize: 30
        lastName blank: false, maxSize: 30
        userEmail blank: false, email: true, unique: true, maxSize: 360
        birthdate nullable: true, blank: true
        recruiter nullable: true
        applicant nullable: true
    }
}
