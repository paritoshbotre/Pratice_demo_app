class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if params[:search].present?
      @movies = Movie.search(params[:search])
    else
      @movies = Movie.all
    end
  end

  def show
  end

  def new
    @movie = current_user.movies.build
  end

  def edit
  end

  def create
    @movie = current_user.movies.build(movie_params)

    if @movie.save
      redirect_to movies_path, notice: 'Movie was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Movie was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path , notice: 'Movie was successfully destroyed.'
  end

  def autocomplete
    p params[:search]
    p params[:query]
    render json: Movie.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :description, :director, :avatar)
    end
end
