FactoryBot.define do
  factory :appointment do
    starts_at { "2021-08-21 19:50:06" }
    ends_at { "2021-08-21 19:50:06" }
    patient { nil }
    doctor { nil }
  end
end
