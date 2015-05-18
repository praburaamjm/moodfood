myApp.controller('MoodCtrl',function($scope,$http){
	url = 'http://192.168.0.7:3000/moods.json';
	$http.get(url).success(function(response){
		$scope.allmoods = response;
	});

	$scope.showSubmoods = function(mood){
		console.log(mood.submoods);
		$scope.submoods = mood.submoods;
	}

	$scope.showRestaurants = function(){
		url = 'http://192.168.0.7:3000/restaurants.json';
		$http.get(url).success(function(response){
			console.log(response);
			$scope.restaurants = response;
		});
	}
});