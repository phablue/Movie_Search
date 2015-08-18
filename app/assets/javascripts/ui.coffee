class UI
  constructor: ->

  active: ->

  addIconDisplay: ->
    $("[data-id='addList']").hover(
      -> $(this).append( $("<span class='add-list'>Add To My List</span>") ),
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

window.UI = UI
