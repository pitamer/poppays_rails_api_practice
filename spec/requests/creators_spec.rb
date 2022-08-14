require 'rails_helper'

RSpec.describe "Creators", type: :request do
  describe 'GET endpoint for multiple results' do
    before do
      @creator = Creator.create(first_name: "Tuco", last_name: "Salamanca")
      get '/creators'
    end

    it 'is successful' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all creators' do
      parsed_body = JSON.parse(response.body)

      expect(parsed_body["data"][0]["attributes"]["first_name"]).to be_eql @creator.first_name
      expect(parsed_body["data"][0]["attributes"]["last_name"]).to be_eql @creator.last_name
    end
  end

  describe 'GET endpoint for specific result' do
    before do
      @creator = Creator.create(first_name: 'Mike', last_name: 'Ehrmantraut')
      get "/creators/#{@creator.id}"
    end

    it 'is successful' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the requested creator' do
      parsed_body = JSON.parse(response.body)

      expect(parsed_body["data"]["id"]).to be_eql @creator.id.to_s
      expect(parsed_body["data"]["attributes"]["first_name"]).to be_eql @creator.first_name
      expect(parsed_body["data"]["attributes"]["last_name"]).to be_eql @creator.last_name
    end
  end

  describe 'POST endpoint' do
    before do
      @first_name = "Lydia"
      @last_name = "Rodarte-Quayle"

      post '/creators', params: {
        first_name: @first_name,
        last_name: @last_name,
      }
    end

    it 'is successful' do
      expect(response).to have_http_status(:success)
    end

    it 'creates a new creator' do
      creator = Creator.find_by(first_name: @first_name)
      expect(creator).to be_a Creator
      expect(creator.first_name).to be_eql @first_name
      expect(creator.last_name).to be_eql @last_name
    end
  end
end
