app = angular.module('myApp.directives', [])

app.directive 'autosave', ($timeout, ResponseService) ->
  return {
    restrict: 'A',
    link: (scope, element, attrs) ->
      duration = parseInt(attrs.autosave)
      if isNaN(duration) or duration < 100
        duration = 500

      saveUpdates = -> ResponseService.saveResponse(scope.response)

      timeoutPromise = null
      debounceSave = (newVal, oldVal) ->
        if newVal != oldVal
          if (timeoutPromise)
            $timeout.cancel(timeoutPromise)
          timeoutPromise = $timeout(saveUpdates, duration)

      dummySave = -> console.log "dummy save"

      scope.$watch((-> JSON.stringify(scope.response?.answer_bucket)), debounceSave)
  }

app.directive 'checkableInput', ->
  return {
    restrict: 'A'
    scope:
      choice: '='
      question: '='
      clearSiblings: '&'
    link: (scope, element, attrs) ->
      # using jQuery coz element.find doesn't work
      if scope.choice?.allow_text
        $e = $(element)
        # focus on text box --> ticking the radio/checkbox
        $e.on 'focus', ':text', ->
          # tell angular to update radio/checkbox
          scope.$apply ->
            scope.choice.currentAnswer.value = scope.choice.text
          # in the case of radio, clear other radio siblings
          if attrs.clearSiblings
            scope.clearSiblings({question: scope.question, choice: scope.choice})

        # uncheck checkbox --> clear text box
        $e.find(':checkbox').on 'change', ->
          unless $(@).is(':checked')
            scope.choice.currentAnswer.other = null

        # click on siblings --> clear text box
        $e.siblings().find(':radio').on 'change', ->
          if $(@).is(':checked')
            scope.choice.currentAnswer.other = null
  }
