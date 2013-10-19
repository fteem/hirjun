require 'spec_helper'

describe JobAd do
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_most(100) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:country) }
  end
end
