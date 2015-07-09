class Search
  constructor: ->
    @sys = new System
    @url = "/search"

  searchWord: ->
    $("[data-id='searchWord']").val()

  searching: ->
    $('[data-id="searchBTN"]').click =>
      @searchResult()

  searchResult: ->
    if @availableSearchWord()
      @matchingData()
    else
      @errorMessage()

  availableSearchWord: ->
    keyWord = @sys.deleteWhiteSpace(@searchWord())
    keyWord.length >= 2

  matchingData: ->
    $.getJSON(@url, {q: @searchWord()}).done (data) ->
      data

  errorMessage: ->
    @sys.notice(@sys.searchWordErrorMessage())

window.Search = Search
