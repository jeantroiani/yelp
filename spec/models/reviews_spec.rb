require 'rails_helper'

RSpec.describe Review, :type => :model do

	before(:each) do
			Restaurant.create(name: 'McDonalds')
	end

	context 'rating'
		it 'can not accept > 5 as a rating 'do
			review = Review.new(rating: -5)
			expect(review).to have(1).error_on(:rating)		
		end

	
		it 'can not accept < 5 as a rating 'do
			review = Review.new(rating: 6)
			expect(review).to have(1).error_on(:rating)
		end
	end
	


