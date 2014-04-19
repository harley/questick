angular.module('myApp.controllers', []).controller('HomeCtrl', function($scope, ResponseService) {
  $scope.response = ResponseService.getResponse('2');
});
