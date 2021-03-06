module ApplicationHelper

  def age(dob)
    return "" unless dob

    now = Time.now.utc.to_date
    return now.year - dob.year - (
      ( now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1
    )
  end

end
