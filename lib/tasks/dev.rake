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
end