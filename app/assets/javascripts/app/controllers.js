angular.module('myApp.controllers', []).controller('HomeCtrl', function($scope, ResponseService) {
  ResponseService.getResponse(window.responseId).then(function(d){$scope.response = d.response;});
});
