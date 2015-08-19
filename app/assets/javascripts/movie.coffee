class Movies
  constructor: ->
    @ui = new UI

  search: ->
    $("[data-id='searchBTN']").click =>
      @redirectResultPage()

  redirectResultPage: ->
    window.location = "/result?q=#{@searchWord()}"

  searchWord: ->
    $("[data-id='searchWord']").val()

  addToMyList: ->
    $("[data-id='Add-To']").click =>
      $.post("/my-list?movie_id=#{@movieID()}").done(@confirmAddition)

  removeFromMyList: ->
    $("[data-id='Remove-From']").click =>
      $.post("/my-list?movie_id=#{@movieID()}").done(@confirmAddition)

  confirmAddition: (data) =>
    if data
      @validAddition()
    else
      alert(@ui.errorMessage())

  validAddition: ->
    $("[data-id='Add-To']").remove();
    $(".list").remove()
    $('.add-list-btn').append(@ui.confirmAdditionIcon())

  movieID: ->
    $('.add-list-btn').data('movie-id')

window.Movies = Movies
