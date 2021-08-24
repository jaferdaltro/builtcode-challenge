require 'rails_helper'

RSpec.describe "Patients", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/patients"
      expect(response).to have_http_status(:success)
    end
  end

end
