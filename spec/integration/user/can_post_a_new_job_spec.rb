require 'spec_helper'

describe "User" do
  it 'can post a new job' do
    visit '/'
    click_link 'Post a job!'
    expect(page).to have_content "Hey there!"
    expect(page).to have_content "Thanks for deciding to give a junior a chance! Let's create this job ad!"
  end
end
