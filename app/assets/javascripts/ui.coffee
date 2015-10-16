class UI
  constructor: ->
    @movie = new Movies(this)

  enviroment: ->
    @movie.search()
    @movie.ranking()
    @popUpTrailer()
    @menu()
    @myListActive()

  myListActive: ->
    @mouseOverListIcon()
    @movie.addToMyList()
    @movie.removeFromMyList(@addedMovieListID())

  menu: ->
    @navMenu()
    @navSearchBox()
    @navSearchBoxClose()
    @accountMenu()
    @advancedSearch()

  navMenu: ->
    $("[data-id='navMenu']").click =>
      @toggleMenu('navMenu')

  navSearchBox: ->
    $("[data-id='search']").click =>
      @toggleMenu('search')

  navSearchBoxClose: ->
    $("[data-id='close-search']").click =>
      @toggleMenu('search')

  accountMenu: ->
    $("[data-id='accountMenu']").click =>
      @toggleMenu('accountMenu')
      $(".caret").toggleClass("unfold")

  advancedSearch: ->
    @selectBox()
    $("[data-id='options']").click =>
      @toggleMenu('options')

  popUpTrailer: ->
    $("[data-id='trailer']").magnificPopup
      items:
        src: $("[data-id='trailer']").data("url")
      type: 'iframe'

  changeMyListIcon: (remove, add, dataID) ->
    $('.add-list-btn .glyphicon').removeClass(remove).addClass(add)
    $(".#{add}").attr('data-id' , dataID)
    $('.list').hide()

  mouseOverListIcon: ->
    $(".add-list-btn").hover(
      => $(".add-list-btn").append( @listComment() ),
      -> $(this).find("span:last").remove())

  toggleMenu: (options) ->
    $("[data-id='fold-#{options}']").toggleClass('open')
    @changeMainMargin(options)
    $("[data-id='fold-#{options}']").slideToggle(200)


  changeMainMargin: (options) ->
    $("main").css("margin-top", @getMarginAmount(options))

  getMarginAmount: (options) ->
    if @checkMenuOpen(options)
      "+=#{$("[data-id='fold-#{options}']").height()}"
    else
      "-=#{$("[data-id='fold-#{options}']").height()}"

  checkMenuOpen: (options) ->
    $("[data-id='fold-#{options}']").hasClass('open')

  selectBox: ->
    $("[data-id='select']").select2
      maximumSelectionSize: 2

  invalidSearchWord: ->
    @searchWord().length < 2 || _.isNull(@searchWord())

  addedMovieListID: ->
    {id: $("[data-id='Remove-From']").data("list-id")}

  searchWord: ->
    $("[data-id='searchWord']").val()

  getText: (element) ->
    $(element).map ->
      $(this).text().toLowerCase()

  listComment: ->
    "<span class='list'>#{@listIconAction()} My List</span>"

  listIconAction: ->
    $(".add-list-btn span").attr("data-id").replace("-", " ")

  searchErrorMessage: ->
     "The search word must be more than 2 characters."

  addListErrorMessage: ->
    'Sorry, Something worng. Try Again'

window.UI = UI
