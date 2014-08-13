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

	scenario'restaurants show 4 stars if rating equal to 4' do
		visit('/restaurants')
		click_link('Write review')
		fill_in('Write a review', with: 'Good!')
		select "4", from: "Rating"
		click_button('Leave review')
		expect(page).to have_content('★★★★☆')	
	end

	scenario'restaurants show 4 stars if rating equal to 4.5' do
		visit('/restaurants')
		click_link('Write review')
		fill_in('Write a review', with: 'Good!')
		select "5", from: "Rating"
		click_button('Leave review')
		click_link('Write review')
		fill_in('Write a review', with: 'Good!')
		select "4", from: "Rating"
		click_button('Leave review')
		expect(page).to have_content('★★★★☆')	
	end



end