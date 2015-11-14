$(document).ready ->
 
  $('#search_movie').typeahead
    name: "movie",
    remote: "/movies/autocomplete?query=%QUERY"
