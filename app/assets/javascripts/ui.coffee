class UI
  constructor: ->
    @movie = new Movies(this)

  enviroment: ->
    @movie.search()
    @movie.ranking()
    @popUpTrailer()
    @advancedSearch()
    @userMenu()
    @myListActive()
    @enterKeyactivation()

  myListActive: ->
    @mouseOverListIcon()
    @movie.addToMyList()
    @movie.removeFromMyList(@addedMovieListID())

  userMenu: ->
    $("[data-id='userMenu']").click =>
      @dropDownMenu('userMenu')

  advancedSearch: ->
    @selectBox()
    $("[data-id='options']").click =>
      @dropDownMenu('options')

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

  dropDownMenu: (options) ->
    $("[data-id='dropDown-#{options}']").toggleClass("open")
    $("[data-id='dropDown-#{options}']").mouseleave ->
      $("[data-id='dropDown-#{options}']").toggleClass("open")

  selectBox: ->
    $("[data-id='select']").select2(
      maximumSelectionSize: 2
    )

  enterKeyactivation: ->
    $("[data-id='searchWord']").keyup (e) ->
      $("[data-id='searchBTN']").click() if(e.keyCode == 13)

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
