class Movies
  constructor: ->

  search: ->
    $("[data-id='searchBTN']").click =>
      window.location = "/result?q=#{@searchWord()}"

  searchWord: ->
    $("[data-id='searchWord']").val()

window.Movies = Movies
