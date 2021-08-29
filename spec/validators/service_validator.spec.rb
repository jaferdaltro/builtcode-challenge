require "rails_helper"

class Validatable
  include ActiveModel::Validations
  attr_accessor :start, :end
  validates :start, :end, service: true
end


describe ServiceValidator do
  subject { Validatable.new }
  context "consult have to be in commercial time" do
    before { subject.start = DateTime.new(2000,1,1,10,0), subject.end = DateTime.new(2000,1,1,10,0) }
    expect(subject.valid?).to be_truthy  
  end

end