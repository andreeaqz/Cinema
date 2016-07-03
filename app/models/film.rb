class Film < ActiveRecord::Base
	has_many :running_films
	validates :title,  presence: true, length: { maximum: 50 }

	def self.reschedule_films
	    ordered_four = Film.first(4).sort { |a,b| a.rank <=> b.rank }
	    top_two = ordered_four.first(2)
	    number_of_films_left_behind = ordered_four.length - 2
	    if number_of_films_left_behind < 0
	      number_of_films_left_behind = 0
	    end
	    last_two = ordered_four.last(number_of_films_left_behind)

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
	end

	def self.addfilm
		Film.create(:title => "Titlu")
	end 
end
