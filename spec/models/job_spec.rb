require 'spec_helper'

describe Job do
  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should ensure_length_of(:title).is_at_most(100) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:company_name) }
    it { should validate_presence_of(:company_url) }
    it { should validate_presence_of(:location) }
  end
end
