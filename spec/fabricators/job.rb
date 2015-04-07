Fabricator(:job) do
  company { Fabricate(:company) }
  description { Faker::Lorem.paragraphs }
  title { Faker::Lorem.sentence }
end
