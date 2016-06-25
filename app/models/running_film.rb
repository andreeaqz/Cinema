class RunningFilm < ActiveRecord::Base
	belongs_to :film
	belongs_to :reservation
	validates :film_id, presence: true
	validates :time, presence: true

	serialize :seats, Array

	def date_time
  		Time.at(time.to_i).to_datetime
  	end
end
