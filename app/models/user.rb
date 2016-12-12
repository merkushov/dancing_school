class User < ApplicationRecord
  has_secure_password

  # has_and_belongs_to_many :prices

  def full_name
    self.last_name + " " + self.first_name
  end
end
