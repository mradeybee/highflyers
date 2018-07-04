require 'rails_helper'

RSpec.describe TeachersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it_behaves_like 'a user controller with invalid create requests'

    context 'with valid parameters' do
      before do
        post :create, params: { name: 'Teacher Name', email: 'teacher@email.com' }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns teacher details' do
        response_data = JSON.parse(response.body)
        expect(response_data['teacher']['id'].present?).to be true
        expect(response_data['teacher']['name']).to eql 'Teacher Name'
        expect(response_data['teacher']['email']).to eql 'teacher@email.com'
      end
    end
  end
end
