FactoryGirl.define  do
  factory :job do
    title "Job 1"
    description "Lorem ipsum dolor sit amet"
    company_name "Company 1"
    company_url "http://example.com"
    location "Skopje, Macedonia"
    expires_on Time.now + 1.year
    how_to_apply "Blah blah blah"
  end
end
