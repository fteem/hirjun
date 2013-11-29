class Job < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, :company_name, :company_url, :location, :how_to_apply, :author_email, presence: true
  validates :author_email, email: true
end
