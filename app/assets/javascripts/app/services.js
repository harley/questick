angular.module('myApp.services',[]).factory('ResponseService', function($http, $q) {
  var service = {
    getResponse: function(responseId) {
      var d = $q.defer();
      $http.get('/api/responses').then(function(data, status){
        if (data.status == 200) {
          console.log('data', data);
          d.resolve(data.data.responseData);
        }
        else {
          d.reject(data);
        }
      });

      return d.promise;
    }
  };
  return service;
});


