require 'rails_helper'

RSpec.describe 'Status API', type: :request do
    # initialize test data 
    let!(:status_list) { create_list(:status, 10) }
    let(:status_id) { status_list.first.id }

    # Test suite for GET/Status
    describe 'GET /status' do
        # make HTTP get request before each example
        before { get '/status' }

        it 'returns status' do
          # Note `json` is a custom helper to parse JSON responses
          expect(json).not_to be_empty
          expect(json.size).to eq(10)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Test suite for GET /status/:id
    describe 'GET /status/:id' do
        before {get "/status/#{status_id}"}

        context 'when the record exists' do
            it 'returns the status' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(status_id)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the record does not exist' do
            let(:status_id) {100}

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find Status/)
            end
        end
    end

    # Test suite for POST /status
    describe 'POST /status' do
        #valid payload
        let(:valid_attributes) {{ name: 'My Status'}}

        context 'when the request is valid' do
            before { post '/status', params: valid_attributes }

            it 'creates a status' do
                expect(json['name']).to eq('My Status')
            end

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the request is invalid' do
            before { post '/status', params: { name: '' } }

            it 'returns status code 422' do 
                expect(response).to have_http_status(422)
            end

            it 'returns a validation failure message' do
                expect(response.body)
                    .to match(/Validation failed: Name can't be blank/)
            end
        end
    end

    # Test suite for PUT /transactions/:id
    describe 'PUT /status/:id' do
        let(:valid_attributes) {{ name: 'Amazing Skill' }}

        context 'when the record exists' do
            before { put "/status/#{status_id}", params: valid_attributes}

            it 'updates the record' do
                expect(response.body).to be_empty
            end

            it 'returns status code 204' do
                expect(response).to have_http_status(204)
            end
        end
    end

    #Test suite for DELETE /status/:id
    describe 'DELETE /status/:id' do
        before { delete "/status/#{status_id}" }

        it 'returns status code 204' do
            expect(response).to have_http_status(204)
        end
    end
end