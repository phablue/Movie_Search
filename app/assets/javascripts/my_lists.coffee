class MyList
  constructor: ->

  addIconDisplay: ->
    $("[data-id='addList']").hover(
      -> $(this).append( $("<span class='add-list'>Add To My List</span>") ),
      -> $(this).find("span:last").remove()
    )

window.MyList = MyList
