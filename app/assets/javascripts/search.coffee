class Search
  constructor: ->
    @sys = new System

  searchWord: ->
    $("[data-id='searchWord']").val()

  searching: ->
    searchWord = @sys.deleteWhiteSpace(@searchWord())

    if _.isEmpty(searchWord) || searchWord.length < 2
      return @sys.notice(@sys.searchWordErrorMessage())
    $.getJSON("/search", {key_word: @searchWord()}).done (data) ->
      data

window.Search = Search
