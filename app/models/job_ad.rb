class JobAd < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  validates :company, presence: true
  validates :country, presence: true
end
