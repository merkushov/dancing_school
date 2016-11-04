class Visit < ApplicationRecord
  belongs_to :class_schedule
  belongs_to :customer

  validates :class_schedule_id, uniqueness: {
    scope: :customer_id,
    message: "Одно занятие можно посетить только один раз"
  }
end
