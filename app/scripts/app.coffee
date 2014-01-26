"use strict"
angular.module("ap7amApp", ["ngCookies", "ngResource", "ngSanitize", "ngRoute", "ui.bootstrap.modal", "ui.bootstrap.popover", "com.2fdevs.videogular", "com.2fdevs.videogular.plugins.controls", "com.2fdevs.videogular.plugins.poster", "com.2fdevs.videogular.plugins.imaads", "com.2fdevs.videogular.plugins.overlayplay", "com.2fdevs.videogular.plugins.buffering", "info.vietnamcode.nampnq.videogular.plugins.youtube"]).config ($routeProvider) ->
    $routeProvider.when("/",
        templateUrl: "views/main.html"
        controller: "MainCtrl"
      ).otherwise redirectTo: "/"

