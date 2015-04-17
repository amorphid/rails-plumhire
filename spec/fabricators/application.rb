Fabricator(:application) do
  email { Faker::Internet.email }
  job
  name  { Faker::Name.name }
  phone { Faker::PhoneNumber.phone_number }
end
