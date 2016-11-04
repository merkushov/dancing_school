class User < ApplicationRecord
  has_secure_password

  def full_name
    self.last_name + " " + self.first_name
  end
end
