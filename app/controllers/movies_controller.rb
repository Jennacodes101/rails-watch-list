class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Moive.new(movie_params)

    if @movie.save
      redirect_to lists_path # challenge: redirect to new bookmark with moive loaded
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end

# user submits a search query for their movie in the database  via pages
# The api return a list of results
# The user then selects the new movie for the database

# find movie search js bc more cool but backup is pages search_movies route
