class RunningFilm < ActiveRecord::Base
	belongs_to :film
	belongs_to :reservation
	validates :time, presence: true

	serialize :seats, Array

	def date_time
  		Time.at(time.to_i).in_time_zone('Bucharest')
  	end
end
