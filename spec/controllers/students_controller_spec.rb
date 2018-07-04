require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  describe 'GET #index' do
    before do
      5.times { Fabricate(:student) }
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns students data' do
      response_data = JSON.parse(response.body)
      expect(response_data['students'].count).to eq 5
    end
  end


  describe 'POST #create' do
    it_behaves_like 'a user controller with invalid create requests'

    context 'with valid parameters' do
      before do
        post :create, params: { name: 'Student Name', email: 'student@email.com' }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns student details' do
        response_data = JSON.parse(response.body)
        expect(response_data['student']['id'].present?).to be true
        expect(response_data['student']['name']).to eql 'Student Name'
        expect(response_data['student']['email']).to eql 'student@email.com'
      end
    end
  end
end
