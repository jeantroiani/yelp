require 'rails_helper'


feature 'users have accounts' do

	scenario 'user is not logged' do
		visit '/restaurants'
		click_link 'New Restaurant'
		# save_and_open_page
		expect(page).to have_content 'Log in'
	end

	scenario 'user can log up' do
		visit ('/users/sign_up')
		fill_in 'user[email]', with: 'jean@troiani.com'
		fill_in 'user[password]', with: '12345678'
		fill_in 'user[password_confirmation]', with: '12345678'
		click_button 'Sign up'
	
	end

	scenario 'user can log out' do
	jean = 	User.create(email: 'jean@troiani.com',password: '12345678', password_confirmation: '12345678') 
	login_as jean
  visit('/restaurants')
	click_link'Sign out'
	expect(page).to have_content('Signed out successfully.')

	end


end

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

context 'logged in' do

	before(:each) do
		Restaurant.create(name: 'McDonalds', cuisine: 'Fast food', phone_number: '07817596970')
		jean = 	User.create(email: 'jean@troiani.com',password: '12345678', password_confirmation: '12345678') 
		login_as jean
	end

	feature 'input information' do	

		scenario 'user can fill a form with the information' do
			visit('/restaurants')
			click_link('New Restaurant')
			fill_in  'Name', with: 'Burger King'
			click_button('Create Restaurant') 
			expect(page).to have_content('Burger King')
		end
	end
	feature 'update information' do




		scenario 'user can update the information on the database' do
			visit('/restaurants')
			click_link('Edit Restaurant')
			fill_in 'Name', 				with: 'Macky D'  
			fill_in 'Cuisine', 			with: 'Burgers'
			fill_in 'Phone number', with: '07817596980' 		
			click_button('Update Restaurant')
			expect(page).to have_content('Record updated successfully')
			expect(page).to have_content('Macky D')
		end	
	end

	feature 'destroy information' do

		before(:each) do
			Restaurant.create(name: 'McDonalds', cuisine: 'Fast food', phone_number: '07817596970')
		end

		scenario 'user can destroy information on the database' do
			visit('/restaurants')
			expect(page).to have_content('McDonalds')
			click_link('Delete Restaurant')	
			expect(page).to have_content('Record have been deleted')	
			expect(page).not_to have_content('McDonalds')

		end	
	end

	feature 'validation of name' do


		scenario 'restaurant cannot be added if name has less than three letters' do
			visit('/restaurants')
			expect(page).not_to have_content('Ma')
			click_link('New Restaurant')
			fill_in 'Name', with: 'Ma'
			click_button('Create Restaurant')
			expect(page).not_to have_content('Ma')

		end	

	end

	feature 'validation of name' do

		scenario 'restaurant cannot be added if name has less than three letters' do
			visit('/restaurants')
			expect(page).not_to have_content('Ma')
			click_link('New Restaurant')
			fill_in 'Name', with: 'Ma'
			click_button('Create Restaurant')
			expect(page).not_to have_content('Ma')

		end	
	end

end


