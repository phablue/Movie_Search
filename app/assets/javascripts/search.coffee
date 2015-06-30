class Search
  constructor: ->

  searchWord: ->
    $("[data-id='searchWord']").val()

  searching: ->
    searchWord = @searchWord().replace(/\s+/g, '')

    if _.isEmpty(searchWord) || searchWord.length < 2
      return @errorMessage()
    else
      
    

  errorMessage: ->
    "The search word must be more than 2 characters"

window.Search = Search
