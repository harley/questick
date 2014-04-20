window.app = angular.module('myApp.controllers', [])

app.controller 'HomeCtrl', ($scope, ResponseService) ->
  ResponseService.getResponse(window.responseId).then (d) -> $scope.response = d.response

app.controller 'ResultsCtrl', ($scope, ResponseService) ->
  $scope.reloadAnswers = (responseId) ->
    console.log 'reloadAnswers'
    ResponseService.getAnswers(responseId).then (d) -> 
      $scope.answers = d.answers

app.controller 'QuestionCtrl', ($scope, $resource) ->
  Answer = $resource('/api/answers/:answerId.json', {answerId: '@id'})

  $scope.saveAnswer = (response, question, choice) ->
    console.log "saving answer for ", response, question, choice
    Answer.save({}, 
      response_id: response.id
      question_id: question.id
      choice_id: choice.id
      value: choice.answer
    , (r) ->
      console.log('success')
    , (r) ->
      console.log('unsuccessful')
    )

