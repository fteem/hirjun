require 'spec_helper'

describe "User" do
  it 'can post a new job ad' do
    visit '/'
    click_link 'Post a new job'
    expect(page).to have_content "Hey there!"
    expect(page).to have_content "Please fill in the form below."
  end
end
