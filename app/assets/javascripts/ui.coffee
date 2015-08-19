class UI
  constructor: ->

  active: ->
    @mouseOverListIcon()
    @enterKeyactivation()
    @popUpTrailer()

  mouseOverListIcon: ->
    $(".add-list-btn").hover(
      => $(".add-list-btn").append( @listComment() ),
      -> $(this).find("span:last").remove()
    )

  enterKeyactivation: ->
    $("[data-id='searchWord']").keyup (e) ->
      $("[data-id='searchBTN']").click() if(e.keyCode == 13)

  popUpTrailer: ->
    $("[data-id='trailer']").magnificPopup
      items:
        src: $("[data-id='trailer']").data("url")
      type: 'iframe'

  listComment: ->
    "<span class='list'>#{@listIconAction()} My List</span>"

  listIconAction: ->
    $(".add-list-btn .glyphicon").data("id").replace("-", " ")

  confirmAdditionIcon: ->
    '<span class="glyphicon glyphicon-ok-sign" data-id="Remove-From" aria-hidden="true"></span>'

  errorMessage: ->
    'Sorry, Something worng. Try Again'

window.UI = UI
