require 'rails_helper'

RSpec.describe "Gigs", type: :request do
  describe 'GET endpoint for multiple results' do
    before do
      creator = Creator.create(first_name: 'Skyler', last_name: 'White')
      Gig.create(brand_name: 'A1A Car Wash', creator_id: creator.id)
      get '/gigs'
    end

    it 'is successful' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all gigs' do
      parsed_body = JSON.parse(response.body)

      expect(parsed_body["data"][0]["attributes"]["brand_name"]).to be_eql "A1A Car Wash"
      expect(parsed_body["data"][0]["attributes"]["state"]).to be_eql "applied"
    end
  end

  describe 'GET endpoint for specific result' do
    before do
      @creator = Creator.create(first_name: 'James', last_name: 'McGill')
      @gig = Gig.create(brand_name: 'Saul Goodman & Associates', creator_id: @creator.id)

      get "/gigs/#{@gig.id}"
    end

    it 'is successful' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the requested gig' do
      parsed_body = JSON.parse(response.body)

      expect(parsed_body["data"]["id"]).to be_eql @gig.id.to_s
      expect(parsed_body["data"]["attributes"]["brand_name"]).to be_eql @gig.brand_name
      expect(parsed_body["data"]["attributes"]["state"]).to be_eql "applied"
    end
  end

  describe 'POST endpoint' do
    before do
      @creator = Creator.create(first_name: 'Ed', last_name: 'Galbraith')
      post '/gigs', params: {
        brand_name: 'Best Quality Vacuum',
        creator_id: @creator.id,
      }
    end

    it 'is successful' do
      expect(response).to have_http_status(:success)
    end

    it 'creates a new gig' do
      gig = Gig.find_by(brand_name: 'Best Quality Vacuum')
      expect(gig).to be_a Gig
      expect(gig.brand_name).to be_eql "Best Quality Vacuum"
      expect(gig.creator_id).to be_eql @creator.id
    end
  end

  describe 'PUT endpoint' do
    before do
      @creator = Creator.create(first_name: 'Eladio', last_name: 'Vuente')
      @gig = Gig.create(brand_name: 'The Cartel', creator_id: @creator.id)

      put "/gigs/#{@gig.id}", params: {
        gig: {
          state: "completed",
        }
      }
    end

    it 'is successful' do
      expect(response).to have_http_status(:success)
    end

    it 'updates the requested gig' do
      gig = Gig.find_by(id: @gig.id)

      expect(gig.state).to be_eql "completed"
    end
  end
end
