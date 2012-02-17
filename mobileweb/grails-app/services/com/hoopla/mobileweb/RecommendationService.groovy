package com.hoopla.mobileweb

import groovyx.net.http.RESTClient
import groovy.util.slurpersupport.GPathResult
import static groovyx.net.http.ContentType.URLENC

class RecommendationService {
	def grailsApplication

    def queryDefault() {
		try {		
			def hoopla = new RESTClient( grailsApplication.config.hoopla.engine.url )
			response = hoopla.get( path : 'hoopla-data?user_id=${' )
		} catch( ex ) { assert ex.response.status == 404 }
    }
}
