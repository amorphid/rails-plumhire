Fabricator(:application) do
  email { Faker::Internet.email }
  job   { Fabricate(:job) }
  name  { Faker::Name.name }
  phone { Faker::PhoneNumber.phone_number }
end
