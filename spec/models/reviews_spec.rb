require 'rails_helper'

RSpec.describe Review, :type => :model do
			let(:restaurant){Restaurant.create(name: 'McDonalds', cuisine: 'Fast food', phone_number: '07817596970')}


	context 'rating'
		it 'can not accept > 5 as a rating 'do
			review = Review.new(rating: -5)
			expect(review).to have(1).error_on(:rating)		
		end

	
		it 'can not accept < 5 as a rating 'do
			review = Review.new(rating: 6)
			expect(review).to have(1).error_on(:rating)
		end


		it' shows an average of 2 reviews' do

			restaurant.reviews.create(review: 'Nice',rating: 3)
			restaurant.reviews.create(review: 'Good',rating: 5)
			expect(restaurant.average_rating).to eq (4.0)
		end

		it' Shows Not reviewed yet, if no one has written a review for that restaurant' do

			
			expect(restaurant.average_rating).to eq ('Not reviewed yet')
		end

		it' shows an average of 2 reviews with float numbers' do

			restaurant.reviews.create(review: 'Nice',rating: 4)
			restaurant.reviews.create(review: 'Good',rating: 5)
			expect(restaurant.average_rating).to eq (4.5)
		end

		it' shows 4 black stars if review is equal to 4' do

			restaurant.reviews.create(review: 'Nice',rating: 4)
			restaurant.reviews.create(review: 'Good',rating: 4)
			expect(restaurant.average_rating).to eq (4)
		end




	end

	


