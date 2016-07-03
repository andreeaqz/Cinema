class RunningFilmsController < ApplicationController
  def index
  	@runningfilms = RunningFilm.all
  end

  def show
  	@runningfilm = RunningFilm.where(:film_id=>params[:id]).where("time > ?", Time.now.to_i.to_s)
  	@film = @runningfilm.film
  end
end
