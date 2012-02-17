<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>title</title>
		<script type="text/javascript">
		// When map page opens get location and display map
		$(document).ready( function() {
			if(navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position){
					getHoopla(position.coords.latitude,position.coords.longitude);
				});
			}
		});
		
		function getHoopla(lat,lon) {
			var url = "${createLink(controller: 'recommendation', action: 'lookup', params: [user_id:user_id])}"
			url += "&lat=" + lat;
			url += "&lon=" + lon;
			$("#results").load(url, function( response, status, xhr ) {
				if( status == "error" ) {
					$("#results").html("An error has occurred");
				} else {
					$(document).page();
				}
			});
		}

		</script>
	</head>
	<body data-id="title" data-nobackbtn="true">

		<content tag="buttons">
			<a href="#filter" data-role="button">
				Filter
			</a>
			<a style="align: right;" href="#prefs" data-role="button" data-icon="gear">
				Prefs
			</a>
		</content>
		<content tag="content">
			<div id="results">
				<p> Loading Recommendations... </p>
			</div>
		</content>
	</body>
</html>
