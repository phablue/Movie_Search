describe "Test Search Class", ->
  it "Return 'Hello', when search input box value is 'Hello'", ->
    affix('input[data-id="searchWord"][value="Hello"]')
    search = new Search

    expect(search.searchWord()).toEqual "Hello"
