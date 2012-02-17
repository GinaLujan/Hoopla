package com.hoopla.mobileweb

import com.hoopla.mobileweb.RecommendationService

class RecommendationController {

    static allowedMethods = []

	def RecommendationService recommendationService

    def index() {
        //redirect(action: "query", params: params)
    }

    def query() {
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[recommendationList: recommendationService.queryDefault()]
    }

	def lookup() {
		g.render( template:"/recommendation/lookup", model: recommendationService.queryDefault())
	}
}
