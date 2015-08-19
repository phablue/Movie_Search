movieTime = ->
  (new Movies).search()
  (new Movies).addToMyList()
  (new UI).active()

$ ->
  movieTime()
  $(@).on('page:load', movieTime)
