require 'rails_helper'

RSpec.describe RevenuesController, type: :controller do
  context "GET #index" do
    it 'returns a sucess response' do
      get :index
      expect(response).to be_success
    end
  end
  
  context "GET #show" do 
    it 'returns a sucess response' do 
      revenue = Revenue.create!( name: 'test.csv',
                                 value: 0)
      get :show , params: { id: revenue.to_param }
      expect(response).to be_success
    end
  end
end
