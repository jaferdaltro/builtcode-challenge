FactoryBot.define do
    factory :doctor do
    name { Faker::Name.name }
    crm { Faker::Number.number(digits: 10) }
    crm_uf { %i(CE RJ SP RS MG BA SC PB).sample }
    end
  end

  