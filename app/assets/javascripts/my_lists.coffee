class MyList
  constructor: ->

  addIconDisplay: ->
    $("[data-id='addList']").hover(
      -> $(this).append( $("<span class='add-list'>Add My List</span>") ),
      -> $(this).find("span:last").remove()
    )

window.MyList = MyList
