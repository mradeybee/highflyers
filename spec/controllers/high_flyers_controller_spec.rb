require 'rails_helper'

RSpec.describe HighFlyersController, type: :controller do

  xdescribe "GET #show" do
    it "returns http success" do
      get :show, params: {id: 1}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #rate" do
    it "returns http success" do
      post :rate, params: {id: 1, teacher_id: 2}
      expect(response).to have_http_status(:success)
    end
  end

end
