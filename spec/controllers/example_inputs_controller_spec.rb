require 'rails_helper'

RSpec.describe ExampleInputsController, type: :controller do
  context 'GET #index' do
    it 'returns a success response' do 
      get :index
      expect(response).to be_success
    end
  end

  context "GET #show" do
    it 'returns a sucess response' do
      example_input = ExampleInput.create!( purchasername: "Snake Plissken",
                                            itemdescription: "R$35 Sneakers for R$3",
                                            itemprice: '3',
                                            purchasecount: '4',
                                            merchantaddress: "171 Fake St",
                                            merchantname: "Sneaker Store Emporium")
      get :show , params: { id: example_input.to_param }
      expect(response).to be_success
    end
  end

  context "DELETE #destroy " do
    it 'returns a sucess response' do
      #example_input = ExampleInput.first
      #delete :destroy, id: example_input
      #expect(response).to render_template('index')
      #delete :destroy , id:
    end
  end
  
end
