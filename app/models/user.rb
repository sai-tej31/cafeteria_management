class User < ActiveRecord::Base
  def admin
    User.where(role: "admin")
  end
  def clerk
    User.where(role: "clerk")
  end
  def customer
    User.where(role: "customer")
  end
end
