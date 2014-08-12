class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review= Review.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review 	= @restaurant.reviews.create(params.require(:review).permit(:review, :rating))
		# puts "====" * 40
		# puts @restaurant.inspect
		# puts @review.inspect
		redirect_to '/restaurants'
	end
end
