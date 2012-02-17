class UrlMappings {

	static mappings = {
		"/$controller/$type/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/recommendation/$action"{
			controller = 'recommendation'
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
