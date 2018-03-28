require 'rails_helper'

RSpec.describe 'Type API', type: :request do
    # initialize test data 
    let!(:types) { create_list(:type, 10) }
    let(:type_id) { types.first.id }

    # Test suite for GET/Types
    describe 'GET /types' do
        # make HTTP get request before each example
        before { get '/types' }

        it 'returns types' do
          # Note `json` is a custom helper to parse JSON responses
          expect(json).not_to be_empty
          expect(json.size).to eq(10)
        end

        it 'returns types code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Test suite for GET /types/:id
    describe 'GET /types/:id' do
        before {get "/types/#{type_id}"}

        context 'when the record exists' do
            it 'returns the type' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(type_id)
            end

            it 'returns type code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the record does not exist' do
            let(:type_id) {100}

            it 'returns type code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find Type/)
            end
        end
    end

    # Test suite for POST /types
    describe 'POST /types' do
        #valid payload
        let(:valid_attributes) {{ name: 'Income', isActive: true, value: 1 }}

        context 'when the request is valid' do
            before { post '/types', params: valid_attributes }

            it 'creates a type' do
                expect(json['name']).to eq('Income')
                expect(json['isActive']).to eq(true)
                expect(json['value']).to eq('1.0')
            end

            it 'returns type code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the request is invalid' do
            before { post '/types', params: { name: '' } }

            it 'returns type code 422' do 
                expect(response).to have_http_status(422)
            end

            it 'returns a validation failure message' do
                expect(response.body)
                    .to match(/Validation failed: Name can't be blank/)
            end
        end
    end

    # Test suite for PUT /types/:id
    describe 'PUT /types/:id' do
        let(:valid_attributes) {{ name: 'Expense' }}

        context 'when the record exists' do
            before { put "/types/#{type_id}", params: valid_attributes}

            it 'updates the record' do
                expect(response.body).to be_empty
            end

            it 'returns types code 204' do
                expect(response).to have_http_status(204)
            end
        end
    end

    #Test suite for DELETE /types/:id
    describe 'DELETE /types/:id' do
        before { delete "/types/#{type_id}" }

        it 'returns type code 204' do
            expect(response).to have_http_status(204)
        end
    end
end