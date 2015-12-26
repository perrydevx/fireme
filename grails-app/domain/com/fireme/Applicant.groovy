package com.fireme

class Applicant {

    String currentEmployment
    String accountVisibility
    Integer noticePeriodDays
    String primarySkill
    String resume
    User user

    static hasMany = [appliations:Application]

    static mapping = {
        version false
    }

    static constraints = {
        currentEmployment nullable: true, blank: true
        accountVisibility nullable: true, blank: true
        noticePeriodDays nullable: true, blank: true
        primarySkill nullable: true, blank: true
        resume nullable: true, blank: true
        user nullable: true
    }
}
