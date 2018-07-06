require 'rails_helper'

RSpec.describe HighFlyersController, type: :controller do
  let(:teacher) { Fabricate(:teacher) }
  let(:student) { Fabricate(:student) }
  let!(:course) { Fabricate(:course, teacher: teacher) }
  let!(:student_course) { Fabricate(:student_course, student: student, teacher: teacher, score: 100, course: course) }
  let!(:teacher_rating) { Fabricate(:teacher_rating, student: student, teacher: teacher, rating: 2 ) }

  describe 'GET #show' do
    context 'available position' do
      before { get :show, params: { id: 1 } }

      it 'returns http ok status' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns correct data' do
        response_data = JSON.parse(response.body)

        expect(response_data['highflyer']['id']).to eql student.id
        expect(response_data['highflyer']['name']).to eql student.name
        expect(response_data['highflyer']['email']).to eql student.email
      end
    end

    context 'unavailable position' do
      before { get :show, params: { id: 50 } }

      it 'returns http not found status' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns correct data' do
        expect(JSON.parse(response.body)['message']).to eql 'There is no highflyer at this position'
      end
    end
  end
end
