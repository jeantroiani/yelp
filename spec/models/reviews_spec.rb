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
	
	context 'average rating' do

		it' shows an average of 2 reviews' do

			@restaurant=Restaurant.create(name: 'McDonalds', cuisine: 'Fast food', phone_number: '07817596970')
			@restaurant.reviews.create(review: 'Meh',rating: 3)
			@restaurant.reviews.create(review: 'Good',rating: 5)
			expect(@restaurant.average_rating).to eq (4.0)
		end

		it' Shows Not reviewed yet, if no one has written a review for that restaurant' do

			@restaurant=Restaurant.create(name: 'McDonalds', cuisine: 'Fast food', phone_number: '07817596970')
			expect(@restaurant.average_rating).to eq ('Not reviewed yet')
		end

		it' shows an average of 2 reviews with float numbers' do

			@restaurant=Restaurant.create(name: 'McDonalds', cuisine: 'Fast food', phone_number: '07817596970')
			@restaurant.reviews.create(review: 'Nice',rating: 4)
			@restaurant.reviews.create(review: 'Good',rating: 5)
			expect(@restaurant.average_rating).to eq (4.5)
		end

	end


	


