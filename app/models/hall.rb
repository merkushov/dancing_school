class Hall < ApplicationRecord
  belongs_to :location

  def full_name
    self.location.name + " (" + self.name + ")"
  end
end
