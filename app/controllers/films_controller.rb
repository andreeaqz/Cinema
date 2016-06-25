class FilmsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  
  def index
  	@current_time = Time.now
  	@running_films_this_week = RunningFilm.where(:time => 
  		@current_time.at_beginning_of_week.to_i.to_s..@current_time.at_end_of_week.to_i.to_s)
  	@next_week_time = Time.now + 7.days
  	@running_films_next_week = RunningFilm.where(:time => 
  		@next_week_time.at_beginning_of_week.to_i.to_s..@next_week_time.at_end_of_week.to_i.to_s)
  end

  def show
  	@film = Film.find(params[:title])
  end

  def new
  	@film = Film.new
  end

  def create
  	@film = Film.new(film_params)
    if @film.save
      # Handle a successful save.
      flash[:success] = "Film saved!"

      rf = RunningFilm.new( film_id: @film.id, time: Time.now.to_i.to_s, seats: Array.new(100){0} )
      if rf.save
      	redirect_to films_path
      else
      	render 'new'
      end
    else
      render 'new'
    end
  end

  def destroy
  	# RunningFilm.find(params[:rf_id]).destroy
  	Film.find(params[:id]).destroy

  	redirect_to :back
  end

  private

    def film_params
      params.require(:film).permit(:title)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
