
var app = angular.module("instantSearch", []);


// app.factory('User', function($resource, $rootScope) {
//   return $resource('/users',{},{})
// });


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
				
			}

			else if(item.email.toLowerCase().indexOf(searchString) !== -1){
				result.push(item);
			}

		});

		return result;
	};

});

// The controller
// var json = gon.users;
 
// js = JSON.parse(json);

app.controller('InstantSearchController', ['$scope', '$http', function($scope, $http) {

	$http({method: 'GET', url: '/user-list', dataType: 'json', data: '', headers: {
        "Content-Type": "application/json"
    }}).
    success(function(data, status, headers, config) {
     	console.log("GETTING DEM USERS!")
      $scope.items = data;
      // when the response is available
    }).
    error(function(data, status, headers, config) {
      // called asynchronously if an error occurs
      // or server returns response with an error status.
    });
}]);

// function InstantSearchController($scope, User){

// 	// The data model. These items would normally be requested via AJAX,
// 	// but are hardcoded here for simplicity. See the next example for
// 	// tips on using AJAX.

// 	var getUsers = function() {
// 		User.query({}, function(data) {
// 			$scope.items = data;
// 		}, function(error) {
// 			$scope.error = error;
// 		})
// 	};

// 	getUsers();
	
// }