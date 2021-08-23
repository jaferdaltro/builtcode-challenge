require 'rails_helper'

RSpec.describe "doctors/index", type: :view do
  it "displays all the doctors" do
    assign(:doctors, [
      Doctor.create!(:name => "slicer", :crm => "12345678", :crm_uf => "MA"),
      Doctor.create!(:name => "dicer",  :crm => "00345678", :crm_uf => "SP")
    ])

    render

    expect(rendered).to match /slicer/
    expect(rendered).to match /dicer/
  end
end
