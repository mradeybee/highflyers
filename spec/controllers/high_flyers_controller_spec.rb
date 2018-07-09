require 'rails_helper'

RSpec.describe HighFlyersController, type: :controller do
  let(:teacher) { Fabricate(:teacher) }
  let(:student) { Fabricate(:student) }
  let!(:course) { Fabricate(:course, teacher: teacher) }
  let!(:student_course) { Fabricate(:student_course, student: student, teacher: teacher, score: 100, course: course) }
  let!(:teacher_rating) { Fabricate(:teacher_rating, teacher: teacher, rating: 2) }
  let!(:teacher_rating1) { Fabricate(:teacher_rating, teacher: teacher, rating: 2) }
  let!(:teacher_rating2) { Fabricate(:teacher_rating, teacher: teacher, rating: 2) }

  describe 'GET #show' do
    context 'available position' do
      before { get :show, params: { id: 1 } }

      it 'returns http ok status' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns correct data' do
        response_data = JSON.parse(response.body)

        expect(response_data['id']).to eql student.id
        expect(response_data['name']).to eql student.name
        expect(response_data['email']).to eql student.email
      end
    end

    context 'unavailable position' do
      before { get :show, params: { id: 50 } }

      it 'returns http not found status' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns correct data' do
        msg = 'There is no highflyer at this position'
        expect(JSON.parse(response.body)['message']).to eql msg
      end
    end
  end

  describe 'POST #rate' do
    context 'valid data' do
      before { post :rate, params: { id: 1, teacher_id: teacher.id, rating: 2 } }

      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns correct data' do
        response_data = JSON.parse(response.body)
        
        

        expect(response_data['student']['id']).to eql student.id
        expect(response_data['teacher']['id']).to eql teacher.id
        expect(response_data['rating']).to eql 4
      end
    end

    context 'invalid data' do
      context 'invalid teacher' do
        before { post :rate, params: { id: 1, teacher_id: 0, rating: 2 } }

        it 'returns http unprocessable entity status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns correct data' do
          response_data = JSON.parse(response.body)

          expect(response_data['errors'].present?).to be true
          expect(response_data['errors']).to include 'Teacher must exist'
          expect(response_data['errors']).to include "Teacher can't be blank"
        end
      end

      context 'invalid highflyer position' do
        before { post :rate, params: { id: 50, teacher_id: teacher.id, rating: 4 } }

        it 'returns http unprocessable entity status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns correct error' do
          response_data = JSON.parse(response.body)

          expect(response_data['errors'].present?).to be true
          expect(response_data['errors']).to include 'Student must exist'
          expect(response_data['errors']).to include "Student can't be blank"
        end
      end
    end
  end
end
