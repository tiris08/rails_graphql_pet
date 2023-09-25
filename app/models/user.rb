class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def send_password_reset
    self.password_reset_token = SecureRandom.hex
    self.password_reset_sent_at = Time.zone.now
    save!
  end
end
