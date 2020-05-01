class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  def admin?
    User.where(role: "admin")
  end
  def clerk?
    User.where(role: "clerk")
  end
  def customer?
    User.where(role: "customer")
  end
end
