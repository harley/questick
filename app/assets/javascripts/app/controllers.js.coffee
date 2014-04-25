app = angular.module('myApp.controllers', [])

app.controller 'ResponseCtrl', ($scope, ResponseService) ->
  ResponseService.getResponse(window.responseId).then (d) -> $scope.response = d.response

app.controller 'AnswerCtrl', ($scope, AnswerHelper) ->
  $scope.choice.currentAnswer = AnswerHelper.findAnswer($scope.response, $scope.choice)
  $scope.clearOtherChoices = (question, choice)->
    angular.forEach question.choices, (c, index) ->
      if c.text != choice.text
        c.currentAnswer.value = null
        c.currentAnswer.other = null
      else
        choice.currentAnswer.value = choice.text
