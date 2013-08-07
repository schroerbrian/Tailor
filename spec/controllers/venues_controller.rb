require 'spec_helper'

describe VenuesController do 

	let(:venue) { FactoryGirl.create(:venue) }

	describe '#index' do 

		it 'should render index.html.erb' do
			get :index
			expect(response).to render_template :index 
		end 
	end

	describe '#search' do 


		
		it 'should find a venue by name' do
			venue
			post :search, venue: "Bar"
			expect(response).to render_template :index

		end 		
	end 

end
