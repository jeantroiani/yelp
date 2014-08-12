require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

	context 'creating a restaurant' do
		it' should have restaurant after a creating one'do
			expect(Restaurant.all.any?).to eq(false)
			Restaurant.create(name: 'McDonalds')
			expect(Restaurant.all.any?).to eq(true)
		end  

	end

 
	context 'validation on names' do
			
		it 'it does not accept the name if is less than 3 characters ' do
			restaurant=Restaurant.new(name: 'ab')
			expect(restaurant).to have(1).error_on(:name)			
		end

		it 'gives an error if the name is not unique' do
			Restaurant.create(name: 'McDonalds')
			restaurant=Restaurant.new(name: 'McDonalds')
			expect(restaurant).to have(1).error_on(:name)			
		end


	end 

end