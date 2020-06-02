class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  has_many :orders
  def admin?
    if User.where(role: "admin").exists
      return true
    end
  end
  def clerk?
    if User.where(role: "clerk").exists
      return true
    end
  end
  def self.customer
    where("role = ?", "customer")
  end
  def self.clerk
    where("role = ?", "clerk")
  end
  def self.email(email)
    user = all.where("email = ?", email).exists? ? find_by(email: email) : false
  end
end
