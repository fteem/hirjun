FactoryGirl.define  do
  factory :job do
    title "Job 1"
    description "Lorem ipsum dolor sit amet"
    company_name "Company 1"
    company_url "http://example.com"
    location "Skopje, Macedonia"
    how_to_apply "Blah blah blah"
    author_email 'john@doe.com'
    confirmed true
  end
end
