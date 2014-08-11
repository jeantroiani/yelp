class RestaurantsController < ApplicationController
	
	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurants = Restaurant.new
	end

	def create
		Restaurant.create(params[:restaurant].permit(:name,:cuisine,:phone_number))
		redirect_to '/restaurants'
	end




end
