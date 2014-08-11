require 'rails_helper'

feature 'Restaurants have not been added' do

	scenario 'there is no restaurants showing' do
		visit ('/restaurants')
		expect(page).to have_content('No restaurants have been added')
		expect(page).to have_link('New Restaurant')
	end

end

feature 'Restaurants have been added' do

	before(:each) do
		Restaurant.create(name: 'McDonalds')
	end

	scenario ' Restaurant have been added' do
		visit ('/restaurants')
		expect(page).to_not have_content('No restaurants have been added')
		expect(page).to have_content('McDonalds')
		expect(page).to have_link('New Restaurant')
	end

end

feature 'restaurant features' do 

	before(:each) do
		Restaurant.create(name: 'McDonalds', cuisine: 'Fast food', phone_number: '07817596970')
	end

	scenario 'restaurant has a type of cuisine' do
		visit ('/restaurants')
		expect(page).to have_content('Fast food')
	end

	scenario 'restaurant has a phone number' do
		visit ('/restaurants')
		expect(page).to have_content('07817596970')
	end

end

feature 'input information' do	

	scenario 'user can fill a form with the information' do
		visit('/restaurants')
		click_link('New Restaurant')
		fill_in  'Name', with: 'McDonalds'
		click_button('Create Restaurant') 
		expect(page).to have_content('McDonalds')
	end

end