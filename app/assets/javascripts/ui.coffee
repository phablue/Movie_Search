class UI
  constructor: ->
    @movie = new Movies(this)

  enviroment: ->
    @mouseOverListIcon()
    @enterKeyactivation()
    @popUpTrailer()
    @movie.search()
    @movie.addToMyList()

  mouseOverListIcon: ->
    $(".add-list-btn").hover(
      => $(".add-list-btn").append( @listComment() ),
      -> $(this).find("span:last").remove())

  enterKeyactivation: ->
    $("[data-id='searchWord']").keyup (e) ->
      $("[data-id='searchBTN']").click() if(e.keyCode == 13)

  popUpTrailer: ->
    $("[data-id='trailer']").magnificPopup
      items:
        src: $("[data-id='trailer']").data("url")
      type: 'iframe'

  changeMyListIcon: (remove, add, dataID) ->
    $('.add-list-btn .glyphicon').removeClass(remove).addClass(add)
    $(".#{add}").attr('data-id' , dataID)
    $('.list').hide()

  invalidSearchWord: ->
    @searchWord().length < 2 || _.isNull(@searchWord())

  searchWord: ->
    $("[data-id='searchWord']").val()

  listComment: ->
    "<span class='list'>#{@listIconAction()} My List</span>"

  listIconAction: ->
    $(".add-list-btn span").attr("data-id").replace("-", " ")

  searchErrorMessage: ->
     "The search word must be more than 2 characters."

  AddListErrorMessage: ->
    'Sorry, Something worng. Try Again'

window.UI = UI
