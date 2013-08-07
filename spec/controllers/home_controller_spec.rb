require 'spec_helper'

describe HomeController do 

	describe '#index' do 

		it 'should render index.html.erb' do
			get :index
			expect(response).to render_template :index 
		end 
	end

	describe 'team' do 

		it 'should render team.html.erb' do 
			get :team 
			expect(response).to render_template :team
		end 
	end 

end  