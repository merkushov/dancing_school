class Customer < ApplicationRecord
  before_save do
    self.phone_mobile = self.phone_mobile.gsub!(/\D/, "")
  end
end
