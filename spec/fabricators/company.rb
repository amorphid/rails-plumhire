Fabricator(:company) do
  name { Faker::Company.name }
  user { current_user }
end
