class FilmsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  
  def index
  	@current_time = Time.now
  	@running_films_this_week = RunningFilm.where(:time => 
  		@current_time.to_i.to_s..@current_time.at_end_of_week.to_i.to_s).to_a.uniq {|rf| rf.film_id}
  	@next_week_time = Time.now + 7.days
  	@running_films_next_week = RunningFilm.where(:time => 
  		@next_week_time.at_beginning_of_week.to_i.to_s..@next_week_time.at_end_of_week.to_i.to_s).to_a.uniq {|rf| rf.film_id}
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

      if Film.all.length < 5
        if Film.all.length == 1
          print "\n\n\n\n\n\n\n\n"
          print @film.id
          print "\n\n\n\n\n\n\n\n"

          RunningFilm.all[0].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[5].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[10].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[15].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[16].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          
        elsif Film.all.length == 2
          RunningFilm.all[1].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[6].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[11].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[12].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[17].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          
        elsif Film.all.length == 3
          RunningFilm.all[2].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[7].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[8].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[13].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[18].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          
        elsif Film.all.length == 4
          RunningFilm.all[3].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[4].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[9].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[14].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
          RunningFilm.all[19].update_attributes({:seats => Array.new(100){0}, :film_id => @film.id})
        end 
      end
      reschedule
    else
      root_url newfilm_path
    end
  end

  def destroy
  	RunningFilm.where( :film_id => params[:id] ).each do |rf|
        rf.seats = Array.new(100) {0}
        rf.film_id = nil
        rf.save
      end

    Film.find(params[:id]).destroy

  	redirect_to :back
  end

  def reschedule
    ordered_four = Film.first(4).sort { |a,b| a.rank <=> b.rank }
    top_two = ordered_four.first(2)
    number_of_films_left_behind = ordered_four.length - 2
    if number_of_films_left_behind < 0
      number_of_films_left_behind = 0
    end
    last_two = ordered_four.last(number_of_films_left_behind)

    if last_two.length > 0
      Film.where(:id => last_two[0].id)[0].update_attributes({:tobedeleted => 1})
    end 
    if last_two.length > 1
      Film.where(:id => last_two[1].id)[0].update_attributes({:tobedeleted => 1})
    end

    if top_two.length > 0
      RunningFilm.all[20].update_attributes({:seats => Array.new(100){0}, :film_id => top_two[0].id})
      RunningFilm.all[25].update_attributes({:seats => Array.new(100){0}, :film_id => top_two[0].id})
      RunningFilm.all[30].update_attributes({:seats => Array.new(100){0}, :film_id => top_two[0].id})
      RunningFilm.all[35].update_attributes({:seats => Array.new(100){0}, :film_id => top_two[0].id})
    end

    if top_two.length > 1
      RunningFilm.all[21].update_attributes({:seats => Array.new(100){0}, :film_id => top_two[1].id})
      RunningFilm.all[26].update_attributes({:seats => Array.new(100){0}, :film_id => top_two[1].id})
      RunningFilm.all[31].update_attributes({:seats => Array.new(100){0}, :film_id => top_two[1].id})
      RunningFilm.all[32].update_attributes({:seats => Array.new(100){0}, :film_id => top_two[1].id})
    end

    if Film.all.length > 4
      RunningFilm.all[22].update_attributes({:seats => Array.new(100){0}, :film_id => Film.all[4].id})
      RunningFilm.all[27].update_attributes({:seats => Array.new(100){0}, :film_id => Film.all[4].id})
      RunningFilm.all[28].update_attributes({:seats => Array.new(100){0}, :film_id => Film.all[4].id})
      RunningFilm.all[33].update_attributes({:seats => Array.new(100){0}, :film_id => Film.all[4].id})
    end

    if Film.all.length > 5
      RunningFilm.all[23].update_attributes({:seats => Array.new(100){0}, :film_id => Film.all[5].id})
      RunningFilm.all[24].update_attributes({:seats => Array.new(100){0}, :film_id => Film.all[5].id})
      RunningFilm.all[29].update_attributes({:seats => Array.new(100){0}, :film_id => Film.all[5].id})
      RunningFilm.all[34].update_attributes({:seats => Array.new(100){0}, :film_id => Film.all[5].id})
    end

    redirect_to root_url
  end


  def delete_old_films
    films_to_be_deleted = Film.where(tobedeleted: 1)
    films_to_be_deleted.each do |ftbd|
      if RunningFilm.where(film_id: ftbd.id).length == 0
        ftbd.destroy
      end
    end
    redirect_to root_url
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
