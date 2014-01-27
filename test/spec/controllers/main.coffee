'use strict'

describe 'Controller: MainCtrl', () ->

  # load the controller's module
  beforeEach module 'ap7amApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.feeds.length).toBe 6
