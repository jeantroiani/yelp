require 'rails_helper'

describe Restaurant, :type => :model do

	it' should have restaurant after a creating one'do
		expect(Restaurant.all.any?).to eq(false)
		Restaurant.create(name: 'McDonalds')
		expect(Restaurant.all.any?).to eq(true)
	end  

end


