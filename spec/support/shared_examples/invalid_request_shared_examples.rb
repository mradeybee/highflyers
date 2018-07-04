RSpec.shared_examples 'a user controller with invalid create requests' do
  context 'with invalid parameters' do
    context 'empty parameters' do
      before do
        post :create, params: { name: '', email: '' }
      end

      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error details' do
        response_data = JSON.parse(response.body)
        expect(response_data['errors'].present?).to be true
        expect(response_data['errors']).to include "Email can't be blank"
        expect(response_data['errors']).to include "Name can't be blank"
      end
    end

    context 'invalid emails' do
      before do
        post :create, params: { name: 'User Name', email: 'useremail' }
      end

      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error details' do
        expect(JSON.parse(response.body)['errors']).to include "Email is invalid"
      end
    end
  end

  context 'with existing email' do
    let(:user) { Fabricate(:user) }

    before do
      post :create, params: { name: 'New Student', email: user.email }
    end

    it 'returns http unprocessable entity' do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error details' do
      expect(JSON.parse(response.body)['errors']).to include "Email has already been taken"
    end
  end
end
