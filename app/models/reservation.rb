class Reservation < ActiveRecord::Base
	has_one :running_film
	serialize :seats, Array

end
