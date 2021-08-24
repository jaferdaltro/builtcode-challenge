require 'rails_helper'

RSpec.describe Patient, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:birth_date) }
  it { is_expected.to validate_presence_of(:cpf) }
  
  it { is_expected.to validate_uniqueness_of(:cpf).case_insensitive }

  it { is_expected.to have_many(:appointments)}
  it { is_expected.to have_many(:doctors).through(:appointments) }

  it "can't have invalid cpf" do
    subject.cpf = ['00000000000', '11111111111', '33333333333'].sample
    subject.valid?
    expect(subject.errors.attribute_names).to include :cpf  
  end

  it "accept valid cpf" do
    subject.cpf = CPF.generate
    subject.valid?
    expect(subject.errors.attribute_names).to_not include :cpf  
  end

end
