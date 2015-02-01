'use strict';

var mainCtrl = angular.module('mainCtrl', []);

mainCtrl.controller('postIndexCtrl', ['$scope', '$window', '$http',
  function($scope, $window, $http) {
    getPosts(2);

    // ajax infinite loading
    function getPosts(page) {
      $http({
        method : 'GET',
        url : '/api/v1/posts',
        params: {
          'page': page,
          'limit': 10,
        },
      }).success(function(res) {
        $scope.Posts = res['posts'];
        console.log($scope.Posts);
      }).error(function() {
        console.log('failed!');
      });
    };
  }
])
