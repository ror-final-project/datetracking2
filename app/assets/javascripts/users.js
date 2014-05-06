
var app = angular.module("instantSearch", []);

// Create the instant search filter

app.filter('searchFor', function(){

	// All filters must return a function. The first parameter
	// is the data that is to be filtered, and the second is an
	// argument that may be passed with a colon (searchFor:searchString)

	return function(arr, searchString){

		if(!searchString){
			return arr;
		}

		var result = [];

		searchString = searchString.toLowerCase();

		// Using the forEach helper method to loop through the array
		angular.forEach(arr, function(item){

			if(item.fname.toLowerCase().indexOf(searchString) !== -1){
				result.push(item);
				
			}

			else if(item.lname.toLowerCase().indexOf(searchString) !== -1){
				result.push(item);
				debugger
			}

			else if(item.email.toLowerCase().indexOf(searchString) !== -1){
				result.push(item);
			}

		});

		return result;
	};

});

// The controller
var json = gon.users;
 
js = JSON.parse(json);

function InstantSearchController($scope ){

	// The data model. These items would normally be requested via AJAX,
	// but are hardcoded here for simplicity. See the next example for
	// tips on using AJAX.

	$scope.items = js;
	
}