describe "Test Search Class", ->

  beforeEach ->
    @search = new Search
    affix('input[data-id="searchWord"][value="Hello"]')

  describe "Test 'searchWord' method", ->
    it "Return 'Hello', when search input box value is 'Hello'", ->
      expect(@search.searchWord()).toEqual "Hello"

  describe "Test 'searching' method", ->
    describe "Return the error message", ->
      it "When search word is empty", ->
        $("[data-id='searchWord']").val("")

        expect(@search.searching()).toEqual @search.errorMessage()

      it "When search word characters less than 2", ->
        searchWord = $("[data-id='searchWord']").val("H")

        expect(searchWord.val().length).toEqual 1
        expect(@search.searching()).toEqual @search.errorMessage()

      it "When search word ignore white space", ->
        searchWord = $("[data-id='searchWord']").val(" ")

        expect(searchWord.val().length).toEqual 1
        expect(@search.searching()).toEqual @search.errorMessage()

    it "Return search word, when search word more than 2 characters", ->
      searchWord = $("[data-id='searchWord']").val("Hi")

      expect(searchWord.val().length).toEqual 2
      expect(@search.searching()).toEqual searchWord.val()
