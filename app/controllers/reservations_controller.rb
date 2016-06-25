class ReservationsController < ApplicationController
  def new
  	@reservation = Reservation.new
  	@film_id = RunningFilm.find(params[:id]).film.id
  	@rf = RunningFilm.where(:film_id => @film_id)
  end

  def new_select_seats
    @reservation = Reservation.new
    @reservation.seats = RunningFilm.find(params[:reservation][:running_film_id]).seats
    @reservation.running_film_id = params[:reservation][:running_film_id]
  end

  def add_user_info
    @seats = params[:reservation_seats].values
    @running_film_id = params[:reservation_rf_id]
    @user = User.new
  end

  def create
    print "\n\n\n\nhelooooooasd\n\n\n\n"
    @user = User.new(nume: params[:user][:nume], email: params[:user][:email])
    if @user.save
      @reservation = Reservation.new(user_id: @user.id, running_film_id: params[:reservation_rf_id], seats: params[:reservation_seats].split())
       
      if @reservation.save
        redirect_to reservationshow_path(id: @reservation.id)
      else
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end

  def show
    print params
    @reservation = Reservation.find(params[:id])
    @user = User.find(@reservation.user_id)
    @running_film = RunningFilm.find(@reservation.running_film_id)
    @film = Film.find(@running_film.film_id)
  end

  private

    def reservation_params
      params.require(:reservation).permit( :running_film_id )
    end

end
