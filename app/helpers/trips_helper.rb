module TripsHelper

  def month_collector
    months = (1..12).to_a
    return months
  end

  def day_collector
    days = (1..31).to_a
    return days
  end

  def year_collector
    years = (1900..2023).to_a
    return years
  end

end
