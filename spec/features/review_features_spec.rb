require 'rails_helper'

feature 'Reviews for restaurants' do

	before(:each) do
		Restaurant.create(name: 'McDonalds', cuisine: 'Fast food', phone_number: '07817596970')
	end

	scenario'users can leave a review for a restaurant' do
		visit('/restaurants')
		click_link('Write review')
		fill_in('Write a review', with: 'Good!')
		select "5", from: "Rating"
		click_button('Leave review')
		expect(page).to have_content('Good!')
	end


end