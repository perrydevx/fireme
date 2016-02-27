package com.fireme

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RecruiterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Recruiter.list(params), model:[recruiterCount: Recruiter.count()]
    }

    def show(Recruiter recruiter) {
        respond recruiter
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(Recruiter recruiter) {
        if (recruiter == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (recruiter.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond recruiter.errors, view:'create'
            return
        }

        recruiter.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'recruiter.label', default: 'Recruiter'), recruiter.id])
                redirect recruiter
            }
            '*' { respond recruiter, [status: CREATED] }
        }
    }

    def edit(Recruiter recruiter) {
        respond recruiter
    }

    @Transactional
    def update(Recruiter recruiter) {
        if (recruiter == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (recruiter.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond recruiter.errors, view:'edit'
            return
        }

        recruiter.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'recruiter.label', default: 'Recruiter'), recruiter.id])
                redirect recruiter
            }
            '*'{ respond recruiter, [status: OK] }
        }
    }

    @Transactional
    def delete(Recruiter recruiter) {

        if (recruiter == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        recruiter.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'recruiter.label', default: 'Recruiter'), recruiter.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'recruiter.label', default: 'Recruiter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
