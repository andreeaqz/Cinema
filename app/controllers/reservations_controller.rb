class ReservationsController < ApplicationController
  def new
  	@reservation = Reservation.new
    @film_id = RunningFilm.find(params[:id]).film.id
    @film = Film.find(@film_id)
  	@rf = RunningFilm.where(:film_id=>@film_id).where("time > ?", Time.now.to_i.to_s)
  end

  def new_select_seats
    @reservation = Reservation.new
    @reservation.seats = RunningFilm.find(params[:reservation][:running_film_id]).seats
    @reservation.running_film_id = params[:reservation][:running_film_id]
  end

  def add_user_info
    if (params[:reservation_seats].values.split[0].map{|a| a.to_i} == [0]*100)
      redirect_to root_url
    else
      @seats = params[:reservation_seats].values
      @running_film_id = params[:reservation_rf_id]
      @user = User.new
    end
  end

  def create
    @user = User.new(nume: params[:user][:nume], email: params[:user][:email], password: "placeholder")
    if @user.save
      @running_film = RunningFilm.find(params[:reservation_rf_id])
      @running_film.seats = add_selected_seats(@running_film.seats, params[:reservation_seats].split().map{|a| a.to_i})
      
      if @running_film.save
        @reservation = Reservation.new(user_id: @user.id, running_film_id: params[:reservation_rf_id], seats: params[:reservation_seats].split().map{|a| a.to_i})
       
        if @reservation.save
          @film = Film.find(@running_film.film_id)
          @film.rank += params[:reservation_seats].split().map{|a| a.to_i}.inject(0, :+)
          print "\n\n"
          print params[:reservation_seats].split().map{|a| a.to_i}
          print "\n"
          print params[:reservation_seats].split().map{|a| a.to_i}.inject(0, :+)
          print "\n\n"
          if @film.save
           redirect_to reservationshow_path(id: @reservation.id)
          else
            redirect_to root_url
          end
        else
          redirect_to root_url
        end
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


    def add_selected_seats(a, b)
      result = []
      (0..a.length-1).each do |i|
        result.append((a[i].to_i + b[i].to_i))
      end
      return result
    end

end
