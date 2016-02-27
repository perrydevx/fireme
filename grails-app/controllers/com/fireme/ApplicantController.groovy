package com.fireme

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ApplicantController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Applicant.list(params), model:[applicantCount: Applicant.count()]
    }

    def show(Applicant applicant) {
        respond applicant
    }

    def create() {
        respond new Applicant(params)
    }

    @Transactional
    def save(Applicant applicant) {
        if (applicant == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (applicant.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond applicant.errors, view:'create'
            return
        }

        applicant.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'applicant.label', default: 'Applicant'), applicant.id])
                redirect applicant
            }
            '*' { respond applicant, [status: CREATED] }
        }
    }

    def edit(Applicant applicant) {
        respond applicant
    }

    @Transactional
    def update(Applicant applicant) {
        if (applicant == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (applicant.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond applicant.errors, view:'edit'
            return
        }

        applicant.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'applicant.label', default: 'Applicant'), applicant.id])
                redirect applicant
            }
            '*'{ respond applicant, [status: OK] }
        }
    }

    @Transactional
    def delete(Applicant applicant) {

        if (applicant == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        applicant.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'applicant.label', default: 'Applicant'), applicant.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicant.label', default: 'Applicant'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
