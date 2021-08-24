namespace :dev do
  desc "Insert doctors"
  task add_doctors: :environment do
    30.times do |i|
      Doctor.create!(
        name: Faker::Name.name,
        crm: Faker::Number.number(digits: 10),
        crm_uf: %i(CE RJ SP RS MG BA SC PB).sample 
      )
    end
  end

  desc "Insert patients"
  task add_patients: :environment do
    100.times do |i|
      Patient.create!(
        name: Faker::Name.name,
        cpf: CPF.generate,
        birth_date: Faker::Date.between(from: '1949-09-23', to: '2014-09-25')
      )
    end
  end

end