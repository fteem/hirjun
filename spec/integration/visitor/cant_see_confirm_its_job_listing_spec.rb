require "spec_helper"

describe "Visitor" do
  it 'can confirm a job listing' do
    job_title = "JUNIOR WEB DEVELOPER WANTED!"

    visit root_path
    click_link 'Post a job!'
    fill_in "Company name", with: "ACME Inc."
    fill_in "Company url", with: 'http://acme.inc'
    fill_in "Location", with: "Skopje, Macedonia"
    fill_in "Additional info", with: "We preffer if the candidate would be working on a Mac"
    fill_in "job_title", with: job_title
    check "job_remote_work"
    fill_in "How to apply", with: "Send an email to hr@acme.inc"
    fill_in "job_description", with: "Lorem ipsum dolor sit amet..."
    fill_in "job_author_email", with: "wile-e-coyote@acme.inc"
    click_button "Publish job"

    token = open_last_email.body.to_s[/confirm\/([^"]+)/, 1]
    visit confirm_job_path(token)

    p page.body

    expect(page).to have_content "Your job listing has been confirmed. Thank you!"
  end
end
