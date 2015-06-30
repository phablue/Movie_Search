class Search
  constructor: ->

  searchWord: ->
    $("[data-id='searchWord']").val()

  searching: ->
    if _.isNull(searchWord())

window.Search = Search
