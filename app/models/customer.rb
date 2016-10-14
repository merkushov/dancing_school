class Customer < ApplicationRecord

  def full_name
    self.last_name + " " + self.first_name + " " + self.middle_name
  end

  before_save do
    self.phone_mobile = self.phone_mobile.gsub!(/\D/, "")
  end
end
