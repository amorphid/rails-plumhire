Fabricator(:company) do
  name { Faker::Company.name }
  user { Fabricate(:user) }
end
