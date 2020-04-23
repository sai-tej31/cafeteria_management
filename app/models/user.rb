class User < ActiveRecord::Base
  def self.admin
    User.where(role: "admin")
  end
  def self.clerk
    User.where(role: "clerk")
  end
  def self.customer
    User.where(role: "customer")
  end
end
