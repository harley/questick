app = angular.module('myApp.services', [])

app.factory 'ResponseService', ($http, $q, $resource) ->
  Response = $resource('/api/responses/:responseId.json', 
    { responseId: '@id' }, 
    { 
      updateAnswers: {
        method: 'PUT', url: '/api/responses/:responseId/update_answers'
      }
    }
  )

  service = 
    getResponse: (responseId) ->
      d = $q.defer()
      url = '/api/responses' + '/' + responseId
      $http.get(url).then (data, status) ->
        if data.status == 200
          d.resolve data.data
        else
          d.reject data
      d.promise

    getAnswers: (responseId) ->
      d = $q.defer()
      url = '/api/responses' + '/' + responseId + '/answers'
      $http.get(url).then (data, status) ->
        if data.status == 200
          d.resolve data.data
        else
          d.reject data
      d.promise

    saveResponse: (response) ->
      console.log('inside ResponseService.saveResponse')
      Response.updateAnswers({id: response.id, bucket: response.answer_bucket})

  service

app.factory 'AnswerHelper', ->
  helper = 
    answerKey: (response, choice) ->
      ['a', response.id, choice.id].join('-')

    findAnswer: (response, choice) ->
       key = @answerKey(response, choice)
       response.answer_bucket[key]

  return helper

