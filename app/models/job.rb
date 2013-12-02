require 'securerandom'
class Job < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  scope :confirmed, -> { where(confirmed: true) }
  scope :unconfirmed, -> { where(confirmed: false) }

  before_create :generate_token
  after_create :send_confirmation_email

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, :company_name, :company_url, :location, :how_to_apply, :author_email, presence: true
  validates :author_email, email: true

  def confirm!
    self.confirmed = true
    self.save!
  end

  private
  def generate_token
    self.confirmation_token = SecureRandom.hex
  end

  def send_confirmation_email
    JobsMailer.confirmation_email(self).deliver
  end
end
