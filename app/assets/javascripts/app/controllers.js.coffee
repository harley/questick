window.app = angular.module('myApp.controllers', [])

app.controller 'ResponseCtrl', ($scope, ResponseService) ->
  ResponseService.getResponse(window.responseId).then (d) -> $scope.response = d.response

app.controller 'QuestionCtrl', ($scope, $resource) ->
  Answer = $resource('/api/answers/:answerId.json', {answerId: '@id'})

app.controller 'AnswerCtrl', ($scope, AnswerHelper) ->
  $scope.choice.currentAnswer = AnswerHelper.findAnswer($scope.response, $scope.choice)
