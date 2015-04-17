Fabricator(:job) do
  company
  description { Faker::Lorem.paragraphs }
  title       { Faker::Lorem.sentence }
  user        { current_user }
end
