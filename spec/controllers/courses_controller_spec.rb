require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  describe 'GET #index' do
    before do
      5.times { Fabricate(:course) }
      get :index
    end

    it 'returns http ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns students data count' do
      expect(JSON.parse(response.body)['courses'].count).to eq 5
    end
  end

  describe 'POST #create' do
    let(:teacher) { Fabricate(:teacher) }

    context 'with valid parameters' do
      before { post :create, params: {teacher_id: teacher.id, name: 'Course 101', code: 'C101'} }

      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns course details' do
        response_data = JSON.parse(response.body)

        expect(response_data['course']['code']).to eql 'C101'
        expect(response_data['course']['name']).to eql 'Course 101'
        expect(response_data['course']['teacher_id']).to eql teacher.id
      end
    end

    context 'with invalid parameters' do
      context 'empty parameters' do
        before { post :create, params: {teacher_id: '', name: '', code: ''} }

        it 'returns http unprocessable entity status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns error details' do
          response_data = JSON.parse(response.body)

          expect(response_data['errors']).to include 'Teacher must exist'
          expect(response_data['errors']).to include "Name can't be blank"
          expect(response_data['errors']).to include "Code can't be blank"
        end
      end

      context 'duplicate course code' do
        let(:course) { Fabricate(:course) }

        before { post :create, params: {code: course.code, teacher_id: teacher.id, name: 'Course 100'} }

        it 'returns http unprocessable entity status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns error details' do
          expect(JSON.parse(response.body)['errors']).to include 'Code has already been taken'
        end
      end
    end
  end
end
