class Search
  constructor: ->

  searchWord: ->
    $("[data-id='searchWord']").val()

  searching: ->
    @enterKeyactivation()
    $("[data-id='searchBTN']").click =>
      window.location = "/search?q=#{@searchWord()}"

  enterKeyactivation: ->
    $("[data-id='searchWord']").keyup (e) ->
      $("[data-id='searchBTN']").click() if(e.keyCode == 13)

window.Search = Search
