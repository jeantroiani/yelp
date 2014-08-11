class RestaurantsController < ApplicationController
	
	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		Restaurant.create(params[:restaurant].permit(:name,:cuisine,:phone_number))
		redirect_to '/restaurants'
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update(params[:restaurant].permit(:name,:cuisine,:phone_number))
		flash[:notice]='Record updated successfully'
		redirect_to '/restaurants'
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		flash[:notice]='Record have been deleted'
		redirect_to '/restaurants'
	end

end
