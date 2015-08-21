module FavoritesHelper
  def movie_poster(my_list)
    Movie.find(my_list.movie_id).poster
  end
end
