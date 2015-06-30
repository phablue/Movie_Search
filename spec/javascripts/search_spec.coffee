describe "Test Search Class", ->
  beforeEach ->
    @search = new Search
    affix('input[data-id="searchWord"][value="Hello"]')

  it "Return 'Hello', when search input box value is 'Hello'", ->
    expect(@search.searchWord()).toEqual "Hello"

  it "Return error message, when search word is empty", ->
    $("[data-id='searchWord']").val("")

    expect(@search.searching()).toEqual @search.errorMessage()

  it "Return error message, when search word less than 2 characters", ->
    $("[data-id='searchWord']").val("H")

    expect(@search.searching()).toEqual @search.errorMessage()

  it "Return error message, when search word ignore white space", ->
    searchWord = $("[data-id='searchWord']").val(" ")

    expect(searchWord.length).toEqual 1
    expect(@search.searching()).toEqual @search.errorMessage()