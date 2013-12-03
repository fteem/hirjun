require "spec_helper"

describe "Visitor" do
  before :each do
    @job = FactoryGirl.create :job, author_email: 'author@example.com'
  end
  it 'can delete its job listing via delete link in email', js: true do
    open_email('author@example.com')
    expect(current_email).to have_body_text "Delete this job listing!"
    token = current_email.body.to_s[/confirm\/([^"]+)/, 1]
    visit remove_listing_path(token)
    expect(page).to have_content 'Your job listing has been deleted!'
  end
end
