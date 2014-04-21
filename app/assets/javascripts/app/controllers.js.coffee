window.app = angular.module('myApp.controllers', [])

app.controller 'ResponseCtrl', ($scope, ResponseService) ->
  ResponseService.getResponse(window.responseId).then (d) -> $scope.response = d.response

app.controller 'ResultsCtrl', ($scope, ResponseService) ->
  $scope.reloadAnswers = (responseId) ->
    ResponseService.getAnswers(responseId).then (d) -> 
      $scope.answers = d.answers

app.controller 'QuestionCtrl', ($scope, $resource) ->
  Answer = $resource('/api/answers/:answerId.json', {answerId: '@id'})

  $scope.saveAnswer = (response, question, choice, selected) ->
    # Answer.save({}, 
    #   response_id: response.id
    #   question_id: question.id
    #   choice_id: choice.id
    #   value: choice.selected
    # , (r) ->
    #   console.log('success')
    # , (r) ->
    #   console.log('unsuccessful')
    # )

app.controller 'AnswerCtrl', ($scope, AnswerHelper) ->
  $scope.choice.currentAnswer = AnswerHelper.findAnswer($scope.response, $scope.choice)
