package com.hoopla.mobileweb

import org.springframework.dao.DataIntegrityViolationException

class ContactInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contactInfoInstanceList: ContactInfo.list(params), contactInfoInstanceTotal: ContactInfo.count()]
    }

    def create() {
        [contactInfoInstance: new ContactInfo(params)]
    }

    def save() {
        def contactInfoInstance = new ContactInfo(params)
        if (!contactInfoInstance.save(flush: true)) {
            render(view: "create", model: [contactInfoInstance: contactInfoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), contactInfoInstance.id])
        redirect(action: "show", id: contactInfoInstance.id)
    }

    def show() {
        def contactInfoInstance = ContactInfo.get(params.id)
        if (!contactInfoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), params.id])
            redirect(action: "list")
            return
        }

        [contactInfoInstance: contactInfoInstance]
    }

    def edit() {
        def contactInfoInstance = ContactInfo.get(params.id)
        if (!contactInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), params.id])
            redirect(action: "list")
            return
        }

        [contactInfoInstance: contactInfoInstance]
    }

    def update() {
        def contactInfoInstance = ContactInfo.get(params.id)
        if (!contactInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (contactInfoInstance.version > version) {
                contactInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contactInfo.label', default: 'ContactInfo')] as Object[],
                          "Another user has updated this ContactInfo while you were editing")
                render(view: "edit", model: [contactInfoInstance: contactInfoInstance])
                return
            }
        }

        contactInfoInstance.properties = params

        if (!contactInfoInstance.save(flush: true)) {
            render(view: "edit", model: [contactInfoInstance: contactInfoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), contactInfoInstance.id])
        redirect(action: "show", id: contactInfoInstance.id)
    }

    def delete() {
        def contactInfoInstance = ContactInfo.get(params.id)
        if (!contactInfoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            contactInfoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contactInfo.label', default: 'ContactInfo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
