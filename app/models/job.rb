class Job < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  validates :company_name, presence: true
  validates :company_url, presence: true
  validates :location, presence: true
  validates :how_to_apply, presence: true
  validates :expires_on, presence: true
end
