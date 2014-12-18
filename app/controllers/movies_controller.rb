class MoviesController < ApplicationController
	before_action :authenticate_user!, only: [ :new, :create ]

  def index
	@movies = Movie.order('id DESC').all
  end

def search
	@search = params[:query]
	@movies = Movie.search(@search)
	@no_results = !@movies
	end

def new
	@movie = Movie.new
	@movies = Movie.order('id DESC').all
  end


def create
	@movie = Movie.new(parameters)
	if @movie.valid?
		@movie.save
		flash[:info] = 'Great!!! Movie created'
		return redirect_to root_path
	end

	 flash[:error] = "You have errors"
end



private
  def parameters
    params.require(:movie).permit(:name, :year_released)
  end
end