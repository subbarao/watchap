'use strict'

angular.module("ap7amApp").controller "MainCtrl", ["$scope", "$http", "$modal", ($scope, $http, $modal) ->
  dataurl = "http://gdata.youtube.com/feeds/api/users/tv9telugu/uploads?orderby=published&alt=json"
  regId = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
  $http.get(dataurl).success (data) ->
    $scope.vids = data.feed.entry
    angular.forEach $scope.vids, (video) ->
      match = video.link[0].href.match(regId)
      angular.extend video,
        youtubeId: match[2]



  $scope.movie = source: "http://www.youtube.com/watch?v=l0HFz3bbkiU"
  $scope.config =
    width: 740
    height: 380
    autoHide: false
    autoPlay: false
    responsive: true
    theme:
      url: "bower_components/videogular/app/styles/themes/default/videogular.css"
      playIcon: "&#xe000;"
      pauseIcon: "&#xe001;"
      volumeLevel3Icon: "&#xe002;"
      volumeLevel2Icon: "&#xe003;"
      volumeLevel1Icon: "&#xe004;"
      volumeLevel0Icon: "&#xe005;"
      muteIcon: "&#xe006;"
      enterFullScreenIcon: "&#xe007;"
      exitFullScreenIcon: "&#xe008;"

    plugins:
      poster:
        url: "assets/images/videogular.png"

  ModalInstanceCtrl = ["$scope", "$modalInstance", "videos", ($scope, $modalInstance, videos) ->
    $scope.videos = videos
    $scope.selectVideo = (video) ->
      $modalInstance.close video

    $scope.ok = ->
      $modalInstance.close $scope.selected

    $scope.cancel = ->
      $modalInstance.dismiss "cancel"
  ]
  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: "myModalContent.html"
      controller: ModalInstanceCtrl
      resolve:
        videos: ->
          $scope.vids
    )
    modalInstance.result.then ((selected) ->
      $scope.movie.source = selected.link[0].href
    ), ->
      $log.info "Modal dismissed at: " + new Date()
]
