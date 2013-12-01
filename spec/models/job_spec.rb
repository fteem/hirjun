require 'spec_helper'

describe Job do
  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should ensure_length_of(:title).is_at_most(100) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:company_name) }
    it { should validate_presence_of(:company_url) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:author_email) }
    it do
      should allow_value('john@doe.com').for(:author_email)
      should_not allow_value('lorem_ipsum').for(:author_email)
    end
  end

  describe 'Callbacks' do
    it 'generates a random string for confirmation_token' do
      job = FactoryGirl.create :job
      expect(job.confirmation_token).to_not be_nil
    end

    it 'sends an email with confirmation link to author' do
      job = FactoryGirl.create :job, author_email: 'ile@eftimov.net'
      email = ActionMailer::Base.deliveries.last
      expect(email.to).to eq ['ile@eftimov.net']
      expect(email.from).to eq ['no-reply@hirejuniors.com']
      expect(email.subject).to eq 'Please confirm your job listing on HireJuniors'
    end
  end
end
