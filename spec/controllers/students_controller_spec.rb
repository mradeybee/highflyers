require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  describe 'GET #index' do
    before do
      5.times { Fabricate(:student) }
      get :index
    end

    it 'returns http ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns students data' do
      expect(JSON.parse(response.body)['students'].count).to eq 5
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      before { post :create, params: { name: 'Student Name', email: 'student@email.com' } }

      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns student details' do
        response_data = JSON.parse(response.body)

        expect(response_data['student']['id'].present?).to be true
        expect(response_data['student']['name']).to eql 'Student Name'
        expect(response_data['student']['email']).to eql 'student@email.com'
      end
    end

    context 'with invalid parameters' do
      context 'empty parameters' do
        before { post :create, params: { name: '', email: '' } }

        it 'returns http unprocessable entity status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns error details' do
          response_data = JSON.parse(response.body)

          expect(response_data['errors']).to include "Email can't be blank"
          expect(response_data['errors']).to include "Name can't be blank"
        end
      end

      context 'invalid emails' do
        before { post :create, params: { name: 'User Name', email: 'useremail' } }

        it 'returns http unprocessable entity status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns error details' do
          expect(JSON.parse(response.body)['errors']).to include 'Email is invalid'
        end
      end
    end

    context 'with existing email' do
      let(:student) { Fabricate(:student) }

      before { post :create, params: { name: 'New Student', email: student.email } }

      it 'returns http unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error details' do
        expect(JSON.parse(response.body)['errors']).to include 'Email has already been taken'
      end
    end
  end

  describe 'POST #rate_teacher' do
    let(:student) { Fabricate(:student) }
    let(:teacher) { Fabricate(:teacher) }

    before { post :rate_teacher, params: { rating: 2, id: student.id, teacher_id: teacher.id} }

    it 'returns http ok status' do
      expect(response).to have_http_status(:created)
    end

    it 'returns students data' do
      response_data = JSON.parse(response.body)

      expect(response_data['rating']['student_id']).to eql student.id
      expect(response_data['rating']['teacher_id']).to eql teacher.id
      expect(response_data['rating']['rating']).to eql 2
    end
  end
end
