require 'rails_helper'

RSpec.describe "Appointments", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/appointments/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/appointments/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/appointments/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/appointments/update"
      expect(response).to have_http_status(:success)
    end
  end

end
