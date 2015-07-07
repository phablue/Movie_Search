describe "Test Search Class", ->
  searchWord = null

  beforeEach ->
    @search = new Search
    @system = new System
    searchWord = affix('input[data-id="searchWord"]')

  describe "Test 'searchWord' method", ->
    it "Return 'Hello', when search input box value is 'Hello'", ->
      searchWord.val("Hello")

      expect(@search.searchWord()).toEqual "Hello"

  describe "Test 'searching' method", ->
    describe "Alert error message", ->
      mockAlert = null

      beforeEach ->
        mockAlert = spyOn(window, "alert")

      it "When search word is empty", ->
        searchWord.val("")

        expect(@search.searchWord().length).toEqual 0

        @search.searching()

        expect(mockAlert).toHaveBeenCalledWith(@system.searchWordErrorMessage())

      it "When search word characters less than 2", ->
        searchWord.val("H")

        expect(@search.searchWord().length).toEqual 1

        @search.searching()

        expect(mockAlert).toHaveBeenCalledWith(@system.searchWordErrorMessage())

      it "When search word ignore white space", ->
        searchWord.val(" ")

        expect(@search.searchWord().length).toEqual 1

        @search.searching()

        expect(mockAlert).toHaveBeenCalledWith(@system.searchWordErrorMessage())

    describe "When the search word characters is more than 2", ->
      beforeEach ->
        searchWord.val("frozon")
        data = [{ movie: "frozon" }, { movie: "Starwars" }]
        @mockGetjson = spyOn($, "getJSON").and.returnValue({ done: (e) -> e(data) })

      it "Call getJSON function", ->
        @search.searching()

        expect(@mockGetjson).toHaveBeenCalled()
