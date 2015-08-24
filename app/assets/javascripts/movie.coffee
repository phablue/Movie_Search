class Movies
  constructor: (ui) ->
    @ui = ui

  search: ->
    $("[data-id='searchBTN']").click =>
      window.location = "/result?q=#{@ui.searchWord()}"

  addToMyList: ->
    $("[data-id='Add-To']").bind( "click", @requestAddList );

  removeFromMyList: (data) ->
    $("[data-id='Remove-From']").bind( "click", { list_id: data.id }, @requestRemoveList );

  requestAddList: =>
    $.post("/my-list", { movie_id: @movieID() }).done(@checkAdditionResult)

  requestRemoveList: (e) =>
    $.ajax(
      url: "/my-list",
      data: { list_id: e.data.list_id },
      type: "DELETE"
    ).done(@convertToAddListIcon)

  checkAdditionResult: (data) =>
    if data.status == 'unauth'
      window.location = '/sign-in'
    else if data.status == false
      alert(@ui.errorMessage())
    else
      @convertRemoveListIcon(data)

  convertRemoveListIcon: (data) ->
    $("[data-id='Add-To']").unbind( "click", @requestAddListID );
    @ui.changeMyListIcon("glyphicon-plus-sign", "glyphicon-ok-sign", "Remove-From")
    @removeFromMyList(data)

  convertToAddListIcon: ->
    @ui.changeMyListIcon("glyphicon-ok-sign", "glyphicon-plus-sign", "Add-To")
    $("[data-id='Add-To']").unbind( "click", @requestRemoveList );
    @addToMyList()

  movieID: ->
    $('.add-list-btn').data('movie-id')

window.Movies = Movies
