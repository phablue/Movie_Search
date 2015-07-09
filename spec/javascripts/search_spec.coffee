describe "Test Search Class", ->
  search = null
  sys = null
  searchWord = null

  beforeEach ->
    search = new Search
    sys = new System
    affix('input[data-id="searchWord"] button[data-id="searchBTN"]')
    searchWord = $("[data-id='searchWord']")

  seachKeyWord = ->
    search.searching()
    $('[data-id="searchBTN"]').click()

  describe "Test 'searchWord' method", ->
    it "Return 'Hello', when search input box value is 'Hello'", ->
      searchWord.val("Hello")

      expect(search.searchWord()).toEqual "Hello"

  describe "Test 'searching' method", ->
    describe "Alert error message", ->
      beforeEach ->
        @mockAlert = spyOn(window, "alert")

      it "When search word is empty", ->
        searchWord.val("")

        expect(search.searchWord().length).toEqual 0

        seachKeyWord()

        expect(@mockAlert).toHaveBeenCalledWith(sys.searchWordErrorMessage())

      it "When search word characters less than 2", ->
        searchWord.val("H")

        expect(search.searchWord().length).toEqual 1

        seachKeyWord()

        expect(@mockAlert).toHaveBeenCalledWith(sys.searchWordErrorMessage())

      it "When search word ignore white space", ->
        searchWord.val(" ")

        expect(search.searchWord().length).toEqual 1

        seachKeyWord()

        expect(@mockAlert).toHaveBeenCalledWith(sys.searchWordErrorMessage())

    describe "When the search word characters is more than 2", ->
      beforeEach ->
        searchWord.val("frozon")
        @data = [{ movie: "frozon" }, { movie: "Starwars" }]

      it "Call getJSON function", ->
        mockGetjson = spyOn($, "getJSON").and.returnValue({ done: (e) -> e(@data) })

        seachKeyWord()

        expect(mockGetjson).toHaveBeenCalled()

      it "Return data, when requesting success", ->
        mockMatchingData = spyOn(search, "matchingData").and.returnValue(@data)

        fakeServer = sinon.fakeServer.create()
        fakeServer.respondWith("GET", search.url,
                              [200, { "Content-Type": "application/json" }, JSON.stringify(@data)])

        seachKeyWord()

        fakeServer.respond()

        expect(mockMatchingData).toHaveBeenCalled()

        fakeServer.restore()
