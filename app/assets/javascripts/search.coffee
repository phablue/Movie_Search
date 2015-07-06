class Search
  constructor: ->
    @system = new System

  searchWord: ->
    $("[data-id='searchWord']").val()

  searching: ->
    searchWord = @searchWord().replace(/\s+/g, '')

    if _.isEmpty(searchWord) || searchWord.length < 2
      return @system.notice(@system.searchWordErrorMessage())
    $.getJSON("/search", {key_word: @searchWord()}).done (data) ->
      data

window.Search = Search
