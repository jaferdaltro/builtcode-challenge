require 'rails_helper'

RSpec.describe "doctors/index", type: :view do
  it "displays all the doctors" do
    assign(:doctors, [
      Doctor.create!(:name => "slicer", :crm => "12345678", :crm_uf => "MA"),
      Doctor.create!(:name => "dicer",  :crm => "00345678", :crm_uf => "SP")
    ])
    
    allow(view).to receive_messages(:pagy_bootstrap_nav => nil)
    render

    expect(rendered).to match /slicer/
    expect(rendered).to match /dicer/
  end
end
