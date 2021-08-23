require 'rails_helper'

RSpec.describe "doctors/new.html.erb", type: :view do
  it "infers the controller path" do
    expect(controller.request.path_parameters[:controller]).to eq("doctors")
    expect(controller.controller_path).to eq("doctors")
  end

  it "infers the controller action" do
    expect(controller.request.path_parameters[:action]).to eq("new")
  end
end
