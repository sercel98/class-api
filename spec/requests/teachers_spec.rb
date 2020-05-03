require 'rails_helper'

RSpec.describe 'Teachers API', type: :request do
  # initialize test data 
  let!(:teacher) { create_list(:teacher, 10) }
  let(:teacher_id) { teacher.first.id }

  # Test suite for GET /todos
  describe 'GET /teachers' do
    # make HTTP get request before each example
    before { get '/teachers' }

    it 'returns teachers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
    
  describe 'GET /teachers/:id' do

    before { get "/teachers/#{teacher_id}" }

    context 'when the record exists' do
      it 'returns the teacher' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(teacher_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:teacher_id) { 100 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find teacher/)
      end
    end
  end
  
  # Test suite for POST /teachers
  describe 'POST /teacher' do
    # valid payload
    let(:valid_attributes) { { name: 'Sergio Celemin', email: 'sergio123@gmail.com',  password: '12345678' } }

    context 'when the request is valid' do
      before { post '/teachers', params: valid_attributes }

      it 'creates a teacher' do
        expect(json['name']).to eq('Sergio Celemin')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/teachers', params: { name: 'Sergio Celemin' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

    end
  end

  # Test suite for PUT /teachers/:id
  describe 'PUT /teachers/:id' do

    let(:valid_attributes) { { name: 'Toby' } }
    context 'when the record exists' do
      before { put "/teachers/#{teacher_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /teachers/:id' do
    before { delete "/teachers/#{teacher_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end