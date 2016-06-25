class Film < ActiveRecord::Base
	has_many :running_films, dependent: :destroy
	validates :title,  presence: true, length: { maximum: 50 }

end
