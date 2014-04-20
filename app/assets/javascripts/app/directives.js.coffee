app = angular.module('myApp.directives', [])
app.directive 'hasAnswer', ->
  console.log 'load hasAnswer'

  return {
    restrict: 'AE',
    controller: ($scope) ->
      answerKey = (response, choice) ->
        ['a', response.id, choice.id].join('-')

      findAnswer = (response, choice) ->
        key = answerKey(response, choice)
        response.answer_bucket[key]

      $scope.updateRadios = (question, choice) ->
        angular.forEach question.choices, (choice, index) ->
          # reset other anothers
          a = findAnswer($scope.response, choice)
          a.value = null

        currentAnswer = findAnswer($scope.response, choice)
        currentAnswer.value = question.selected_value

      $scope.updateCheckboxes = (choice) ->
        a = findAnswer($scope.response, choice)
        a.value = if choice.selected then choice.text else null

    link: (scope, element, attrs) ->
  }
