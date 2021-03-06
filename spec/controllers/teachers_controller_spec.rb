require 'rails_helper'

RSpec.describe TeachersController, type: :controller do

  describe 'GET #index' do
    before do
      5.times { Fabricate(:teacher) }
      get :index
    end

    it 'returns http ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns teachers data' do
      expect(JSON.parse(response.body).count).to eq 5
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      before { post :create, params: { name: 'Teacher Name', email: 'teacher@email.com' } }

      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns teacher details' do
        response_data = JSON.parse(response.body)

        expect(response_data['name']).to eql 'Teacher Name'
        expect(response_data['email']).to eql 'teacher@email.com'
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

        it 'returns http unprocessable entity' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns error details' do
          expect(JSON.parse(response.body)['errors']).to include 'Email is invalid'
        end
      end
    end

    context 'with existing email' do
      let(:teacher) { Fabricate(:teacher) }

      before { post :create, params: { name: 'New Student', email: teacher.email } }

      it 'returns http unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error details' do
        expect(JSON.parse(response.body)['errors']).to include 'Email has already been taken'
      end
    end
  end


  describe 'POST #score_student' do
    let(:teacher) { Fabricate(:teacher) }
    let(:student) { Fabricate(:student) }
    let(:course) { Fabricate(:course, teacher: teacher) }
    let!(:student_course) { Fabricate(:student_course, student: student, teacher: teacher, course: course) }
    let!(:teacher_rating) { Fabricate(:teacher_rating, student: student, teacher: teacher, rating: 2 ) }

    before { post :score_student, params: { score: 70, student_id: student.id, id: teacher.id, course_id: course.id} }

    it 'returns http ok status' do
      expect(response).to have_http_status(:created)
    end

    it 'returns students data' do
      response_data = JSON.parse(response.body)

      expect(response_data['student']['id']).to eql student.id
      expect(response_data['teacher']['id']).to eql teacher.id
      expect(response_data['score']).to eql 70
    end
  end
end
