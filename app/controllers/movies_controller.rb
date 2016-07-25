class MoviesController < ApplicationController

  def self.ratings
    # pluck returns an array of whatever column is passed to it
    # setting up the class method like this didn't work for me :(
  end

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @query = params[:query]
    
    @all_ratings = Movie.uniq.pluck(:rating).sort
    
    if params[:ratings].present?
      @hash_rating = params[:ratings].keys
    else
      @hash_rating = @all_ratings
    end
    
    if @query == "sort_title" then
      @movies = Movie.where(:rating => @hash_rating).order(:title)
    elsif @query == "sort_release_date"
      @movies = Movie.where(:rating => @hash_rating).order(:release_date)
    else
      @movies = Movie.where(:rating => @hash_rating)
    end
    
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
