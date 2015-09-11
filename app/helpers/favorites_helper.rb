module FavoritesHelper
  def movie_poster(my_list)
    Movie.find(my_list.movie_id).poster
  end

  def movie_title(my_favorite)
    Movie.find(my_favorite.movie_id).title
  end
end
