package com.hoopla.mobileweb



import org.junit.*
import grails.test.mixin.*

@TestFor(RecommendationController)
@Mock(Recommendation)
class RecommendationControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/recommendation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.recommendationInstanceList.size() == 0
        assert model.recommendationInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.recommendationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.recommendationInstance != null
        assert view == '/recommendation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/recommendation/show/1'
        assert controller.flash.message != null
        assert Recommendation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/recommendation/list'


        populateValidParams(params)
        def recommendation = new Recommendation(params)

        assert recommendation.save() != null

        params.id = recommendation.id

        def model = controller.show()

        assert model.recommendationInstance == recommendation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/recommendation/list'


        populateValidParams(params)
        def recommendation = new Recommendation(params)

        assert recommendation.save() != null

        params.id = recommendation.id

        def model = controller.edit()

        assert model.recommendationInstance == recommendation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/recommendation/list'

        response.reset()


        populateValidParams(params)
        def recommendation = new Recommendation(params)

        assert recommendation.save() != null

        // test invalid parameters in update
        params.id = recommendation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/recommendation/edit"
        assert model.recommendationInstance != null

        recommendation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/recommendation/show/$recommendation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        recommendation.clearErrors()

        populateValidParams(params)
        params.id = recommendation.id
        params.version = -1
        controller.update()

        assert view == "/recommendation/edit"
        assert model.recommendationInstance != null
        assert model.recommendationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/recommendation/list'

        response.reset()

        populateValidParams(params)
        def recommendation = new Recommendation(params)

        assert recommendation.save() != null
        assert Recommendation.count() == 1

        params.id = recommendation.id

        controller.delete()

        assert Recommendation.count() == 0
        assert Recommendation.get(recommendation.id) == null
        assert response.redirectedUrl == '/recommendation/list'
    }
}
