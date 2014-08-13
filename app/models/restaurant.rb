class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :name, length: {minimum: 3}, uniqueness: true

	def average_rating
		if reviews.average(:rating).nil?
			'Not reviewed yet'
		else
			reviews.average(:rating)
		end
	end


end
