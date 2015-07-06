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

    it "Call getJSON function, when search word have matching data ", ->
      data = [{ movie: "frozon" }, { movie: "Starwars" }]
      mockGetjson = spyOn($, "getJSON").and.returnValue({ done: (e) -> e(data) })

      @search.searching()

      expect(mockGetjson).toHaveBeenCalled()

    it "Alerts error message, when the search word characters is less than 2", ->
      searchWord = $("[data-id='searchWord']").val("S")
      mockAlert = spyOn(window, "alert")

      @search.searching()

      expect(mockAlert).toHaveBeenCalled()


