require 'rails_helper'

feature 'Restaurants' do
	scenario'there is no restaurants showing' do
		visit ('/restaurants')
		page.should have_content('No restaurants have been added')
	end

end