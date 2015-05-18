myApp.controller('RestaurantCtrl',function($scope,$http){
	url = 'http://192.168.0.7:3000/restaurants.json';
	$http.get(url).success(function(response){
		$scope.restaurants = response;
	});
});