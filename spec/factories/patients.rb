FactoryBot.define do
  factory :patient do
    name { Faker::Name.name  }
    birth_date { Faker::Date.between(from: '1970-09-23', to: '2010-09-25') }
    cpf {CPF.generate }
  end
end
