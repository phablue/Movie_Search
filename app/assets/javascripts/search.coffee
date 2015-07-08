class Search
  constructor: ->
    @sys = new System
    @url = "/search"

  searchWord: ->
    $("[data-id='searchWord']").val()

  searching: ->
    keyWord = @sys.deleteWhiteSpace(@searchWord())

    if _.isEmpty(keyWord) || keyWord.length < 2
      return @sys.notice(@sys.searchWordErrorMessage())
    $.getJSON(@url, {q: @searchWord()}).done (data) ->
      data

window.Search = Search
