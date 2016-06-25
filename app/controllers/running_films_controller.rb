class RunningFilmsController < ApplicationController
  def index
  	@runningfilms = RunningFilm.all
  end

  def show
  	@runningfilm = RunningFilm.find( params[:id] )
  	@film = @runningfilm.film
  end
end
