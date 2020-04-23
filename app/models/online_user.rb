class OnlineUser < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true
  has_secure_password
end
