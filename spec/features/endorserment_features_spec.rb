 require 'rails_helper'

describe 'liking reviews' do
 	before (:each) do 
 		kfc = Restaurant.create(name: 'KFC')
 		kfc.reviews.create(rating: 3, review: 'OK')
 	end


	 
		it 'can click likes, updating the likes amount' do
			visit('/restaurants')
			click_link('Like')
			expect(page).to have_content('Likes 1')	
		end



 	
end 