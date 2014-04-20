app = angular.module('myApp.services', [])

app.factory 'ResponseService', ($http, $q) ->
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
  service
