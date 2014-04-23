app = angular.module('myApp.directives', [])
app.directive 'hasAnswer', ->
  return {
    restrict: 'AE',
    controller: ($scope, AnswerHelper) ->
      $scope.clearOtherChoices = (question, choice, currentAnswer)->
        angular.forEach question.choices, (c, index) ->
          if c.text != choice.text
            c.currentAnswer.value = null
          else
            currentAnswer.value = choice.text

    link: (scope, element, attrs) ->
  }

app.directive 'autosave', ($timeout, ResponseService) ->
  return {
    restrict: 'A',
    link: (scope, element, attrs) ->
      saveUpdates = ->
        ResponseService.saveResponse(scope.response)

      timeoutPromise = null
      debounceSave = (newVal, oldVal) ->
        # console.log "debounceSave", newVal, oldVal
        if newVal != oldVal
          if (timeoutPromise)
            $timeout.cancel(timeoutPromise)
          timeoutPromise = $timeout(saveUpdates, 500)

      dummySave = -> console.log "dummy save"

      scope.$watch((-> JSON.stringify(scope.response?.answer_bucket)), debounceSave)
  }

