require 'rails_helper'

feature 'Restaurants have not been added' do

	scenario 'there is no restaurants showing' do
		visit ('/restaurants')
		page.should have_content('No restaurants have been added')
		expect(page).to have_link('Add Restaurant')
	end

end

feature 'Restaurants have been added' do

	before(:each) do
		Restaurant.create(name: 'McDonalds')
	end

	scenario ' Restaurant have been added' do
		visit ('/restaurants')
		page.should have_no_content('No restaurants have been added')
		page.should have_content('McDonalds')
		expect(page).to have_link('Add Restaurant')
	end

end