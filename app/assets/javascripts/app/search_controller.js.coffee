@SearchController = ($scope, $resource) ->
  $scope.all_results = []
  $scope.all_searches = []

  $scope.sampleQueries = ->

    UserSearch = $resource("/users/results.json?query=" + $scope.query_text)
    Country = $resource("/countries/current_collection.json")

    $scope.all_countries = []
    $scope.user_query = []

    UserSearch.query((response) ->
      for u in response
        $scope.user_query.push(u)
    )

    Country.query((response) ->
      for c in response
        $scope.all_countries.push(c)
    )

  $scope.doQueries = ->
    Search = $resource("/search/results.json?query=" + $scope.query_text)

    Search.query((response) ->
      for c in response
        $scope.all_results.push(c)
    )

  $scope.do_search = ->
    $scope.doQueries()
