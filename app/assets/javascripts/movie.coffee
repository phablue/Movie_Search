class Movies
  constructor: (ui) ->
    @ui = ui
    @list_id = null

  search: ->
    $("[data-id='searchBTN']").click =>
      @redirectResultPage()

  redirectResultPage: ->
    window.location = "/result?q=#{@searchWord()}"

  searchWord: ->
    $("[data-id='searchWord']").val()

  addToMyList: ->
    $("[data-id='Add-To']").bind( "click", @requestAddList );

  removeFromMyList: ->
    $("[data-id='Remove-From']").bind( "click", @requestRemoveList );

  requestAddList: =>
    $.post("/my-list", { movie_id: @movieID() }).done(@checkAdditionResult)

  requestRemoveList: =>
    $.ajax(
      url: "/my-list",
      data: { list_id: @list_id.id },
      type: "DELETE"
    ).done(@convertToAddListIcon())

  checkAdditionResult: (data) =>
    unless _.isNull(data)
      @list_id = data
      @convertRemoveListIcon()
    else
      alert(@ui.errorMessage())

  convertRemoveListIcon: ->
    $("[data-id='Add-To']").unbind( "click", @requestAddListID );
    @ui.changeMyListIcon("glyphicon-plus-sign", "glyphicon-ok-sign", "Remove-From")
    @removeFromMyList()

  convertToAddListIcon: ->
    @ui.changeMyListIcon("glyphicon-ok-sign", "glyphicon-plus-sign", "Add-To")
    $("[data-id='Add-To']").unbind( "click", @requestRemoveList );
    @addToMyList()

  movieID: ->
    $('.add-list-btn').data('movie-id')

window.Movies = Movies
