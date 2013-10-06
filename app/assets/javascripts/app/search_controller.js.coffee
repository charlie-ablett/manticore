@SearchController = ($scope, $resource) ->
  $scope.title = "SAMPLE TEXT"

  $scope.search = []
  $scope.all_results = []
  $scope.all_searches = []

  $scope.all_countries = []
  $scope.user_query = []

  $scope.searchText = ""

  Query = $resource("/search?query=" + queryBox.text)
  Country = $resource("/countries/current_collection.json")
  User = $resource("/users/results.json")

  Country.query((response) ->
    for c in response
      $scope.all_countries.push(c)
  )

  User.query((response) ->
    for x in response
      $scope.user_query.push(x)
  )
