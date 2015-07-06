describe "Test Search Class", ->

  beforeEach ->
    @search = new Search
    @system = new System
    affix('input[data-id="searchWord"][value="Hello"]')
    @mockAlert = spyOn(window, "alert")

  describe "Test 'searchWord' method", ->
    it "Return 'Hello', when search input box value is 'Hello'", ->
      expect(@search.searchWord()).toEqual "Hello"

  describe "Test 'searching' method", ->
    describe "Alert error message", ->
      it "When search word is empty", ->
        searchWord = $("[data-id='searchWord']").val("")

        expect(searchWord.val().length).toEqual 0

        @search.searching()

        expect(@mockAlert).toHaveBeenCalledWith(@system.searchWordErrorMessage())

      it "When search word characters less than 2", ->
        searchWord = $("[data-id='searchWord']").val("H")

        expect(searchWord.val().length).toEqual 1

        @search.searching()

        expect(@mockAlert).toHaveBeenCalledWith(@system.searchWordErrorMessage())

      it "When search word ignore white space", ->
        searchWord = $("[data-id='searchWord']").val(" ")

        expect(searchWord.val().length).toEqual 1

        @search.searching()

        expect(@mockAlert).toHaveBeenCalledWith(@system.searchWordErrorMessage())

    describe "When the search word characters is more than 2", ->
      beforeEach ->
        data = [{ movie: "frozon" }, { movie: "Starwars" }]
        @mockGetjson = spyOn($, "getJSON").and.returnValue({ done: (e) -> e(data) })

      it "Call getJSON function", ->
        @search.searching()

        expect(@mockGetjson).toHaveBeenCalled()
