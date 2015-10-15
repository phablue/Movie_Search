class Movies
  constructor: (ui) ->
    @ui = ui

  search: ->
    $("[data-id='searchForm']").submit =>
      alert(@ui.searchErrorMessage()) if @ui.invalidSearchWord()

  ranking: ->
    $("[data-id='optionSet']").click =>
      window.location = "/rank?genre=#{@genre()}&reviewer=#{@reviewer()}&year=#{@year()}"

  addToMyList: ->
    $("[data-id='Add-To']").bind( "click", @requestAddList )

  removeFromMyList: (data) ->
    $("[data-id='Remove-From']").bind( "click", { list_id: data.id }, @requestRemoveList )

  requestAddList: =>
    $.post("/my-list", { movie_id: @id() }).done(@checkAdditionResult)

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
      alert(@ui.addListErrorMessage())
    else
      @convertRemoveListIcon(data)

  convertRemoveListIcon: (data) =>
    $("[data-id='Add-To']").unbind( "click", @requestAddListID )
    @ui.changeMyListIcon("glyphicon-plus-sign", "glyphicon-ok-sign", "Remove-From")
    @removeFromMyList(data)

  convertToAddListIcon: =>
    @ui.changeMyListIcon("glyphicon-ok-sign", "glyphicon-plus-sign", "Add-To")
    $("[data-id='Add-To']").unbind( "click", @requestRemoveList )
    @addToMyList()

  id: ->
    $('.add-list-btn').data('movie-id')

  genre: ->
    @ui.getText('#genre option:selected').get()

  year: ->
    @ui.getText('#year option:selected').get()

  reviewer: ->
    @ui.getText('#reviewer option:selected').get()

window.Movies = Movies
