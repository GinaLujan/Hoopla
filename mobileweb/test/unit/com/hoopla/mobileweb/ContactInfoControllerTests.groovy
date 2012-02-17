package com.hoopla.mobileweb



import org.junit.*
import grails.test.mixin.*

@TestFor(ContactInfoController)
@Mock(ContactInfo)
class ContactInfoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contactInfo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contactInfoInstanceList.size() == 0
        assert model.contactInfoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.contactInfoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contactInfoInstance != null
        assert view == '/contactInfo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contactInfo/show/1'
        assert controller.flash.message != null
        assert ContactInfo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contactInfo/list'


        populateValidParams(params)
        def contactInfo = new ContactInfo(params)

        assert contactInfo.save() != null

        params.id = contactInfo.id

        def model = controller.show()

        assert model.contactInfoInstance == contactInfo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contactInfo/list'


        populateValidParams(params)
        def contactInfo = new ContactInfo(params)

        assert contactInfo.save() != null

        params.id = contactInfo.id

        def model = controller.edit()

        assert model.contactInfoInstance == contactInfo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contactInfo/list'

        response.reset()


        populateValidParams(params)
        def contactInfo = new ContactInfo(params)

        assert contactInfo.save() != null

        // test invalid parameters in update
        params.id = contactInfo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contactInfo/edit"
        assert model.contactInfoInstance != null

        contactInfo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contactInfo/show/$contactInfo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contactInfo.clearErrors()

        populateValidParams(params)
        params.id = contactInfo.id
        params.version = -1
        controller.update()

        assert view == "/contactInfo/edit"
        assert model.contactInfoInstance != null
        assert model.contactInfoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contactInfo/list'

        response.reset()

        populateValidParams(params)
        def contactInfo = new ContactInfo(params)

        assert contactInfo.save() != null
        assert ContactInfo.count() == 1

        params.id = contactInfo.id

        controller.delete()

        assert ContactInfo.count() == 0
        assert ContactInfo.get(contactInfo.id) == null
        assert response.redirectedUrl == '/contactInfo/list'
    }
}
